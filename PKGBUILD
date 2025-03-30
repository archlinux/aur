# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=python-libpulse
pkgname="${_pkgname}-git"
pkgver=0.7.r56.20250223.f900adf
pkgrel=1
pkgdesc="Asyncio interface to the Pulseaudio and Pipewire pulse library."
arch=(
  'any'
)
url="https://gitlab.com/xdegaye/libpulse"
license=('MIT')
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
depends=(
  'python>=3.8'
  'python<4'
)
makedepends=(
  'git'
  'python-build'
  'python-flit-core>=3.2'
  'python-flit-core<4'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=()
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed -E -e 's|^pa-dlna-||' -e 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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

  python -m installer --destdir="${pkgdir}" dist/*.whl

  ### Remove file that gets ill-installed
  #rm -v "${pkgdir}/usr/LICENSE.txt"

  install -D -m644 -v -t "${pkgdir}/usr/share/doc/${_pkgname}" README.rst git.log
  install -D -m644 -v -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}

