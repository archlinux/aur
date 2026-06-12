# Maintainer: leozeli <leozeli@users.noreply.github.com>
# Automatically updated by CI — do not edit pkgver/sha256sums manually.
_pkgbase=warp-terminal-oss
pkgname=warp-terminal-oss-bin
pkgver=r1055.a30cc7a
pkgrel=1
pkgdesc="Warp, the Rust-based terminal for developers and teams (OSS build, prebuilt binary)"
arch=('x86_64')
url="https://github.com/leozeli/warp-terminal-oss-aur"
license=('AGPL-3.0-only' 'MIT')
provides=('warp-terminal-oss')
conflicts=('warp-terminal-oss')
depends=(
	'curl'
	'default-cursors'
	'fontconfig'
	'libegl'
	'libx11'
	'libxcb'
	'libxcursor'
	'libxi'
	'libxkbcommon-x11'
	'opengl-driver'
	'xdg-utils'
	'zlib'
)
optdepends=(
	'adwaita-cursors: for if there is no default cursor installed'
	'zenity: for file dialogs in Gnome'
	'kdialog: for file dialogs in KDE'
	'org.freedesktop.secrets: for securely storing passwords'
)
options=('!strip')
source=("${_pkgbase}-${pkgver}-x86_64.tar.gz::https://github.com/leozeli/warp-terminal-oss-aur/releases/download/${pkgver}/${_pkgbase}-x86_64.tar.gz")
sha256sums=('16ccdb9fa983f0ecda11712a986c03fa7dd5a2aac633dc9f720d22e60120dd67')

package() {
	# The tarball contains opt/ and usr/share/ directory trees ready to install.
	cp -r "$srcdir/opt" "$pkgdir/"
	cp -r "$srcdir/usr" "$pkgdir/"

	# Fix upstream .desktop Exec field: upstream ships Exec=warp-oss but the
	# AUR package exposes /usr/bin/warp-terminal-oss as the public entry point.
	sed -i "s|^Exec=warp-oss|Exec=$_pkgbase|" \
		"$pkgdir/usr/share/applications/dev.warp.WarpOss.desktop"

	# Install the wrapper shell script that respects user-supplied flags.
	local _install_dir="/opt/warpdotdev/$_pkgbase"
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgbase" <<-WRAPPER
		#!/bin/bash
		XDG_CONFIG_HOME=\${XDG_CONFIG_HOME:-~/.config}
		if [[ -f "\$XDG_CONFIG_HOME/$_pkgbase-flags.conf" ]]; then
		    WARP_USER_FLAGS="\$(grep -v '^#' "\$XDG_CONFIG_HOME/$_pkgbase-flags.conf")"
		fi
		exec "$_install_dir/warp-oss" \$WARP_USER_FLAGS "\$@"
	WRAPPER
}
