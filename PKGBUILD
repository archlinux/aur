## Maintainer: Adam <classygopher@gmail.com>
pkgname=bolt-launcher
pkgver=0.20.6
pkgrel=2
pkgdesc="Free open-source third-party implementation of the Jagex Launcher"
license=('AGPL3')
url="https://bolt.adamcake.com/"
arch=('x86_64')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'fmt' 'gcc-libs' 'gdk-pixbuf2'
         'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libarchive' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'luajit'
         'mesa' 'nspr' 'nss' 'pango' 'libffi')
makedepends=('cmake' 'git')
optdepends=('jre17-openjdk: runelite/hdos' 'gtk2: rs3' 'openssl-1.1: rs3' 'umu-launcher: osrs official client')
source=("git+https://codeberg.org/Adamcake/Bolt.git#tag=${pkgver}"
        "https://adamcake.com/cef/cef-139.0.7258.139-linux-x86_64-minimal-ungoogled.tar.xz"
        "fmt.patch"
        "cef-no-fortify.patch")
sha256sums=('SKIP'
            'aeb98ff1f621c8f7c5f0be6c34acefaf4fe4be763004a9d2a9e933d1cd914650'
            '90bc35d3226b9f71daf4149304ff7559f0c8734df2660f16d99da07f20d006f8'
            '20b60ea029fe7fc95d5b8e3d4dcf035a418267d0b3c445bd821205784b037258')

prepare() {
  git -C "$srcdir/Bolt" submodule update --init --recursive
  git -C "$srcdir/Bolt" apply "$srcdir/fmt.patch"
  patch -p1 -d "$srcdir/dist" < "$srcdir/cef-no-fortify.patch"
}

build() {
  cmake -S Bolt -B build -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release -D CEF_ROOT="$srcdir"/dist -D CMAKE_INSTALL_PREFIX="$pkgdir" -D BOLT_BINDIR=usr/bin -D BOLT_LIBDIR=usr/lib -D BOLT_SHAREDIR=usr/share -D BOLT_META_NAME="$pkgname"
  cmake --build build
}

package() {
  cmake --install build
}
