# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=chiaki-ng-git
_gitname=chiaki-ng
pkgver=1923_2025.12.12
pkgrel=1
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
        'qt6-webengine'
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
conflicts=('chiaki' 'chiaki-ng')
source=(git+"https://github.com/streetpea/${_gitname}.git")
sha256sums=('SKIP')


pkgver() {
  # New upstream 'weekly-canary' tag is long and ugly, use something less garish.
  cd ${_gitname}
  _date=$(git log -1 --date=short --pretty=format:%cd)
  _commits=$(git rev-list --count HEAD) # total commits is the most sane way of getting incremental pkgver
  printf "%s_%s\n" "${_commits}" "${_date}" | sed 's/-/./g'
}

prepare() {
  cd ${_gitname}
  mkdir build
  # Remove curl submodule
  git rm third-party/curl
  # Initialize remaining submodules
  git submodule update --init
}

build() {
  cd ${_gitname}/build
  export CFLAGS+=" -std=gnu17"
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
