# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=chiaki-ng-git
_gitname=chiaki-ng
pkgver=1.9.0.r78.gc5246b05
pkgrel=1
pkgdesc="Unofficial PlayStation 4 remote play client"
arch=(i686 x86_64)
url="https://streetpea.github.io/chiaki-ng/"
license=('LicenseRef-AGPL-3.0-only-OpenSSL')
depends=(
        'curl'
        'ffmpeg'
        'fftw'
        'gcc-libs'
        'glibc'
        'hicolor-icon-theme'
        'hidapi'
        'json-c'
        'libidn2'
        'libplacebo'
        'libpsl'
        'libssh2'
        'miniupnpc'
        'openssl'
        'opus'
        'qt6-base'
        'qt6-declarative'
        'qt6-svg'
        'sdl2'
        'speexdsp'
        'zlib'
)
makedepends=(
        'git'
        'cmake'
        'python-protobuf'
        'python-setuptools'
)
optdepends=(
        'intel-media-driver: vaapi backend for Intel GPUs [>= Broadwell]'
        'libva-intel-driver: vaapi backend for Intel GPUs [<= Haswell]'
        'libva-vdpau-driver: vaapi backend for Nvidia and AMD GPUs'
        'libva-mesa-driver: alternative vaapi backend for AMD GPUs'
)       # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
provides=('chiaki')
conflicts=('chiaki' 'chiaki-ng')
source=(git+"https://github.com/streetpea/${_gitname}.git")
md5sums=("SKIP")

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's:^v::;s:\([^-]*-g\):r\1:;s:-:.:g'
}

prepare() {
  cd ${_gitname}
  mkdir build
  # Remove curl submodule
  git rm third-party/curl
  # Fix curl lib name
  sed -i 's:libcurl_shared:libcurl:' lib/CMakeLists.txt
  # Initialize remaining submodules
  git submodule update --init
}

build() {
  cd ${_gitname}/build
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="None" -DCHIAKI_USE_SYSTEM_CURL="ON"
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
