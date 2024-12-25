# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ruben Kelevra <ruben@freifunk-nrw.de>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=etherpad-lite
pkgver=2.2.7
pkgrel=1
epoch=1
arch=(x86_64)
pkgdesc="Lightweight fork of etherpad based on javascript"
url="https://etherpad.org"
license=(Apache)
depends=(coffeescript nodejs pnpm)
makedepends=(npm pnpm)
optdepends=('sqlite: to use sqlite as databse'
            'mariadb: to use mariadb as database'
            'postgresql: to use postgresql as database'
            'abiword: advanced import/export of pads'
            'libreoffice: advanced import/export of pads'
            'tidy: improve quality of exported pads')
conflicts=(etherpad-lite-git)
backup=("etc/${pkgname}/settings.json"
        "etc/${pkgname}/credentials.json"
        "etc/${pkgname}/APIKEY.txt"
        "etc/${pkgname}/SESSIONKEY.txt")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ether/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf"
        "${pkgname}.service")
sha512sums=('cb5c498a7e2f4b7f7dbbef72073ce44f44b06684df8b4e6ff260daf779dbff38c7a7270c2cb87e2f6f671842a6c7b8d113dbce12e363ea98806a7b36fd55d9f2'
            '8c9093cc82acb814023b60eecffae7cb697abfa6193a68ca068f010baf3bf1e5f1678bdb862f4af370badbd71deb6a8499f61c8b6115d280477db1b3fd895dfd'
            'f1be6d7094ea0dd267fba21c7c64017de6a63974e193720100d49eba07170a078d43f0b76c96e6453b8e9e94cdc24b36fb7ab14218598d65d1455418daf9e447'
            '71dc92c02983914a6ad1bfa17ce1954a233b92bdafa41a2446ae9c8b2e513b8512a1b672c2fcd603d1cd33791d86621d5b293ce3b9f7266c0012a4a85bedaac0')
b2sums=('b2ffd7377d858ce3028fd9b8ee3c3c2aad7077905180fdad8460d4d7e91a26b7c6d8fd3d3d9a98bdbcfdf591a48dc03b244b5585e308f7bcc035dd4a7cea4c20'
        'cb519b7d749982d899037445be36dc54754c523ee7aaa3f7d005b4cea4dd74c1596535b17bfdd6910923e4f723ee02c625d579966a601b84ca1b1eeb82fe932e'
        '88f0f7b9bbc64b853e3169cc9627b64c4b5aaef7238553ed110f82ebd40e1f8b0078d17a69adee6a37f6d59f6eb0871fc209a1fb6e4b71b7ac5239071db2eec7'
        '16239ce8f8e1ccc6506932fdc30b27ea0d2904fbe45d46ea7c00e5c209c8d0069af500b524b8ed31a05645dc81c502ca46aa456468bd5e1ed79d2623234bbd73')

prepare() {
  cd "${pkgname}-${pkgver}"
  # create needed initializing file
  touch src/.ep_initialized
  # write dirty.db to StateDirectory by default
  sed -i 's/var\/dirty.db/\/var\/lib\/etherpad-lite\/dirty.db/g' \
    settings.json.template
  # create empty APIKEY.txt, SESSIONKEY.txt
  touch {APIKEY,SESSIONKEY}.txt
  # create a valid (but empty) credentials.json file
  echo "{}" > credentials.json
  # create a valid (but empty) plugins file
  echo "{}" > installed_plugins.json
  # create needed symlink because setup is weird
  mkdir -v node_modules && cd node_modules
  ln -vs ../src "ep_${pkgname}"
}

build() {
  cd "${pkgname}-${pkgver}"
  (
    cd src
    # required node modules
    echo "Installing with npm"
    pnpm install --cache "${srcdir}/npm-cache"
    pnpm audit || echo "pnpm audit output might return non-zero"
  )
  find . -type f \
          \( \
         -iname '*.1' -o \
         -iname '*.5' -o \
         -iname '*.7' -o \
         -iname '*info' -o \
         -iname '*.py' -o \
         -iname '*samples' \
         \) \
         -delete
  find . -type d \
          \( \
         -iwholename '*/man1' -o \
         -iwholename '*/man5' -o \
         -iwholename '*/man7' -o \
         -iwholename '*/man' \
         \) \
         -delete
}

package() {
  depends+=(libsecret-1.so)

  cd "${pkgname}-${pkgver}"
  # removing unneeded files and directories
  find src -type f \
          \( \
         -iname '*Dockerfile*' -o \
         -iname '*Makefile*' -o \
         -iname '*appveyor.yml' -o \
         -iname '*.babelrc' -o \
         -iname '*.bak' -o \
         -iname '*bower.json' -o \
         -iname '*.c' -o \
         -iname '*.cc' -o \
         -iname '*.cpp' -o \
         -iname '*.md' -o \
         -iname '*.markdown' -o \
         -iname '*.rst' -o \
         -iname '*.nycrc' -o \
         -iname '*.npmignore' -o \
         -iname '*.editorconfig' -o \
         -iname '*.el' -o \
         -iname '*.eslintignore' -o \
         -iname '*.eslintrc*' -o \
         -iname '*.fimbullinter.yaml' -o \
         -iname '*.gitattributes' -o \
         -iname '*.gitmodules' -o \
         -iname '*.h' -o \
         -iname '*.jshintrc' -o \
         -iname '*.jscs.json' -o \
         -iname '*.log' -o \
         -iname '*logo.svg' -o \
         -iname '*.nvmrc' -o \
         -iname '*.o' -o \
         -iname '*package-lock.json' -o \
         -iname '*.travis.yml' -o \
         -iname '*.prettierrc' -o \
         -iname '*.sh' -o \
         -iname '*.tags*' -o \
         -iname '*.tm_properties' -o \
         -iname '*.wotanrc.yaml' -o \
         -iname '*tsconfig.json' -o \
         -iname '*yarn.lock' \
         \) \
         -delete
  find src -type d \
          \( \
         -iwholename '*.github' -o \
         -iwholename '*.tscache' -o \
         -iwholename '*/man' -o \
         -iwholename '*/test' -o \
         -iwholename '*/scripts' -o \
         -iwholename '*/git-hooks' \
         \) \
         -exec rm -rvf {} +
  find src -empty -type d -delete
  # install initialization file
  install -vDm 644 "src/.ep_initialized" -t "${pkgdir}/usr/share/${pkgname}/src/"
  install -vDm 644 "installed_plugins.json" -t "${pkgdir}/usr/share/${pkgname}/var/"
  # node modules
  cp -av node_modules "${pkgdir}/usr/share/${pkgname}/"
  # protect configuration directory with restrictive permission
  install -vdm 755 "${pkgdir}/etc/${pkgname}"
  install -vdm 755 "${pkgdir}/etc/${pkgname}/no-skin"
  # custom js and css templates
  install -vDm 644 "src/static/skins/no-skin/"*.{css,js} -t "${pkgdir}/etc/${pkgname}/no-skin"
  rm -rv src/static/skins/no-skin/
  # move sources
  cp -av src/* "${pkgdir}/usr/share/${pkgname}/src/"
  # symlink directory for custom css and js
  ln -vs "/etc/${pkgname}/no-skin/" "${pkgdir}/usr/share/${pkgname}/src/static/skins/"
  # configuration
  install -vDm 640 settings.json.template "${pkgdir}/etc/${pkgname}/settings.json"
  install -vDm 640 credentials.json -t "${pkgdir}/etc/${pkgname}"
  install -vDm 640 {APIKEY,SESSIONKEY}.txt -t "${pkgdir}/etc/${pkgname}"
  # symlink configuration files
  ln -vs "/etc/${pkgname}/credentials.json" "${pkgdir}/usr/share/${pkgname}/credentials.json"
  ln -vs "/etc/${pkgname}/SESSIONKEY.txt" "${pkgdir}/usr/share/${pkgname}/SESSIONKEY.txt"
  ln -vs "/etc/${pkgname}/APIKEY.txt" "${pkgdir}/usr/share/${pkgname}/APIKEY.txt"
  # systemd service
  install -vDm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  # systemd-sysusers
  install -vDm 644 "${srcdir}/${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  # systemd-tmpfiles
  install -vDm 644 "${srcdir}/${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  # docs
  install -vDm 644 {CHANGELOG,CONTRIBUTING,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
