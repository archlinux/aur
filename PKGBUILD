# Maintainer: TNE <tne@garudalinux.org>

pkgname=snapper-tools-git
_pkgname=snapper-tools
pkgver=r5.36aa64d
pkgrel=1
pkgdesc="A highly opinionated Snapper GUI and CLI"
arch=('x86_64')
url="https://gitlab.com/garuda-linux/applications/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'polkit')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('qt5-tools' 'cmake' 'git' 'polkit')
source=(git+$url.git)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    cd "$srcdir/$_pkgname"
    make -C build DESTDIR="$pkgdir" install
    
    install -Dm0644 org.garuda.snapper-tools.pkexec.policy "$pkgdir/usr/share/polkit-1/actions/org.garuda.snapper-tools.pkexec.policy"
    install -Dm0755 snapper-tools-pkexec "$pkgdir/usr/lib/snapper-tools-pkexec"
    install -Dm0644 snapper-tools-check.desktop "$pkgdir/etc/xdg/autostart/snapper-tools-check.desktop"
}
