# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=unofficial-homestuck-collection-git
pkgver=2.7.2.r0.g6e65920
pkgrel=1
pkgdesc="An offline collection of Homestuck and its related works."
arch=('x86_64')
url="https://github.com/GiovanH/unofficial-homestuck-collection"
license=('GPL-3.0-only')
depends=('nspr' 'hicolor-icon-theme' 'libx11' 'libdrm' 'libxfixes' 'gtk3' 'libxext' 'libxcursor' 'libxrender' 'cairo' 'mesa' 'gcc-libs' 'alsa-lib' 'dbus' 'at-spi2-core' 'libxrandr' 'bash' 'expat' 'libxtst' 'glibc' 'libxcb' 'libxdamage' 'libxcomposite' 'libxi' 'pango' 'libcups' 'libxss' 'glib2' 'nss' 'gdk-pixbuf2')
makedepends=('nodejs-lts-jod' 'yarn' 'gendesk')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname::-4}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}


prepare() {
	cd "$srcdir"
	sed -i 's/18.20/22/g' ${pkgname::-4}/package.json

}

build() {
	cd "$srcdir/${pkgname::-4}"
	yarn add crc #for now
	SHARP_IGNORE_GLOBAL_LIBVIPS=true make build
}

package() {
	cd "$srcdir"

	gendesk -f \
	--pkgname="${pkgname::-4}" \
	--name="Unofficial Homestuck Collection" \
	--comment="Unofficial Reader For Homestuck" \
	--exec="${pkgname::-4}" \
	--icon="${pkgname::-4}" \
	--categories="AudioVideo;Graphics;Game"

	install -dm755 "$pkgdir/usr/lib/${pkgname::-4}"
	cp -a -T "$srcdir/${pkgname::-4}/dist_electron/linux-unpacked" "$pkgdir/usr/lib/${pkgname::-4}/"

	install -Dm644 "$srcdir/${pkgname::-4}.desktop" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
	cd "$srcdir/${pkgname::-4}/build/icons"
	for _size in 16 24 48 64 128 256 512 1024
	do
		install -Dm644 ${_size}x${_size}.png \
		"$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname::-4}.png"
	done
	install -dm755 "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/${pkgname::-4}"<<EOF
#!/usr/bin/env sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [ -f "$XDG_CONFIG_HOME/homestuck-flags.conf" ]; then
    HOMESTUCK_USER_FLAGS="\$(grep -v '^#' "\$XDG_CONFIG_HOME/homestuck-flags.conf")"
fi

# Launch (each word in VESKTOP_USER_FLAGS must be split)
# shellcheck disable=SC2086
echo \$HOMESTUCK_USER_FLAGS
exec /usr/lib/${pkgname::-4}/${pkgname::-4} \$HOMESTUCK_USER_FLAGS "\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/${pkgname::-4}"
}
