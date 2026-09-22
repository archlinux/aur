# Maintainer:  dreieck
# Contributor: Tobias Rueetschi

_pkgname='python-leo'
pkgname="${_pkgname}-git"
epoch=1
pkgver=1.1.r27.20260802.08267d4
pkgrel=1
pkgdesc="Python library for leo dict, including command line executable 'leo'. Latest git checkout."
arch=('any')
url='https://github.com/andiwand/python-leo'  # Original
license=('Apache-2.0')
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
    #'python-pre-commit>=1.10.5'
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

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  #_ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '.')"
  _ver="$(python setup.py --version 2>/dev/null)"
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
