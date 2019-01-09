# Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>

pkgname=whatpulse
pkgver=2.8.4
pkgrel=1
pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('x86_64')
url=http://www.whatpulse.org
# I have yet to find the actual licence, but alternatively: it's basically freeware
license=(custom:whatpulse_tos)
changelog="$pkgname.changelog"
install="$pkgname.install"
depends=(qt4)
optdepends=(
    'libpcap: for capturing network statistics'
)
source=('whatpulse.desktop')
source_x86_64=("http://static.whatpulse.org/files/whatpulse-linux-archlinux-64bit-$pkgver.tar.gz")
sha256sums=('aba7e6b28ccebdb6115245dae1a7ca8e88afa2ecb1619037b66f65090a284363')
sha256sums_x86_64=('763d603962db4a6e78d53ebbc7a2142419119ab3df40e28793ea7937260131eb')

build() {
	# Extract the tiny, tiny bit of license/usage information that exists
	# in this piece of software distribution.
	sed -n '/By installing/,/ any way./p' README.txt > LICENSE
}

package() {
    cd $srcdir/
    # Install the binary
    mkdir -p ${pkgdir}/usr/bin
    install -m0755 whatpulse ${pkgdir}/usr/bin/
    # Install the freedesktop shortcut
    mkdir -p ${pkgdir}/usr/share/applications
    install -m0644 whatpulse.desktop ${pkgdir}/usr/share/applications/
    # Install the input rules 
    mkdir -p ${pkgdir}/etc/udev/rules.d/
    cat >${pkgdir}/etc/udev/rules.d/99-whatpulse-input.rules <<__EOF__
KERNEL=="event*", NAME="input/%k", MODE="640", GROUP="input"
__EOF__

	 # Install the license
	 install -Dm0755 LICENSE ${pkgdir}/usr/share/licenses/whatpulse/LICENSE
}
