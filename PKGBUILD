# Maintainer: Pietro Carrara <pbcarrara@inf.ufrgs.br>

pkgname=digimend-drivers-git-dkms
pkgver=10.r0.gec5c16d
pkgrel=1
pkgdesc='Linux kernel modules (DKMS) for non-Wacom USB graphics tablets. Git version.'
arch=('any')
url='https://digimend.github.io'
license=('GPL2')
depends=('dkms')
optdepends=('xf86-input-wacom: for xorg wacom driver support')
makedepends=('git')
conflicts=(digimend-kernel-drivers digimend-kernel-drivers-dkms)
provides=(digimend-kernel-drivers)

source=('git+https://github.com/DIGImend/digimend-kernel-drivers.git')

md5sums=('SKIP')

pkgver() {
    cd digimend-kernel-drivers
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd digimend-kernel-drivers

    # Udev rules
    install -D -m 0755 hid-rebind "$pkgdir"/etc/udev/rules.d/hid-rebind
    install -D -m 0644 udev.rules "$pkgdir"/etc/udev/rules.d/90-digimend.rules

    # Use wacom drivers with supported tablets
    install -D -m 0644 xorg.conf "$pkgdir"/usr/share/X11/xorg.conf.d/50-digimend.conf

    # DKMS config
    install -Dm644 dkms.conf "$pkgdir"/usr/src/digimend-${pkgver}/dkms.conf

    # Depmod config
    install -D -m 0644 depmod.conf "$pkgdir"/etc/depmod.d/digimend.conf

    # Add source files to the DKMS tree
    cp -r ./* "$pkgdir/usr/src/digimend-$pkgver"
}
