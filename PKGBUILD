# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=hancho
pkgver=0.0.1
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
  'https://raw.githubusercontent.com/aappleby/hancho/81c57cde7d09dfed0731f2506d2a6bb296515e5d/LICENSE'
)

sha512sums=(
  '36600d832d7a2726282b679cc89ac026c7e5c415919505e6adce4f7eba574eccab7105ddc09d05c655449ab6e0f92e78a85284f30d38b1685678bf7f6c7ff5ff'
  'c5048ded873a9c0b8a2a50bbbde763ecb6c8b32883ac793382570435080a150ef78e56238c7141aaf8f465cadaf1023cd19d1275d9df834e6aaf815081edc6d1'
)

prepare() {
  find "${srcdir}/${pkgname}-${pkgver}" -name .gitignore \
    -exec rm -v '{}' +
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CHECK_WD="$(pwd)"
  # shellcheck disable=SC2317
  hancho() { python "${CHECK_WD}/hancho.py"; }
  export CHECK_WD
  export -f hancho
  python ./hancho.py
  rm -rf examples/*/build
  rm -rf tutorial/build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Packaging the executable'
  install -D -m 755 -T 'hancho.py' "${pkgdir}/usr/bin/hancho"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" '../LICENSE'

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  cp -vR 'docs' 'tutorial' "${pkgdir}/usr/share/doc/${pkgname}/"

  echo >&2 'Packaging the examples'
  mkdir -pv "${pkgdir}/usr/share/${pkgname}"
  cp -vR 'examples' "${pkgdir}/usr/share/${pkgname}/"
}
