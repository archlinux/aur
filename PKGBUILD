# Maintainer: Jannick Hemelhof <mister {dot} jannick {at} gmail {dot} com>
# Contributor: Nicola Squartini <tensor5 {at} gmail {dot} com>
# Contributor: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Dick Choi <fluke8259 {at} gmail {dot} com>
# Contributor: Romain Bazile <gromain {dot} baz {at} gmail {dot} com>
pkgname=boostnote
_pkgname=Boostnote
pkgver=0.8.7
pkgrel=4
pkgdesc="Open source note-taking app for programmers"
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
depends=('electron' 'nodejs')
makedepends=('npm' 'grunt-cli' 'git')

source=(
  "${pkgver}.tar.gz::https://github.com/BoostIO/"${_pkgname}"/archive/v"$pkgver".tar.gz"
  "${pkgname}.js"
  "${pkgname}.desktop"
  "warning-prune-fix.patch"
  )

sha512sums=(
  '400bcd5f2a2fa3c858c4e5ab8ce22c8f9669a5c1c0299724937f56534248e0517c8a814b7c2f2243c8492edbb50e96b2a2a2ce787f6566cbfec1741521d5261c'
  'f0abbdcca34d7f74d3dc66ffc2d0995416e7708c715d55fa58c4c2abc31d191ea42f3434e3105292b4817f83ac0ca89f456f5f93007ae80ab2426c8941f615f9'
  '18bcda13580da8ceeaa86793a77ec00a053b8fd51451dad7e2b1a19553fe1a467ac647b44b789212e783f3f6a80968cc9404e884ef7ff6b1f6588473b3229d40'
  '4b57a26cfa2bfb6e03c8c4c08f2ce2e6707cd95ad8c0593ef890cb3ae5d7d032169b829c4359b9663eb775ddd630fc4f93de515f89659a5877874eb5f23598ea'
  )

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/warning-prune-fix.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  npm install --no-optional
  grunt compile
  # Kind of silly way of avoiding an npm warning
  npm uninstall eslint-config-standard
  npm prune --production
}

package() {
  cd "${_pkgname}-${pkgver}"

  appdir="/usr/lib/${pkgname}"

  install -dm755 "${pkgdir}""${appdir}"
  cp -r * "${pkgdir}""${appdir}"

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

