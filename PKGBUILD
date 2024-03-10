# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=hancho
pkgver=0.0.2
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
  '35ec7cbeb196e6c2f6a89724a2e8713d1b2b78de20914bc99255062bf71639aa3a984caa7446de8f9cb97bfd96db9b741708fa8b9163185671cc7336205a0f2f'
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
