# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
# Maintainer: SoftExpert <softexpert at gmail dot com>
pkgname=yaak-appimage
# renovate: datasource=github-releases depName=mountain-loop/yaak
pkgver=2026.9.0
pkgrel=1
pkgdesc='Fast, offline and Git-friendly API client for HTTP, GraphQL, WebSockets, SSE, and gRPC (AppImage version)'
arch=(aarch64 x86_64)
url='https://yaak.app/'
license=(MIT)
depends=(
	# As reported by namcap
	hicolor-icon-theme

	# As determined by maintainers
	fuse2
	gtk3
)
provides=(yaak yaak-app yaak-app-client)
conflicts=(
	yaak
	yaak-app-beta
	yaak-beta-bin
	yaak-bin
	yaak-git
)
options=(
	!strip     # Stripping symbols would break the AppImage
	!emptydirs # Remove empty directories from package some icon dirs are empty
)
source=("${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/mountain-loop/yaak/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::https://github.com/mountain-loop/yaak/releases/download/v${pkgver}/yaak_${pkgver}_aarch64.AppImage")
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://github.com/mountain-loop/yaak/releases/download/v${pkgver}/yaak_${pkgver}_amd64.AppImage")
b2sums=('011fb406bfe4a8944efbae1f9cfa420fe421f1de3ae628802548676a1fe1318850a5f98c60cd29899efe3946dec329b6607f04917e966808f62f9e4ecaaea13b')
b2sums_aarch64=('b08f073fce28711aee7d6da054a1b74e7f41156d27a5c68471a75688186514d6fac6650e45f8d156a6badc1f90c1677e938cb274e13d36353b4e6f292a865587')
b2sums_x86_64=('4b03a5667ab9effc40f6302750da0f208d56decc92ab74f92f038f9e6e647f5415eb5df87350110c776f1b0a1870e531ad38bf3256ecb295c633935f21609532')

prepare() {
	cd "${srcdir}"
	chmod +x "${srcdir}/${pkgname}-${pkgver}-${CARCH}.AppImage"
	"${srcdir}/${pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
	chmod -R a-x+rX "${srcdir}/squashfs-root/usr/"
}

build() {
	sed -e 's|Exec=.*|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/yaak-app-client|' \
		-e '$aPath=/usr/bin' \
		-e 's|Name=yaak|Name=Yaak|' \
		-e '$aGenericName=API Client' \
		-i "${srcdir}/squashfs-root/yaak.desktop"
}

package() {
	install -Dm755 \
		"${srcdir}/${pkgname}-${pkgver}-${CARCH}.AppImage" \
		"${pkgdir}/usr/bin/yaak-app-client"
	install -Dm644 \
		"${srcdir}/squashfs-root/yaak.desktop" \
		"${pkgdir}/usr/share/applications/yaak.desktop"
	install -Dm644 \
		"${srcdir}/${pkgname}-${pkgver}.LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -dm755 "${pkgdir}/usr/share/"
	cp -a \
		"${srcdir}/squashfs-root/usr/share/icons" \
		"${pkgdir}/usr/share/icons"

	# Alias old binary name (yaak-app)
	ln -sr \
		"${pkgdir}/usr/bin/yaak-app-client" \
		"${pkgdir}/usr/bin/yaak-app"
}
