# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=btrfs-assistant-git
_pkgname=btrfs-assistant
pkgver=0.0.1.r2.g6c63963
pkgrel=1
pkgdesc="An application for managing BTRFS subvolumes and Snapper snapshots"
arch=('x86_64')
url="https://gitlab.com/garuda-linux/applications/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'noto-fonts' 'polkit' 'btrfsmaintenance')
optdepends=('snapper')
makedepends=('git' 'cmake' 'qt5-tools')
groups=('garuda')
source=(git+$url.git)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "$srcdir/$_pkgname"
    cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE='Release'
	make -C build
}

package() {
    cd "$srcdir/$_pkgname"
    make -C build DESTDIR="$pkgdir" install

    install -Dm0644 "$srcdir/$_pkgname/snapper-snap-check.desktop" "$pkgdir/etc/xdg/autostart/snapper-snap-check.desktop"
    install -Dm0644 org.garuda.btrfs-assistant.pkexec.policy $pkgdir/usr/share/polkit-1/actions/org.garuda.btrfs-assistant.pkexec.policy
}
