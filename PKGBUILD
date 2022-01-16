# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=chiaki-git
_gitname=chiaki
pkgver=2.1.1.r10.gdcd2e6a
pkgrel=1
pkgdesc="Unofficial PlayStation 4 remote play client"
arch=(i686 x86_64)
url="https://git.sr.ht/~thestr4ng3r/chiaki"
license=('AGPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'sdl2' 'opus' 'ffmpeg' 'openssl' 'gcc-libs')
makedepends=('git' 'cmake' 'python-protobuf' 'libva' 'python-setuptools')
optdepends=(
            'intel-media-driver: vaapi backend for Intel GPUs [>= Broadwell]'
            'libva-intel-driver: vaapi backend for Intel GPUs [<= Haswell]'
            'libva-vdpau-driver: vaapi backend for Nvidia and AMD GPUs'
            'libva-mesa-driver: alternative vaapi backend for AMD GPUs'
           ) # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
provides=('chiaki')
conflicts=('chiaki')
source=(git+"${url}")
md5sums=("SKIP")

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's:^v::;s:\([^-]*-g\):r\1:;s:-:.:g'
}

prepare() {
  cd ${_gitname}
  mkdir build
  git submodule update --init
}

build() {
  cd ${_gitname}/build
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="None"
  make
}

package() {
  cd ${_gitname}/build
  make DESTDIR="${pkgdir}" install
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  for lic in ../LICENSES/*; do
    install -m644 ${lic} "${pkgdir}/usr/share/licenses/${pkgname}/${lic##*/}"
  done
}
