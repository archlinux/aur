# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=cryptpad
pkgver=2026.10.1
pkgrel=2
pkgdesc="Realtime collaborative visual editor with zero knowledge server"
arch=(x86_64 aarch64)
url="https://github.com/$pkgname/$pkgname"
license=(AGPL-3.0-only)
depends=(glibc nodejs)
makedepends=(npm git unzip)
optdepends=('nginx: reverse proxy for HTTPS, configured in /etc/nginx/sites-available/cryptpad.conf'
  "certbot: certificates from Let's Encrypt"
  'certbot-nginx: certbot plugin to get and renew the certificates through nginx'
  'cryptpad-sso: single sign-on with OpenID Connect or SAML')
# The SSO plugin has to match CryptPad's version, 2026.10.0 needs 1.0.0 or later
conflicts=('cryptpad-sso<1.0.0')
backup=("etc/webapps/$pkgname/config.js"
  "etc/webapps/$pkgname/infra.js"
  "etc/webapps/$pkgname/customize/application_config.js"
  "etc/nginx/sites-available/$pkgname.conf")
# The only ELF files are sodium-native's prebuilt libraries, there's nothing to strip or debug
options=(!strip !debug)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "$pkgname.service"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles"
  migrate-infra.js
  build-pages
  cryptpad-build-pages.hook)
sha512sums=('badc8dbdf3d8f41db9a6cd2a71e239cf1ec53751645295515a038af868a64e0813918d41dd6c3952259ac687cd61901217edd5352153ad96d310fec8eb898816'
  '4df3fd9d41cda7a5f8c485f84835593fab5e52709a44a48ed03138542d9575585e10a7e2c09dcc0ce71d714e75b29d31b7a5e46760ec8a7c88cb68d8747bb80b'
  'cf7151157eb09f91ec01aa5bb638e427302d5f51d0cf41cd4aabcedd87bf5acb359f9d1491bb05d228c4fde8f8ee91b6e0bd1cb9ca901ecb285da0ac84519c49'
  'a99fc213cf580fee67dd0eac66d34cffc4abd0ce5971beb078f1edf40d31e942b4fcf0003c26e0e8439319f77131e875742037047f24dece1996dc45414fd97a'
  '7023d99f190a677305fca653daf9561073bf51cb48b4100a18e971d39f62dd0cfd8b23a5bea2bcd6f1939e456ae3b49c4ded4dfcb018ad1a0e46c182bc93f2a6'
  '08434764cff49edf85a0e477f6dcd9a0cfba02bc28c0eed29c41ec0a9615a2a82ae5f767e1d34b448dee74449db2d81bfd6eea495955bb1a7c67dbb1229a9485'
  '972ef0393e826d37c0f75724c788f55ea3a4634882991405668c5c9798e9e8bec74a2372d9d4a495b7cebbf7470be25fd2dab26fa5a7e0b8b34f469e9595f176')
b2sums=('87235962f80038d0e2c50ebbd82eb90a8afe4ac88989f19f1fb7bd855c324a7404e4a3331033d7357b1d1118a2f37276970ef372fc593015b06c510ceef174ad'
  'd47e504e0d5031a367ae201c46c9070c0a3555652e3d3d143cc84ee053db7ce3ffc5ac522c40c12cb6e27c8ce225a3604905d03253efd24d3eb4a6fa3b2e58fd'
  'd7f3bf88683288759ab6b0fc12c26d74563779b3fcc073c6e91f5e12ab6ce1167d1d5c5645956ba1f534445b67ef9eaa758e56b6fb3fa8206c61725f4507392e'
  '0e6916de61f4c7a932aa0491770c1e785af2fba5a83d4e11811c4a65ebc3644852b21cf24714fe5eb7655a7bad24a03d2f72b63ecf925e0cc1db98b40aed71c2'
  'dbe7ac2e3ae6533965ecf71bb0020fe3172cfe9e79ee94fc1abd8c89924243da094516787294ccbb2151a3f7abd5e727813b029fe1d9ae3b19bad441a62d9f91'
  '3e3bc77da9261a5b6384d7c23c687c775bdebea1cae5aa1813ea321be617fe038f5a6f483be634bcf327a8569438e2a7ba001d2081a639d3689c45b8ccad3529'
  '2324f41ad7160fdc47a23160b8fad2da3afcaf937cf37b59e454379ecd874bc2382cf3c8869f4248a2890401cd29a4d3be49e77f1014c178d80bbaec604807d4')

build() {
  cd "$pkgname-$pkgver" || exit
  # The dependencies without the devDependencies, with npm's cache in $srcdir
  export NODE_ENV=production
  npm ci --cache "$srcdir/npm-cache"
  # The libraries of the web app, copied from node_modules to www/components
  npm run install:components --cache "$srcdir/npm-cache"
  # The OnlyOffice editors for documents, spreadsheets and presentations, CryptPad's builds of them:
  # cloned from its onlyoffice-builds repository (git), x2t for the conversions from a zip (unzip)
  ./install-office.sh --accept-license

  # sodium-native has prebuilt libraries for every platform, only ours is needed. Of those, the .bare
  # files are for the Bare runtime, Node only loads the .node file.
  local _node_arch
  case "$CARCH" in
    x86_64) _node_arch=x64 ;;
    aarch64) _node_arch=arm64 ;;
  esac
  find node_modules/sodium-native/prebuilds -mindepth 1 -maxdepth 1 \
    ! -name "linux-$_node_arch" -exec rm -rf {} +
  find node_modules/sodium-native/prebuilds -name '*.bare' -delete

  # draw.io is served from www/components, its copy in node_modules is unused, as is its Java servlet
  # backend (WEB-INF)
  rm -rf node_modules/drawio www/components/drawio/src/main/webapp/WEB-INF
}

package() {
  cd "$pkgname-$pkgver" || exit

  # Documentation: upstream's docs folder (the architecture, examples for nginx, Caddy, Apache httpd,
  # systemd and FreeBSD), the readme, the changelog with the upgrade notes, and the security policy
  install -dm 755 "$pkgdir/usr/share/doc/$pkgname"
  cp -rt "$pkgdir/usr/share/doc/$pkgname" docs/.
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" readme.md CHANGELOG.md SECURITY.md

  # The server and the web app
  install -Dm 644 -t "$pkgdir/usr/share/webapps/$pkgname" package.json server.js
  cp -rt "$pkgdir/usr/share/webapps/$pkgname" customize.dist lib node_modules scripts src www

  # The configuration in /etc/webapps/cryptpad. config.js is upstream's example with the data in
  # /var/lib/cryptpad, the log files in /var/log/cryptpad and the log in the journal as well. The seds
  # here write into the package, so the sources stay upstream's when package() runs again.
  sed -e "s|\(Path: '\)\./|\1/var/lib/cryptpad/|" \
    -e "s|'/var/lib/cryptpad/data/logs'|'/var/log/$pkgname'|" \
    -e "s|logToStdout: false|logToStdout: true|" \
    config/config.example.js | install -Dm 644 /dev/stdin "${pkgdir}/etc/webapps/$pkgname/config.js"
  # infra.js has the addresses, ports and nodes of the server, split from config.js in 2026.10.0.
  # Without it, CryptPad would load infra.example.js from the configuration folder, which isn't there.
  # On upgrades from older packages, migrate-infra.js moves the settings of config.js to it while it's
  # still the example (see cryptpad.install).
  install -Dm 644 config/infra.example.js "${pkgdir}/etc/webapps/$pkgname/infra.js"
  install -Dm 644 -t "$pkgdir/usr/lib/$pkgname" config/infra.example.js "$srcdir/migrate-infra.js"

  # nginx: upstream's example with our paths, so it works once the domains are set
  # - the web app's static files as the root of the HTTPS server
  # - Let's Encrypt's HTTP challenges answered from the webroot /var/lib/letsencrypt
  #   (certbot certonly --webroot -w /var/lib/letsencrypt), where upstream includes a file of its own
  # - the certificates where certbot puts them
  # - the redirect of port 80 to HTTPS in a location: in the server, it would run before the
  #   location of the challenges and redirect them as well
  #   (https://github.com/cryptpad/cryptpad/pull/2448)
  sed -Ee 's|^( *)include letsencrypt-webroot;|\1location ^~ /.well-known/acme-challenge/ {\n\1    root /var/lib/letsencrypt;\n\1}|' \
    -e 's|^( *)return 301 (.*)$|\1location / {\n\1    return 301 \2\n\1}|' \
    -e 's|/etc/ssl/lets-encrypt/([^/]+)/cert;|/etc/letsencrypt/live/\1/fullchain.pem;|' \
    -e 's|/etc/ssl/lets-encrypt/([^/]+)/key;|/etc/letsencrypt/live/\1/privkey.pem;|' \
    -e "s|^( *)http2 on;|&\\n\\n\\1root /usr/share/webapps/$pkgname/www;|" \
    docs/example.nginx.conf | install -Dm 644 /dev/stdin "${pkgdir}/etc/nginx/sites-available/$pkgname.conf"

  # Customisations: CryptPad serves the files of customize/ instead of those of customize.dist/, so
  # it's a link to /etc/webapps/cryptpad/customize, not a folder in /usr. application_config.js is
  # upstream's starting point for the settings of the web app.
  install -Dm 644 customize.dist/application_config.js -t "$pkgdir/etc/webapps/$pkgname/customize"
  ln -s /etc/webapps/"$pkgname"/customize "$pkgdir/usr/share/webapps/$pkgname/customize"

  # The configuration folder the server loads config.js and infra.js from
  ln -s /etc/webapps/"$pkgname" "$pkgdir/usr/share/webapps/$pkgname/config"
  # The data in /var/lib/cryptpad, whose folders systemd-tmpfiles creates: some of the server's stores
  # use paths relative to its working directory (./data), others fall back to them
  ln -s /var/lib/"$pkgname"/{blob,block,data{,store}} "$pkgdir/usr/share/webapps/$pkgname"

  # The cryptpad user, the service, and the folders of the configuration, the data and the logs
  install -Dm 644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm 644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # The pages with the instance's metadata for link previews (upstream's npm run build), built on
  # request and again after upgrades once they've been built (see build-pages)
  install -Dm 755 "$srcdir/build-pages" "$pkgdir/usr/lib/$pkgname/build-pages"
  install -Dm 644 "$srcdir/cryptpad-build-pages.hook" "$pkgdir/usr/share/libalpm/hooks/cryptpad-build-pages.hook"
}
