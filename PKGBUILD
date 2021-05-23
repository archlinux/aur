# Maintainer:  Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=rpan-studio
pkgver=26.0.2.1+rpan
pkgrel=1
pkgdesc="Free, open source software for RPAN live streaming"
conflicts=("obs-studio")
replaces=("obs-studio")
provides=("obs-studio")
arch=('x86_64')
url="https://github.com/reddit/rpan-studio"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
         'qt5-svg' 'qt5-websockets' 'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache')
makedepends=('cmake' 'git' 'libfdk-aac' 'libxcomposite' 'x264' 'vlc' 'swig' 'python' 'luajit')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'vlc: VLC Media Source support')
_commit=e1782332c75ecb2f774343258ff509788feab7ce  # tags/26.0.2.1+rpan
source=("git+https://github.com/reddit/rpan-studio.git#commit=${_commit}"
        "fix_python_binary_loading.patch")
sha512sums=('SKIP'
            '93ad704cef425073b417d1ed95e076f688a6e45cdf589472c65e437d77297303f31dd8f15c7d5e30f83276a6396b732dfb5a695db9c773911aaa0423c5262177')
         
pkgver() {
  cd rpan-studio
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd ${pkgname}
  git apply -3 "${srcdir}/fix_python_binary_loading.patch"
}

build() {
  cd ${pkgname}
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_CAPTIONS=ON \
    -DOBS_VERSION_OVERRIDE="${pkgver}-${pkgrel}-archlinux" ..

  make
}

package() {
  cd ${pkgname}/build
  make install DESTDIR="${pkgdir}"
}
