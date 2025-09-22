# Maintainer: Kazoku <k4zoku@pm.me>
pkgname=hudkit-wayland
pkgver=4.1.0
pkgrel=2
pkgdesc="Transparent click-through web browser overlay, using WebKit (Wayland fork)"
arch=('x86_64')
url="https://github.com/SparxySys/hudkit-wayland"
license=('ISC')
depends=('gtk3' 'webkit2gtk' 'gtk-layer-shell')
makedepends=('make' 'pkgconf' 'gcc')
source=("hudkit-wayland::git+https://github.com/SparxySys/hudkit-wayland.git")
sha256sums=('SKIP')

example_config=$(cat <<'EOF'
{
    "title": "example overlay", //Title of the window, to make it easier to identify
    "url": "file:///path/to/file.html?OVERLAY_WS=ws://127.0.0.1:10501/ws", //URL to the overlay
    "x": 100, // X position to display overlay at
    "y": 100, // Y position to display overlay at
    "width": 200, // Width of overlay
    "height": 200, // Height of overlay
    "monitor": 0, // on which display to render
    "zoom": 1.0, // zoom level of browser, float
    "hotkey": "<Ctrl>L" // Hotkey to lock/unlock the overlay
}
EOF
)

make_install=$(cat <<'EOF'
install:
	install -D -m 755 hudkit $(DESTDIR)/usr/bin/$(NAME)
	install -D -m 644 config.json $(DESTDIR)/usr/share/doc/$(NAME)/examples/config.json
EOF
)

prepare() {
    echo "${example_config}" > "${srcdir}/hudkit-wayland/webkit/config.json"
	cd "${srcdir}/hudkit-wayland/webkit"
	echo "${make_install}" >> makefile
}

build() {
    cd "${srcdir}/hudkit-wayland/webkit"
	make
}

package() {
	cd "${srcdir}/hudkit-wayland/webkit"
	make DESTDIR="${pkgdir}" NAME="${pkgname}" install
}

post_install() {
    echo "Example configuration file is available at /usr/share/doc/${pkgname}/examples/config.json"
}
