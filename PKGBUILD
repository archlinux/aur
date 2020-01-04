# Maintainer: Jannick Hemelhof <mister {dot} jannick {at} gmail {dot} com>
# Contributor: Nicola Squartini <tensor5 {at} gmail {dot} com>
# Contributor: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Dick Choi <fluke8259 {at} gmail {dot} com>
# Contributor: Romain Bazile <gromain {dot} baz {at} gmail {dot} com>
pkgname=boostnote
_pkgname=Boostnote
pkgver=0.14.0
pkgrel=1
pkgdesc="Open source note-taking app for programmers"
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
depends=('electron' 'nodejs')
makedepends=('yarn' 'grunt-cli' 'git')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/BoostIO/"${_pkgname}"/archive/v"${pkgver}".tar.gz"
  "${pkgname}.js"
  "${pkgname}.desktop"
  "warning-fix.patch"
  "remove-analytics.patch"
  "electron_5_fix.patch"
  )

sha512sums=('9889e44be9ee43d8c126687a03a799a2dba4cea39b53358d7017e67686e61532f8d96b58f097b55b188423bda7ae70e0b5030764cd13eb3a721e1ec27f7619c7'
            '1f0ccd2a3632a12c4714d97b9f909ddc94b53d6f86a9e4bdcab31abd55a93071a2c35c6e1e9527b747de6dd74b8a5276414980c11e174085f28b8f2d2721230a'
            '18bcda13580da8ceeaa86793a77ec00a053b8fd51451dad7e2b1a19553fe1a467ac647b44b789212e783f3f6a80968cc9404e884ef7ff6b1f6588473b3229d40'
            'a52e5631867e2c5f18465dee6a3201b9b5c546bda373205c4891c9f7b6114599e0854e2b49defb55ee7bea0778a7fde9c9d9f7271dceeeece743a2d72e2fd0c6'
            '64fdbeb288e4fff9cb68e3ff2cac6d462e203c33cb4c10fefa5ca32166cfa5c2098771ade5b0102daa48f05abe23b0ad6f253dc40a91bc53f41b38e999b935f9'
            'ad745b9643e9a677a2a3840c02c8dad7af33e35007141dbc33ff8f7c084b66bd1a794ef44340925fc9d6d77065f41709be56cc8ac55a978e7dc7d520cf8777bf')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/warning-fix.patch"
  patch -Np1 -i "${srcdir}/remove-analytics.patch"
  patch -Np1 -i "${srcdir}/electron_5_fix.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"

  yarn install --ignore-optional
  yarn run compile
  rm -r node_modules/
  yarn install --production --ignore-optional
}

package() {
  cd "${_pkgname}-${pkgver}"

  appdir="/usr/lib/${pkgname}"

  install -dm755 "${pkgdir}""${appdir}"
  cp -a * "${pkgdir}""${appdir}"

  install -Dm755 "${srcdir}/${pkgname}.js" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 resources/app.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

  # Remove stuff we do not need
  find "${pkgdir}"/usr/lib/"${pkgname}"/node_modules \
      -name "*.a" -exec rm '{}' \; \
      -or -name "*.bat" -exec rm '{}' \; \
      -or -name "*.node" -exec chmod a-x '{}' \; \
      -or -name "benchmark" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "html" -prune -exec rm -r '{}' \; \
      -or -name "man" -prune -exec rm -r '{}' \; \
      -or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
      -or -path "*/task-lists/src" -prune -exec rm -r '{}' \;
}
