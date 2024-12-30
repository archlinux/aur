pkgname=ghostty_wrapper
pkgver=1.0.0
pkgrel=1
pkgdesc='Wrapper for using ghostty as the default terminal emulator in Gnome'
arch=(any)
depends=('ghostty')
conflicts=('gnome-terminal')
license=(GPL-3.0-or-later)
source=(ghostty_wrapper)
sha256sums=('2bcc55bc8cd507cf3f4e6ddbc3802b145e20aad450fca5b258f558d0e9ae740f')

package() {
	# Create the directory to store this script
	mkdir -p "${pkgdir}/usr/bin"
	# Copy the script to its directory
	cp "${srcdir}/ghostty_wrapper" "${pkgdir}/usr/bin/ghostty_wrapper"
	# Make the script executable
	chmod +x "${pkgdir}/usr/bin/ghostty_wrapper"

	# Symlink the script to the gnome-terminal (used by Gnome as the default)
	sudo ln -sf "${pkgdir}/usr/bin/ghostty_wrapper" "/usr/bin/gnome-terminal"

	# Try to set ghostty as the default terminal emulator (this apparently is deprecated, but who knows)
	gsettings set org.gnome.desktop.default-applications.terminal exec ghostty
	# If the nautilus-open-any-terminal package is installed, set ghostty as the terminal emulator used for it (install will not fail because of this)
	gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal ghostty || true
}
