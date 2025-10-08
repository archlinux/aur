## Maintainer: Adam <classygopher@gmail.com>
pkgname=bolt-launcher
pkgver=0.20.0
pkgrel=2
pkgdesc="Free open-source third-party implementation of the Jagex Launcher"
license=('AGPL3')
url="https://bolt.adamcake.com/"
arch=('x86_64')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'fmt' 'gcc-libs' 'gdk-pixbuf2'
         'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libarchive' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'luajit'
         'mesa' 'nspr' 'nss' 'pango')
makedepends=('cmake' 'git')
optdepends=('jre17-openjdk: runelite/hdos' 'gtk2: rs3' 'openssl-1.1: rs3' 'umu-launcher: osrs official client')
source=("git+https://github.com/Adamcake/Bolt.git#tag=${pkgver}"
        "https://adamcake.com/cef/cef-126.0.6478.183-linux-x86_64-minimal-ungoogled.tar.gz"
        "fmt.patch"
        "cef-no-fortify.patch")
sha256sums=('SKIP'
            '88a6f34c85a1f8c936563510973e7867d0acc5999dd704bb26bd33bacc8d4be1'
            '8415144d8aa83cc5f7fbb1b50ccd8b06549cc99dac845346fa9cf1d228c2ad86'
            '20b60ea029fe7fc95d5b8e3d4dcf035a418267d0b3c445bd821205784b037258')

prepare() {
  git -C "$srcdir/Bolt" submodule update --init --recursive
  git -C "$srcdir/Bolt" apply "$srcdir/fmt.patch"
  patch -p1 -d "$srcdir/cef_binary_126.2.19+ga5d51ba+chromium-126.0.6478.183_linux64_minimal" < "$srcdir/cef-no-fortify.patch"
}

build() {
  cmake -S Bolt -B build -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release -D CEF_ROOT="$srcdir"/cef_binary_126.2.19+ga5d51ba+chromium-126.0.6478.183_linux64_minimal -D CMAKE_INSTALL_PREFIX="$pkgdir" -D BOLT_BINDIR=usr/bin -D BOLT_LIBDIR=usr/lib -D BOLT_SHAREDIR=usr/share -D BOLT_META_NAME="$pkgname"
  cmake --build build
}

package() {
  cmake --install build
}

