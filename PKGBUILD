# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=hancho
pkgver=0.0.4
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
  '19678595e4dc5551764cbd2c5f96016ad38d955319aaff798bb15cfac4dffd5cc5cea23fc776924583bbe7f58e375febcc2b0db6c677b1e260c0acf4045ad942'
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
