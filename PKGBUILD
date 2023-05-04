# Maintainer: dreieck
# Contributor: robertfoster

_pkgname=python-soundcloud
pkgname="${_pkgname}-git"
pkgver=r113.20220506.e0f577a
pkgrel=1
pkgdesc="A Python wrapper around the Soundcloud API"
arch=("i686" "x86_64")
url="https://github.com/audiobridge/soundcloud-python"
license=("BSD")
depends=(
  "python-nose"
  "python-requests"
  "python-six"
)
makedepends=(
  "git"
  "python-setuptools"
)
checkdepends=(
  "python-fudge"
  "python-pytest"
)
optdepends=("python-simplejson")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+${url}.git")
sha256sums=("SKIP")

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  printf '%s' "r${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}

# check() {
#   cd "${srcdir}/${_pkgname}"
# 
#   python setup.py test
# }

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1

  install -D -v -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  install -D -v -m644 "README.rst" "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}

