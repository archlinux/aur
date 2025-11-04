# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Mysti

pkgname=proton-pass-bin
pkgver=1.32.11
pkgrel=1
pkgdesc="Open-source password manager for effortless protection. Securely store, share and auto-login your accounts with Proton Pass, using end-to-end encryption trusted by millions."
arch=("x86_64")
url="https://proton.me/pass"
license=('MIT') # Bundled Electron
license+=('GPL-3.0-or-later') # The Proton Pass code itself (https://github.com/ProtonMail/WebClients#license)
groups=("ProtonPass")
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
		 'libcups' 'libdrm' 'libudev.so' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
		 'libxrandr' 'libxkbcommon' 'mesa' 'nspr' 'nss' 'pango') # Bundled Electron dependencies
provides=('proton-pass' 'protonpass')
conflicts=('proton-pass' 'protonpass')
source=("https://proton.me/download/PassDesktop/linux/x64/proton-pass_${pkgver}_amd64.deb")
sha256sums=('3aec0bb8bbcfc7c4d4437b07e007341746cf6dedb27993f2e4aab5e33a13aa71')

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
