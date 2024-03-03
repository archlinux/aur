# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Jiachen YANG <farseerfc at archlinux dot org>

_pkgname=libtg_owt
pkgname=${_pkgname}-git
pkgver=0.git.r397.afd9d5d3
pkgrel=1
pkgdesc='WebRTC library - static linked, git version'
arch=('x86_64')
url='https://github.com/desktop-app/tg_owt'
license=('BSD')
depends=('protobuf')
makedepends=('git' 'unzip' 'cmake' 'protobuf' 'libxrandr' 'libxcomposite' 'openssl' 'glibc'
             'ffmpeg' 'libva' 'opus' 'yasm' 'libjpeg-turbo' 'pipewire' 'libxtst' 'abseil-cpp' 'libepoxy')
options=('staticlibs')
source=("tg_owt::git+${url}.git"
        "abseil-cpp::git+https://github.com/abseil/abseil-cpp.git"
        "crc32c::git+https://github.com/google/crc32c.git"
        "libsrtp::git+https://github.com/cisco/libsrtp.git"
        "libyuv::git+https://gitlab.com/chromiumsrc/libyuv.git"
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')
provides=('libtg_owt')
conflicts=('libtg_owt')

pkgver(){
  cd tg_owt
  printf "0.git.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd tg_owt

  git submodule init
  git config submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
  git config submodule.src/third_party/crc32c/src.url "$srcdir/crc32c"
  git config submodule.src/third_party/libsrtp.url "$srcdir/libsrtp"
  git config submodule.src/third_party/libyuv.url "$srcdir/libyuv"
  git -c protocol.allow=never -c protocol.file.allow=always submodule update
}

build() {
  # Upstream stated that only static builds are really supported so that's what we'll do.
  # https://github.com/desktop-app/tg_owt/issues/75#issuecomment-992061171
  cmake -B build -S tg_owt \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=OFF
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}/" install

  install -Dm644 tg_owt/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
