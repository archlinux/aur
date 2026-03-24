# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
pkgname=snd-dante-pcie-dkms-git
pkgver=0.0.1.r0.g4775565
pkgrel=1
pkgdesc="ALSA kernel driver for Digigram LX-DANTE / Audinate Dante PCIe cards (git)"
arch=('x86_64')
url="https://github.com/chris-ritsen/snd-dante-pcie"
license=('GPL')
depends=('dkms')
makedepends=('git')
optdepends=('python-numpy: dante-live.py dashboard')
provides=('snd-dante-pcie')
conflicts=('snd-dante-pcie-dkms' 'dante-pcie-dkms')
source=("git+https://github.com/chris-ritsen/snd-dante-pcie.git")
sha256sums=('SKIP')

pkgver() {
    cd snd-dante-pcie
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || printf "0.0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd snd-dante-pcie

    local dkms_dir="$pkgdir/usr/src/snd-dante-pcie-$pkgver"
    install -Dm644 snd-dante-pcie.c "$dkms_dir/snd-dante-pcie.c"
    install -Dm644 Makefile "$dkms_dir/Makefile"
    install -Dm644 dkms.conf "$dkms_dir/dkms.conf"

    install -Dm755 dante-live.py "$pkgdir/usr/bin/dante-live"
    install -Dm644 docs/observed_fpga_behavior.md "$pkgdir/usr/share/doc/$pkgname/observed_fpga_behavior.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
