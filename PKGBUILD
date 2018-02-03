# Maintainer: Jannick Hemelhof <mister {dot} jannick {at} gmail {dot} com>
# Contributor: Nicola Squartini <tensor5 {at} gmail {dot} com>
# Contributor: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Dick Choi <fluke8259 {at} gmail {dot} com>
# Contributor: Romain Bazile <gromain {dot} baz {at} gmail {dot} com>
pkgname=boostnote
_pkgname=Boostnote
pkgver=0.9.0
pkgrel=1
pkgdesc="Open source note-taking app for programmers"
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
depends=('electron' 'nodejs')
makedepends=('npm' 'grunt-cli' 'git')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/BoostIO/"${_pkgname}"/archive/v"${pkgver}".tar.gz"
  "${pkgname}.js"
  "${pkgname}.desktop"
  "warning-fix.patch"
  "remove-analytics.patch"
  )

sha512sums=('c66a5dededbd59dbc49fd8f3e2d4a342c2b8b9a0b8eab8af0eb72adf662ba89a4ab12c80e8d590a1b620841561407af61b8bc68f93bf1304609564adb52c66ba'
            'f0abbdcca34d7f74d3dc66ffc2d0995416e7708c715d55fa58c4c2abc31d191ea42f3434e3105292b4817f83ac0ca89f456f5f93007ae80ab2426c8941f615f9'
            '18bcda13580da8ceeaa86793a77ec00a053b8fd51451dad7e2b1a19553fe1a467ac647b44b789212e783f3f6a80968cc9404e884ef7ff6b1f6588473b3229d40'
            '415eb95c889eee8076cc92ea30058505f9f3c1b73b0bc9712b92ffc65ddb5be250e962b20449946be2fffccaf31153b9923fa63e11412525db33dbf1c3215974'
            '9fb045ab5ff47b898ee572c4805ca17180ccf332799c29f1e630c10c048f18a576502b5d0a555f833fa2afc16c5b0975a0da337eac24ea36d69c354821353df5')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/warning-fix.patch"
  patch -Np1 -i "${srcdir}/remove-analytics.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  npm install --no-optional
  grunt compile
  rm -r node_modules/
  npm install --production --no-optional
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
