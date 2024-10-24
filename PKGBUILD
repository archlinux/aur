# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=chiaki-ng
pkgver=1.9.0
_commit="cb979c551f8240094fd45ba7fd680e3b7ce38e37"
pkgrel=2
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
conflicts=('chiaki')
# Commits are signed but the pulic GPG key doesn't appear to be available anywhere, disable sig checking for now
#source=(git+"https://github.com/streetpea/${pkgname}.git?signed#commit=${_commit}")
#validpgpkeys=('BC3815EF2D94AB06')
source=(git+"https://github.com/streetpea/${pkgname}.git?commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}
  mkdir build
  # Remove curl submodule
  git rm third-party/curl
  # Fix curl lib name
  sed -i 's:libcurl_shared:libcurl:' lib/CMakeLists.txt
  # Initialize remaining submodules
  git submodule update --init
}

build() {
  cd ${pkgname}/build
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="None" -DCHIAKI_USE_SYSTEM_CURL="ON"
  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  for lic in ../LICENSES/*; do
    install -m644 ${lic} "${pkgdir}/usr/share/licenses/${pkgname}/${lic##*/}"
  done
}
