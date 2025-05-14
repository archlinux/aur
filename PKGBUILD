# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Pieter Robyns (https://aur.archlinux.org/account/rpp0)
# Contributor: remspoor

# Upstream URL: https://github.com/rpp0/gr-lora
# Based on Yuval Adam <yuval at y3xz dot com>'s gr-gsm PKGBUILD

pkgname=gr-lora-git
_gitname=gr-lora
pkgver=0.6.2+60.r190.20211210.90343d4
pkgrel=3
pkgdesc="GNURadio blocks for receiving LoRa modulated radio messages using SDR"
arch=('any')
url="https://github.com/rpp0/gr-lora"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'gnuradio'
  'gmp'
  'libosmocore'
  'libvolk'
  'boost-libs'
  'liquid-dsp'
)
makedepends=(
  'boost'
  'cmake'
  'doxygen'
  'git'
  'log4cpp'
  'pybind11'
  'python>=3'
  'python-pygccxml'
  'swig'
)
provides=("gr-lora=${pkgver}")
conflicts=("gr-lora")
source=("${_gitname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  mkdir -p build
  cd "$_gitname"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "$_gitname"
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
  cmake -B build -S "${_gitname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_DOXYGEN=ON \
    -DENABLE_GRC=ON \
    -DENABLE_PYTHON=ON \
    -DENABLE_TESTING=ON \
    -DGRLORA_DEBUG=ON \
    -DHAS_MONGODB=OFF \
    -DVOLK_FOUND=ON
  make -C build
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_gitname}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/gr-lora" "AUTHORS" "MANIFEST.md" "README.md" "${srcdir}/git.log"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/gr-lora/LICENSE"
}
