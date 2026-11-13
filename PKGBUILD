# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sogo6-ui
pkgver=6.0.0alpha2
pkgrel=1
pkgdesc="Web interface of SOGo 6, the groupware for mail, calendars and contacts (alpha, not for production)"
arch=(x86_64 aarch64)
url="https://github.com/Alinto/SOGo6-UI"
license=(GPL-3.0-or-later)
depends=(glibc libgcc libstdc++ nodejs)
makedepends=(npm)
optdepends=('sogo6-server: the API server it talks to'
  'nginx: reverse proxy for the API and the web interface')
backup=(etc/sogo6/ui.conf)
# The only ELF files are sharp's prebuilt libraries (libvips), there's nothing to strip or debug
options=(!strip !debug)
_tag="v${pkgver/alpha/-alpha}"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
  ui.conf
  sogo6-ui.service
  sogo6-ui.sysusers)
sha512sums=('cd04c49bbc44144e6bd2befc6db5884bba9777fb2d4bf99211f11f80fb89eb0993cbd9939f7360f1fbf7574359b28dc468566c59f42c1ab7021ce214fcd3136c'
  'afcacea3a7a056a1b892d661ac51f0ed725ed4ccf5f2b86178af61e7648d27cfd39413560eb587d40904d345cbcb5a130a0f733c9f3175d7bf1fc5ba622340ba'
  '5b170b0b15c8ee1b2a093275e7b3bd9fb186fe6eb1b4270110bc86d11c2528252a2edae75d03ef52999f5a16ff3dd04547e631ce883a9d117b7d5093d6173970'
  '58e48e1773bcdcca97836812dd87740026b9b5edad12c14469471dd7373c460d9da1deec8d8fa084d64a08791587544bca8359dcf914bbc74e9e722980894143')
b2sums=('660254a45b9e953ff24cae404ddfd20b967328b41af2d581ad5d41516e3eb40967656b85e8b6e23ebd21a716e301750a9783a92bfb98aed76c8ebb2ce4c0907f'
  'b04ddcf57f6118ba54ad9a0018a345576beabc758592792de998a7ac91568b7b8c11be12d8a239cf17a0be8c96e40254436f741f1cf4d7354b9dbe9c4ee7e02e'
  'cf22936f5058f659ce966dcdf4c50b05fc954e81275a68a68c26e8c78b70930621197373865adfdebbb91175c91680bcc859753397e3a2cc76758da6a368cedd'
  'dc22c8f1f4b0385874267f56ec44747bbfce9352c8339d208363c7d18fca2c4fd4fa26d36dfc7e57b42e621d725ab43f269e8bbf496001cc29f2107f8fbaf5fc')

_srcname="SOGo6-UI-${_tag#v}"

build() {
  cd "$_srcname" || exit
  export NEXT_TELEMETRY_DISABLED=1
  # The prepare script installs husky's git hooks, which HUSKY=0 skips
  HUSKY=0 npm ci --cache "$srcdir/npm-cache"
  # Next.js' standalone output (next.config.mjs): the server with the node_modules it needs
  npm run build

  # sharp has prebuilt libraries for glibc and musl, only glibc's are needed
  rm -rf .next/standalone/node_modules/@img/*linuxmusl*
  # The standalone server's configuration has the build's folder; it's the installed one at runtime
  local _home=/usr/share/webapps/$pkgname
  sed -i "s|$PWD|$_home|g" .next/standalone/server.js .next/standalone/.next/required-server-files.json
}

check() {
  cd "$_srcname" || exit
  # formatMailTime's test (src/features/mails/components/mail/__tests__/utils.test.ts) expects the
  # local time of UTC+01:00, upstream's; .next has the build's copy of package.json, which jest
  # would take for a second module of the same name
  TZ=Europe/Paris npx jest --silent --coverage=false --modulePathIgnorePatterns '<rootDir>/.next/'
}

package() {
  cd "$_srcname" || exit

  # What upstream's Dockerfile copies: the standalone server, the static files, public and the
  # translations
  local _home=/usr/share/webapps/$pkgname
  install -dm 755 "$pkgdir$_home"
  cp -r .next/standalone/. "$pkgdir$_home/"
  cp -r .next/static "$pkgdir$_home/.next/"
  cp -r public "$pkgdir$_home/"
  install -dm 755 "$pkgdir$_home/src"
  cp -r src/messages "$pkgdir$_home/src/"
  # Next.js' cache (the optimised images) in the service's cache directory
  ln -s "/var/cache/$pkgname" "$pkgdir$_home/.next/cache"

  install -Dm 644 "$srcdir/ui.conf" "$pkgdir/etc/sogo6/ui.conf"
  install -Dm 644 "$srcdir/sogo6-ui.sysusers" "$pkgdir/usr/lib/sysusers.d/sogo6-ui.conf"
  install -Dm 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/sogo6-ui.service"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
