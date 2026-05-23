# Maintainer: Andrew <andrewforlua@gmail.com>
pkgname=autodock4
pkgver=4.2.6
pkgrel=3
pkgdesc="Automated docking of flexible ligands to proteins"
arch=('x86_64' 'i686')
url="https://github.com/ccsb-scripps/AutoDock4"
license=('GPL')
depends=('gcc-libs')
makedepends=('gcc' 'make' 'tcsh' 'autoconf' 'automake')

_ad4_commit="192ecda05d7c566161046f0a1d604f3336e0cf3a"
_ag4_commit="6d2847beaeac8ff43ca99094707fd74e3ca1ff37"

source=("autodock4-$pkgver.tar.gz::https://github.com/ccsb-scripps/AutoDock4/archive/$_ad4_commit.tar.gz"
        "autogrid4-$pkgver.tar.gz::https://github.com/ccsb-scripps/AutoGrid/archive/$_ag4_commit.tar.gz")
sha256sums=('8c59254e214c0fa4de9faf4dcd82da1053bfb9c817dd0973c3b85b1148c9e894'
            '4d0bd83a446fd81577f4fc492299e22f131245589e1782e0532aecf3435e772a')
# updpkgsums
# n.d., To update metadata, you run: makepkg --printsrcinfo > .SRCINFO
# git clone ssh://aur@aur.archlinux.org/autodock4.git
build() {
    # Build AutoDock4
    cd "$srcdir/AutoDock4-$_ad4_commit"
    
    echo "--> Configuring AutoDock..."
    autoreconf -i
    ./configure --prefix=/usr
    
    echo "--> Building AutoDock..."
    make

    cd "$srcdir/AutoGrid-$_ag4_commit"
    
    echo "--> Configuring AutoGrid..."
    autoreconf -i
    ./configure --prefix=/usr
    
    echo "--> Building AutoGrid..."
    make
}

package() {
    # Install AutoDock binary
    install -Dm755 "$srcdir/AutoDock4-$_ad4_commit" "$pkgdir/usr/bin/autodock4"
    
    # Install AutoGrid binary
    install -Dm755 "$srcdir/AutoGrid-$_ag4_commit" "$pkgdir/usr/bin/autogrid4"
    
    # Install documentation
    install -Dm644 "$srcdir/AutoDock4-$_ad4_commit/README" "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 "$srcdir/AutoDock4-$_ag4_commit/COPYING" "$pkgdir/usr/share/doc/$pkgname/COPYING"
}
