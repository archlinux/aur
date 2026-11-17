# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Mysti

pkgname=proton-pass-bin
pkgver=1.44.0
pkgrel=1
pkgdesc="Open-source password manager for effortless protection. Securely store, share and auto-login your accounts with Proton Pass, using end-to-end encryption trusted by millions."
arch=("x86_64")
url="https://proton.me/pass"
license=('MIT') # Bundled Electron
license+=('GPL-3.0-or-later') # The Proton Pass code itself (https://github.com/ProtonMail/WebClients#license)
groups=("ProtonPass")
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc' 'gtk3' 'libcups'
		 'libgcc' 'libudev.so' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
		 'libxfixes' 'libxrandr' 'libxkbcommon' 'mesa' 'nspr' 'nss' 'pango') # Bundled Electron dependencies
provides=('proton-pass' 'protonpass')
conflicts=('proton-pass' 'protonpass')
source=("https://proton.me/download/PassDesktop/linux/x64/proton-pass_${pkgver}_amd64.deb")
sha512sums=('70b9b3c05074a79cbc8efca92c3974d56ca34ad1d7d2ca80817116af3f0fb1a40220550f05af5a4dc91ff754c5aafb378b15dbd658d57241e711c923b94d4f30')

package() {
	tar -xvf data.tar.xz -C "$pkgdir/"

	install -dm755 "$pkgdir"/opt
	mv "$pkgdir"/usr/lib/proton-pass "$pkgdir"/opt
	rmdir "$pkgdir"/usr/lib

	ln -sf "/opt/proton-pass/Proton Pass" "$pkgdir"/usr/bin/proton-pass

	# Remove world-writable bit from some files
	chmod -R o-w "$pkgdir"/opt/proton-pass/resources/assets

	# Install bundled Electron license
	install -Dm644 "$pkgdir"/usr/share/doc/proton-pass/copyright "$pkgdir"/usr/share/licenses/"$pkgname"/copyright

	rm -rf "$pkgdir"/usr/share/{doc,lintian}
}
