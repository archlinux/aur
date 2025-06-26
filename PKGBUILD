# Maintainer: Kimiblock Moe

pkgname=z-library-bwrap
pkgver=2.4.3
pkgrel=1
pkgdesc="Your gateway to knowledge and culture. Sandboxed by portable and uses system electron"
arch=(x86_64 aarch64)
url="https://go-to-library.sk/"
license=('LicenseRef-unknown')
makedepends=(desktop-file-utils tar)
depends=(electron bash hicolor-icon-theme portable)
source=(
	"https://s3proxy.cdn-zlib.sk/te_public_files/soft/linux/zlibrary-setup-latest.deb"
	portable-config
	)
sha256sums=('SKIP'
            'SKIP')
provides=(z-library)
conflicts=(z-library)

function pkgver() {
        tar -xf control.tar.gz ./control
        cat control | grep 'Version: ' | sed 's|Version: ||g'
}

function package() {
	install -Dm755 portable-config \
		"${pkgdir}/usr/lib/portable/info/go.to.library/config"
	cd "${srcdir}"
	tar -xf data.tar.xz ./opt
	tar -xf data.tar.xz ./usr
	install -Dm644 "${srcdir}/opt/Z-Library/resources/app.asar" \
		"${pkgdir}/usr/lib/z-library-bwrap/app.asar"
	install -Dm644 "${srcdir}/usr/share/applications/z-library.desktop" \
		"${pkgdir}/usr/share/applications/go.to.library.desktop"
	desktop-file-edit \
		--set-key Exec \
		--set-value 'env _portableConfig=go.to.library portable' \
		"${pkgdir}/usr/share/applications/go.to.library.desktop"
	cp -r "${srcdir}/usr/share/doc" "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
}
