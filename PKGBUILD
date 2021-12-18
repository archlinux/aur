# Maintainer: dreieck
# Contributor: Tobias Rueetschi <tr@brief.li>

_pkgname='python-leo'
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.1.4+r26.20200714.da398f0
pkgrel=1
pkgdesc="Python library for leo dict, including command line executable 'leo'. Latest git checkout."
arch=('any')
url='https://github.com/keachi/python-leo'
license=('Apache')
group=()
depends=(
    'python'
    'python-beautifulsoup4'
    'python-lxml'
    'python-pre-commit'
    'python-requests'
)
optdepends=()
makedepends=(
    'git'
    'python'
    'python-setuptools'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
checkdepends=()
source=("${_pkgname}::git+git://github.com/keachi/python-leo.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '.')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1

    for _docfile in 'README.md' 'requirements.txt'; do
      install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
    done

    install -D -v -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_Apache-2.0.txt"
}
