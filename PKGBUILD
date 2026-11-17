# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=chiaki-ng
pkgver=1.10.1
# commit IDs can be found at https://github.com/streetpea/chiaki-ng/releases
_commit="f30da0a"
pkgrel=1
pkgdesc="Free and Open Source PlayStation Remote Play Client"
arch=(i686 x86_64)
url="https://streetpea.github.io/chiaki-ng/"
license=('LicenseRef-AGPL-3.0-only-OpenSSL')
depends=(
        'curl'
        'ffmpeg'
        'fftw'
        'glibc'
        'hicolor-icon-theme'
        'hidapi'
        'json-c'
        'libevent'
        'libgcc'
        'libplacebo'
        'libstdc++'
        'miniupnpc'
        'openssl'
        'opus'
        'qt6-base'
        'qt6-declarative'
        'qt6-svg'
        'qt6-webengine'
        'sdl2'
        'speexdsp'
)
makedepends=(
        'git'
        'cmake'
        'python-protobuf'
        'python-setuptools'
        'vulkan-headers'
)
optdepends=(
        'intel-media-driver: vaapi backend for Intel GPUs [>= Broadwell]'
        'libva-intel-driver: vaapi backend for Intel GPUs [<= Haswell]'
        'libva-vdpau-driver: vaapi backend for Nvidia and AMD GPUs'
        'libva-mesa-driver: alternative vaapi backend for AMD GPUs'
)       # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
provides=('chiaki')
conflicts=('chiaki')
# At time of writing, the dev's public key isn't available on keyservers, import from github using, e.g.
# curl -o - https://github.com/streetpea.gpg | gpg --import
validpgpkeys=('609B7D18288DF6E62624B0694569A5F4961E8ED9') # NOTE: upstream changed  keys for the 1.10.1 release, re-import from github
source=(git+"https://github.com/streetpea/${pkgname}.git?signed#commit=${_commit}")
sha256sums=('99280fb53e88e313dda370d1590f5d10b20236572220e1d75069550a6c4dc46a')

prepare() {
  cd ${pkgname}
  git submodule update --init
}

build() {
  cmake \
    -B build \
    -S ${pkgname} \
    -Wno-author \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE="None" \
    -DCHIAKI_USE_SYSTEM_CURL="ON"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  for lic in ${pkgname}/LICENSES/*; do
    install -m644 ${lic} "${pkgdir}/usr/share/licenses/${pkgname}/${lic##*/}"
  done
}
