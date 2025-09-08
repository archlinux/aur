# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname='python-libpcap'
pkgname="${_pkgname}-git"
pkgver=0.5.4.r144.20250904.2b27f78
pkgrel=1
pkgdesc="Python binding for the libpcap C library."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  "i686"
  "x86_64"
)
_githost='github.com'
_gituser='caizhengxin'
#url="https://${_githost}/${_gituser}/${_pkgname}"
url="https://pypi.org/project/libpcap/"
license=("custom: BSD")
depends=(
  'cython'
  'libpcap'
  'python>=3'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-mock'
  'python-sphinx'
  'python-sphinx_rtd_theme'
)
# checkdepends=(
#   # 'python-nose'
#   'python-pytest'
# )
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_pkgname}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' setup.cfg | tail -n1 | sed -E -e 's|^[^=]*=[[:space:]]*||' -e 's|,.*$||' | tr -d \'\")"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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

  cd docs
  make man
  make info
  make text
  make html
  make qthelp
  gzip -9 build/man/*
  gzip -9 build/texinfo/*.info
}

### 2023-07-25: `pytest` fails on importing the not-yet-installed module.
# check() {
#   cd "${srcdir}/${_pkgname}"
#   printf '%s\n' " --> running 'pytest' ..."
#   pytest
# }

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  for _docfile in "${srcdir}/git.log" CHANGELOG.rst README.rst; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in html qthelp text; do
    cp -rv "docs/build/${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docdir}"
  done
  install -D -v -m644 docs/build/man/python-libpcap.1.gz "${pkgdir}/usr/share/man/man1/python-libpcap.1.gz"
  install -D -v -m644 docs/build/texinfo/python-libpcap.info.gz "${pkgdir}/usr/share/info/python-libpcap.info.gz"

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}

