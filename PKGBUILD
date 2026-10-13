# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
# Maintainer: SoftExpert <softexpert at gmail dot com>
pkgname=yaak-bin
# renovate: datasource=github-releases depName=mountain-loop/yaak
pkgver=2026.9.0
pkgrel=1
pkgdesc='Fast, offline and Git-friendly API client for HTTP, GraphQL, WebSockets, SSE, and gRPC (Pre-compiled version)'
arch=(aarch64 x86_64)
url='https://yaak.app/'
license=(MIT)
depends=(
	# As reported by namcap
	cairo
	dbus
	fontconfig
	gdk-pixbuf2
	glib2
	glibc
	gtk3
	hicolor-icon-theme
	libgcc
	libsoup3
	libstdc++
	webkit2gtk-4.1
	zlib
)
provides=(yaak yaak-app yaak-app-client)
conflicts=(
	yaak
	yaak-app-beta
	yaak-appimage
	yaak-beta-bin
	yaak-git
)
replaces=(yaak-app)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package because why not
)
source=("${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/mountain-loop/yaak/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/mountain-loop/yaak/releases/download/v${pkgver}/yaak_${pkgver}_arm64.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/mountain-loop/yaak/releases/download/v${pkgver}/yaak_${pkgver}_amd64.deb")
b2sums=('011fb406bfe4a8944efbae1f9cfa420fe421f1de3ae628802548676a1fe1318850a5f98c60cd29899efe3946dec329b6607f04917e966808f62f9e4ecaaea13b')
b2sums_aarch64=('2693161eae263d6cd7786d56ff27f3aa4af7f7fd11c2f3cde8100935f472dc41d2612067e4ee438e1ee62b0918497b3c9346993c3a59040f45b8ee2f1e6b14b4')
b2sums_x86_64=('b9f3afcce8e7145e656351dfe383900736ee45b7ca6749acc0ff32c839c1e21504154762734e0edaccaec64b60f5fa66b7a9b988a83b3953c138a039be10e42c')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
}

build() {
	sed -e 's|Name=yaak|Name=Yaak|' \
		-e '$aGenericName=API Client' \
		-i "${srcdir}/usr/share/applications/yaak.desktop"
}

package() {
	cp -a \
		"${srcdir}/usr/" \
		"${pkgdir}/usr/"
	install -Dm644 \
		"${srcdir}/${pkgname}-${pkgver}.LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Alias old binary name (yaak-app)
	ln -sr \
		"${pkgdir}/usr/bin/yaak-app-client" \
		"${pkgdir}/usr/bin/yaak-app"
}
