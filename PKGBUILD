# Maintainer: Faule Socke <github@socker.lepus.uberspace.de>
pkgname=frida-git
pkgver=0.2.r19.g79d63f5
pkgrel=1
pkgdesc="FrIDa is an interactive disassembler based on LLVM and Qt"
arch=(x86_64)
url="https://www.frida.xyz/"
license=('GPL3')
groups=()
depends=(gmock log4cxx llvm35 quazip-qt5 guile swig boost libedit)
makedepends=(git cmake pkg-config)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('frida::git+https://git.siccegge.de/frida/frida.git'
        'frida.patch')
noextract=()
sha256sums=('SKIP'
            '852947bce88c1847b397806d5f13d69505eb8781f939de689f0eee976c8a7693')

pkgver() {
    cd "$srcdir/${pkgname%-git}"

    # cutting off 'v' prefix that presents in the git tag
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQUAZIP_INCLUDE_DIR=/usr/include -DQUAZIP_LIBRARIES=/usr/lib/libquazip5.so
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
    mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
}
