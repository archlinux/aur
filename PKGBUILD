# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgbase=popsicle-git
pkgname=(popsicle-cli-git popsicle-gtk-git)
pkgver=latest
pkgrel=1
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
url="https://github.com/pop-os/popsicle"
arch=(x86_64 i686 aarch64 armv7h)
license=(MIT)

makedepends=(rust cargo help2man)

source=("git+https://github.com/pop-os/popsicle.git")
sha256sums=('SKIP')

pkgver() {
    cd popsicle
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd popsicle
    sed -i "s|/usr/local|/usr|g" "gtk/assets/popsicle-pkexec" "gtk/assets/com.system76.pkexec.popsicle.policy" "gtk/assets/popsicle.desktop" "Makefile"
}

build_popsicle-cli-git() {
    cd popsicle
    make cli
}
build_popsicle-gtk-git() {
    makedepends=(gtk3)
    
    cd popsicle
    make gtk
}

package_popsicle-cli-git() {
    provides=(popsicle-cli)
    conflicts=(popsicle-cli)
    
    cd popsicle
    DESTDIR="${pkgdir}" make install-cli
}
package_popsicle-gtk-git() {
    provides=(popsicle-gtk)
    conflicts=(popsicle-gtk)

    cd popsicle
    DESTDIR="${pkgdir}" make install-gtk
}
