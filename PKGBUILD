# shellcheck shell=bash disable=SC2034,SC2154
pkgname=termux-keyring
pkgver=3.10
pkgrel=2
pkgdesc="GPG public keys for the official Termux repositories"
arch=(any)
url=https://github.com/termux
license=("Apache-2.0")
install=$pkgname.install

package() {
	TERMUX_PACKAGE_FORMAT=pacman
	TERMUX_PREFIX="$pkgdir/usr"
	TERMUX_PKG_BUILDER_DIR=".."
	if [ "$TERMUX_PACKAGE_FORMAT" = "debian" ]; then
		local GPG_DIR="$TERMUX_PREFIX/etc/apt/trusted.gpg.d"
	else
		local GPG_DIR="$TERMUX_PREFIX/share/pacman/keyrings"
	fi

	mkdir -p $GPG_DIR

	# Maintainer-specific keys.
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/agnostic-apollo.gpg $GPG_DIR
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/grimler.gpg $GPG_DIR
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/kcubeterm.gpg $GPG_DIR
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/landfillbaby.gpg $GPG_DIR
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/mradityaalok.gpg $GPG_DIR
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/2096779623.gpg $GPG_DIR

	# Key for automatic builds (via CI).
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/termux-autobuilds.gpg $GPG_DIR

	# Creation of trusted files
	if [ "$TERMUX_PACKAGE_FORMAT" = "pacman" ]; then
		install -Dm600 $TERMUX_PKG_BUILDER_DIR/termux-pacman.gpg $GPG_DIR
		echo "998DE27318E867EA976BA877389CEED64573DFCA:4:" > $GPG_DIR/termux-pacman-trusted
	fi
}
