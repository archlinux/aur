# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=hancho
pkgver=0.0.3
pkgrel=1
pkgdesc='Simple pleasant build system in Python'
arch=('any')
url='https://github.com/aappleby/hancho'
license=('MIT')
depends=('python')
checkdepends=('gtk3')
optdepends=(
  'gtk3: to build the included meson example'
)
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/aappleby/hancho/archive/${pkgver}.tar.gz"
)

sha512sums=(
  'c689a935da04329034ec8b875da3ec45e067277890f97ed5f659aadd98fdb8da1aa022ef72c8419a74e1637300aae4bdbd04f9bc39d81e2bfc7dd45a043b1562'
)

prepare() {
  find "${srcdir}/${pkgname}-${pkgver}" -name .gitignore \
    -exec rm -v '{}' +
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python ./hancho.py
  rm -rf examples/*/build
  rm -rf tutorial/build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Packaging the executable'
  install -D -m 755 -T 'hancho.py' "${pkgdir}/usr/bin/hancho"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  cp -vR 'docs' 'tutorial' "${pkgdir}/usr/share/doc/${pkgname}/"

  echo >&2 'Packaging the examples'
  mkdir -pv "${pkgdir}/usr/share/${pkgname}"
  cp -vR 'examples' "${pkgdir}/usr/share/${pkgname}/"
}
