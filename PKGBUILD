# Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>

pkgname=whatpulse
pkgver=2.8.1
pkgrel=1
pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('i686' 'x86_64')
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
source_i686=("http://static.whatpulse.org/files/whatpulse-linux-ubuntu-32bit-$pkgver.tar.gz")
source_x86_64=("http://static.whatpulse.org/files/whatpulse-linux-ubuntu-64bit-$pkgver.tar.gz")
sha256sums=('9ad42960f0a8b538f1d98fea1ced9b2a97ef59aadca50d0382efdb71434572b7')
sha256sums_i686=('8480458eb7baf1f929e731b13448ab061cd3f25ac8cd850cb2cd17dfa4fba83b')
sha256sums_x86_64=('fa28c002d8906416e1abd73a6150c453a87d30a41136494e0ec42728de2f3400')

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
