# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=chiaki-ng
pkgver=1.9.6
# commit IDs can be found at https://github.com/streetpea/chiaki-ng/releases
_commit="e57c8ed86332a2802991ac25ab2e2bf10a6312c3"
pkgrel=3
pkgdesc="Free and Open Source PlayStation Remote Play Client"
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
# Commits are signed but the pulic GPG key doesn't appear to be available anywhere, disable sig checking for now
#source=(git+"https://github.com/streetpea/${pkgname}.git?signed#commit=${_commit}")
#validpgpkeys=('B0050C45E5804C8D')
source=(git+"https://github.com/streetpea/${pkgname}.git#commit=${_commit}"
        nanopb.patch)
sha256sums=('SKIP'
            'dcf9f312289e9181fe8a4872534acfab1d51d03fd3ce0a2201a79c78018369b6')

prepare() {
  cd ${pkgname}
  mkdir build
  # Remove curl submodule
  git rm third-party/curl
  # Fix curl lib name
  sed -i 's:libcurl_shared:libcurl:' lib/CMakeLists.txt
  # Initialize remaining submodules
  git submodule update --init

  # Fix nanopb build failure (see https://protobuf.dev/news/2024-10-02/#reflection-methods )
  patch -p1 -i "${srcdir}/nanopb.patch"
}

build() {
  cd ${pkgname}/build
  export CFLAGS+=" -std=gnu17"
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="None" \
    -DCHIAKI_USE_SYSTEM_CURL="ON" -DCMAKE_POLICY_VERSION_MINIMUM=3.5
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
