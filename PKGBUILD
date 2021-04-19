# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=system76-power-git
pkgver=1.1.16.r16.g29304ec
pkgrel=1
pkgdesc="System76 Power Management"
arch=('any')
url="https://github.com/pop-os/system76-power"
license=('GPL')
install=system76-power-git.install
conflicts=("system76-power")
provides=("system76-power")
makedepends=('git' 'rust')
depends=('dbus' 'systemd' 'system76-dkms')
source=("${pkgname}::git+https://github.com/pop-os/system76-power.git"
        "graphics.patch")
sha256sums=('SKIP'
            'c44423e11bbe3f045203ef5b836f64151728aec0762d798295a1787092fecf1b')

pkgver() {
    cd ${pkgname}

	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname}

    # Build and install base package
    cargo build --release
}

package() {
    # Install daemons
    install -Dm755 ${srcdir}/${pkgname}/target/release/system76-power ${pkgdir}/usr/bin/system76-power

    # Install systemd unit files
    install -Dm644 ${srcdir}/${pkgname}/debian/system76-power.service ${pkgdir}/usr/lib/systemd/system/system76-power.service

    # Install scripts and configuration
    install -Dm755 ${srcdir}/${pkgname}/data/system76-power.conf ${pkgdir}/usr/share/dbus-1/system.d/system76-power.conf
}
