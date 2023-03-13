# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=edgegpt
pkgname="${_pkgname}-git"
pkgver=0.0.56.1.r144.20230313.2724ce1
pkgrel=1
pkgdesc="The reverse engineering the chat feature of the new version of Bing."
arch=(
  'any'
)
url="https://github.com/acheong08/EdgeGPT"
license=('custom: public domain')
depends=(
  'python>=3'
  'python-argparse'
  'python-requests'
  'python-tls-client'
  'python-websockets'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  # 'python-setuptools'
  'python-wheel'
)
provides=(
  "${_pkgname}=${pkgver}"
  "python-edgegpt=${pkgver}"
  "python-edgegpt-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-edgegpt"
)
replaces=()
source=(
  "${_pkgname}::git+${url}.git"
  'edgegpt.sh'
)
sha256sums=(
  'SKIP'
  'ede2493e322666e51e97462c9ad5542f9f618fadb371672e4c2526f400e984b7'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -v -m755 "${srcdir}/edgegpt.sh"          "${pkgdir}/usr/bin/edgegpt"

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in example.env README.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
