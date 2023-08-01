# Maintainer:  dreieck
# Contributor: Tobias Rueetschi

_pkgname='python-leo'
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.1.4.r26.20200714.da398f0
pkgrel=3
pkgdesc="Python library for leo dict, including command line executable 'leo'. Latest git checkout."
arch=('any')
url='https://github.com/keachi/python-leo'
license=('Apache')
group=()
depends=(
    'python>=3'
    'python-beautifulsoup4>=4.3.0'
    'python-requests>=1.2.3'
)
optdepends=(
  'python-vlc: To play pronounciations.'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-lxml>=4.2.4'
    # 'python-pre-commit>=1.10.5'
    'python-wheel'
)
provides=(
  "${_pkgname}=${pkgver}"
  "leo-dict-cli=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "leo-dict-cli"
)
checkdepends=()
source=("${_pkgname}::git+${url}.git")
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
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
    cd "${srcdir}/${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}"
    python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

    for _docfile in 'README.md'; do
      install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
    done

    install -D -v -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_Apache-2.0.txt"
}
