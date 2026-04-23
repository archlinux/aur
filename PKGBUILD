# Maintainer: Rick <riyyi3 at gmail dot com>

## The following variable can be customized at build time.
## Use env or export to change at your wish
##
##   Example: env _sccache=y makepkg -sc
##
## Default is: None => not use sccache
##
## More info: https://github.com/mozilla/sccache
: ${_sccache:=}

pkgname=niri-no-decorations
pkgver=25.11.r0.gb35bcae
pkgrel=1
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(x86_64 aarch64)
url="https://github.com/niri-wm/${pkgname%-no-decorations}"
license=(GPL-3.0-or-later)
depends=(cairo glib2 libdisplay-info libinput libpipewire libxkbcommon mesa pango pixman seatd)
makedepends=(clang rust git)
[[ -n "${_sccache}" ]] && makedepends+=(sccache)
optdepends=('fuzzel: application launcher similar to rofi drun mode'
            'waybar: highly customizable Wayland bar'
            'alacritty: a cross-platform OpenGL terminal emulator'
            'mako: notification daemon for Wayland'
            'swaybg: wallpaper tool for Wayland compositors'
            'swaylock: screen locker for Wayland'
            'xdg-desktop-portal-gtk: implements most of the basic functionality'
            'xdg-desktop-portal-gnome: screencasting support'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions')
provides=("${pkgname%-no-decorations}=${pkgver}")
conflicts=("${pkgname%-no-decorations}-bin" "${pkgname%-no-decorations}")
options=(!debug !lto !strip)
_tag=15c52bfb4318f3b2452f511d5367b4bfe6335242 # git rev-parse "v$pkgver"
source=("${pkgname%-no-decorations}::git+$url.git#tag=${_tag}"
        "no-decorations.patch")
b2sums=('SKIP'
        '7aea4a3e604c0183be01696ed9265867abfc9b9f02ab51675f811d45ff357e90e0c13fbe2bee4ed52f7c6005fcb3477162c057729807e3af2d6da4c84766cdfa')

prepare() {
	cd "${pkgname%-no-decorations}"
	# Tuning cargo
	export CARGO_HOME="${srcdir}/${pkgname%-no-decorations}/.cargo"    # Download all to src directory, not in ~/.cargo

	# Disable decorations, reference:
	# https://gist.github.com/mle98/2deb6e0aa1da3aed70a73dad9c29e8f7
	patch -Np1 -i "${srcdir}/no-decorations.patch"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
	cd "${pkgname%-no-decorations}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "${pkgname%-no-decorations}"

	# Tuning rust compiler
	export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}=/"    # Prevent warning: 'Package contains reference to $srcdir'
	[[ -n "${_sccache}" ]] && export RUSTC_WRAPPER=sccache  # If $_sccache not empty, build using binary cache

	# Tuning cargo
	export CARGO_HOME="${srcdir}/${pkgname%-no-decorations}/.cargo"    # Use downloaded earlier from src directory, not from ~/.cargo
	export CARGO_TARGET_DIR=target                        # Place the output in target relative to the current directory

	cargo build --frozen --release
}

package() {
	cd "${pkgname%-no-decorations}"
	install -Dm755 "target/release/${pkgname%-no-decorations}"                       -t "${pkgdir}/usr/bin/"
	install -Dm755 "resources/${pkgname%-no-decorations}-session"                    -t "${pkgdir}/usr/bin/"
	install -Dm644 resources/default-config.kdl                                      -t "${pkgdir}/usr/share/doc/niri"
	install -Dm644 "resources/${pkgname%-no-decorations}.desktop"                    -t "${pkgdir}/usr/share/wayland-sessions/"
	install -Dm644 "resources/${pkgname%-no-decorations}-portals.conf"               -t "${pkgdir}/usr/share/xdg-desktop-portal/"
	install -Dm644 "resources/${pkgname%-no-decorations}"{.service,-shutdown.target} -t "${pkgdir}/usr/lib/systemd/user/"
}
