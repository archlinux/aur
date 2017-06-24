# Maintainer: Jannick Hemelhof <mister {dot} jannick {at} gmail {dot} com>
# Contributor: Nicola Squartini <tensor5 {at} gmail {dot} com>
# Contributor: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Dick Choi <fluke8259 {at} gmail {dot} com>
# Contributor: Romain Bazile <gromain {dot} baz {at} gmail {dot} com>
pkgname=boostnote
_pkgname=Boostnote
pkgver=0.8.11
_pkgver=v.0.8.11
pkgrel=1
pkgdesc="Open source note-taking app for programmers"
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
depends=('electron' 'nodejs')
makedepends=('npm' 'grunt-cli' 'git')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/BoostIO/"${_pkgname}"/archive/"${_pkgver}".tar.gz"
  "${pkgname}.js"
  "${pkgname}.desktop"
  "warning-fix.patch"
  )

sha512sums=(
  'bf3c640ced78c141299010012d75c2d391013446ec9f73ca5d7045112cad877a13094e9b6639b049f9e9d410652e46226717de363e0f74d880dd0549c1878fc7'
  'f0abbdcca34d7f74d3dc66ffc2d0995416e7708c715d55fa58c4c2abc31d191ea42f3434e3105292b4817f83ac0ca89f456f5f93007ae80ab2426c8941f615f9'
  '18bcda13580da8ceeaa86793a77ec00a053b8fd51451dad7e2b1a19553fe1a467ac647b44b789212e783f3f6a80968cc9404e884ef7ff6b1f6588473b3229d40'
  '64fb4c4823744322b5777736fc1792fb377e433608b5456cb0e0b7053507d104a1bbe3fdc6fe193b41dfddadc1943e8220a27e26ec6d4166704f3e61e2572437'
  )

prepare() {
  cd "${_pkgname}-${_pkgver}"

  patch -Np1 -i "${srcdir}/warning-fix.patch"
}

build() {
  cd "${_pkgname}-${_pkgver}"
  npm install --no-optional
  grunt compile
  # Kind of silly way of avoiding an npm warning
  npm uninstall eslint-config-standard
  npm prune --production
}

package() {
  cd "${_pkgname}-${_pkgver}"

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
