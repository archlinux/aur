# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Jiachen YANG <farseerfc at archlinux dot org>

_pkgname=libtg_owt
pkgname=${_pkgname}-git
pkgver=0.git.r325.10d5f4bf
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
        "libvpx::git+https://chromium.googlesource.com/webm/libvpx.git"
        "libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git"
        "pipewire::git+https://github.com/PipeWire/pipewire.git"
        "0001-fix-h265_pps_parser-fix-missing-cstdint-include.patch"
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'e123c6b8e3cc0445ee9d843ff018500ab1203e6e4fb966a2409275a238bb26903e7d635929aab075cf4d5ce2098d3d1f101f9d5c2b81c6fb24fdcd9ddf85443b')
provides=('libtg_owt')
conflicts=('libtg_owt')

pkgver(){
  cd tg_owt
  printf "0.git.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd tg_owt

  patch -p1 < "$srcdir/0001-fix-h265_pps_parser-fix-missing-cstdint-include.patch"

  git submodule init
  git config submodule.src/third_party/libvpx/source/libvpx.url "$srcdir"/libvpx
  git config submodule.src/third_party/libyuv.url "$srcdir"/libyuv
  git config submodule.src/third_party/pipewire.url "$srcdir"/pipewire
  git submodule update
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
