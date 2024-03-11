## Maintainer: Adam <classygopher@gmail.com>
pkgname=bolt-launcher
pkgver=0.8.2
pkgrel=2
pkgdesc="Free open-source third-party implementation of the Jagex Launcher"
license=('AGPL3')
url="https://bolt.adamcake.com/"
arch=('x86_64')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'fmt9' 'gcc-libs' 'gdk-pixbuf2'
         'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libarchive' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa'
         'nspr' 'nss' 'pango')
makedepends=('cmake' 'git')
optdepends=('jre17-openjdk: runelite/hdos' 'gtk2: rs3' 'openssl-1.1: rs3')
source=("git+https://github.com/Adamcake/Bolt.git#tag=${pkgver}"
        "https://adamcake.com/cef/cef-114.0.5735.134-linux-x86_64-minimal-ungoogled.tar.gz"
        "fmt9.patch")
sha256sums=('SKIP'
            '72c8c43dcb61f778a807eb262b2c2ebcb2e1705756de5a9003484af0663aa924'
            '6dadab1c269e8f7baefbd87fab34819b7a14985fa00512ea04ed959df6e07291')

prepare() {
  git -C "$srcdir/Bolt" submodule update --init --recursive
  git -C "$srcdir/Bolt" apply "$srcdir/fmt9.patch"
}

build() {
  cmake -S Bolt -B build -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release -D CEF_ROOT="$srcdir"/cef_binary_114.2.11+g87c8807+chromium-114.0.5735.134_linux64_minimal -D CMAKE_INSTALL_PREFIX="$pkgdir" -D BOLT_BINDIR=usr/bin -D BOLT_LIBDIR=usr/lib -D BOLT_SHAREDIR=usr/share -D BOLT_META_NAME="$pkgname" -D BOLT_SKIP_LIBRARIES=1
  cmake --build build
}

package() {
  cmake --install build
}
