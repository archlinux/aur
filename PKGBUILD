pkgname=cutrail
pkgver=0.1.0
pkgrel=2
pkgdesc='Desktop video clipping utility for batch range exports'
arch=('x86_64')
url='https://github.com/sabinmarcu/cutrail'
license=('MIT')
options=('!strip' '!debug')
depends=('electron37' 'glibc' 'gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libdrm' 'alsa-lib')
makedepends=('proto-bin')
optdepends=('ffmpeg: fallback ffmpeg binary for diagnostics and overrides')
provides=('cutrail')
conflicts=('cutrail-bin' 'cutrail-git')
source=("cutrail-${pkgver}.tar.gz::https://github.com/sabinmarcu/cutrail/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/cutrail-${pkgver}"
	proto install
	proto exec node yarn -- yarn install --immutable
	proto exec node yarn -- yarn build
	proto exec node yarn -- yarn build:node
}

package() {
	cd "${srcdir}/cutrail-${pkgver}"

	install -d "${pkgdir}/usr/lib/${pkgname}"
	cp -r src/assets "${pkgdir}/usr/lib/${pkgname}/"
	install -d "${pkgdir}/usr/lib/${pkgname}/dist"
	cp -r dist/electron "${pkgdir}/usr/lib/${pkgname}/dist/"
	cp -r dist/renderer "${pkgdir}/usr/lib/${pkgname}/dist/"
	cp -r node_modules "${pkgdir}/usr/lib/${pkgname}/"
	install -Dm644 package.json "${pkgdir}/usr/lib/${pkgname}/package.json"
	install -Dm644 THIRD_PARTY_NOTICES.md "${pkgdir}/usr/lib/${pkgname}/THIRD_PARTY_NOTICES.md"

	install -d "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/cutrail" <<'EOF'
#!/usr/bin/env sh
exec /usr/lib/electron37/electron /usr/lib/cutrail "$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/cutrail"

	install -Dm644 src/assets/icons/icon.png "${pkgdir}/usr/share/pixmaps/cutrail.png"
	install -d "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/cutrail.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Cutrail
Comment=Desktop video clipping utility for batch range exports
Exec=cutrail %U
Icon=cutrail
Terminal=false
Categories=AudioVideo;Video;
EOF
}