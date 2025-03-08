# Maintainer: Germani <s1522711@protonmail.com>

pkgname=kosherlinux-git
_gitrepo="https://github.com/s1522711/Kosher-Linux.git"
pkgver=1.0
pkgrel=1
url="https://github.com/s1522711/Kosher-Linux"
arch=('x86_64')
pkgdesc="this small thing automatically turns off your computer if you try to turn it on during Shabbat."
license=('GPL')
depends=('systemd')
makedepends=('gcc' 'cmake' 'make' 'git')
source=("git+$_gitrepo")
sha256sums=("SKIP")
install=kosherlinux.install

pkgver() {
    cd "$srcdir/Kosher-Linux"
    git describe --tags --always | sed 's/^v//'
}

build() {
    cd "$srcdir/Kosher-Linux"
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-g0" -DCMAKE_C_FLAGS_RELEASE="-g0"
    cmake --build build --config Release
}

package() {
    cd "$srcdir/Kosher-Linux"
    # Install the executable and service file
    install -Dm755 "$srcdir/Kosher-Linux/build/Kosher-Linux" "$pkgdir/usr/bin/KosherLinux"
    install -Dm644 "$srcdir/Kosher-Linux/kosherlinux.service" "$pkgdir/usr/lib/systemd/system/kosherlinux.service"

    # Remove any debug-related files that may be generated
    rm -rf "$pkgdir/usr/lib/debug"
}

# Disable the creation of the debug package
options=('!debug')

