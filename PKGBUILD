# Maintainer: SoftExpert <softexpert at gmail dot com>
# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
pkgname=yaak-beta-bin
_betaver=3
pkgver=2025.7.0
pkgrel=0.${_betaver}
pkgdesc='Offline and Git friendly API client for HTTP, GraphQL, WebSockets, SSE, and gRPC (Pre-compiled version)'
arch=(x86_64)
url='https://yaak.app/'
license=(MIT)
depends=(
	# As reported by namcap
	cairo
	gcc-libs
	gdk-pixbuf2
	glib2
	glibc
	gtk3
	hicolor-icon-theme
	libsoup3
	pango
	webkit2gtk-4.1
)
provides=(yaak yaak-app)
conflicts=(
	yaak
	yaak-bin
	yaak-bin-beta
	yaak-appimage
	yaak-git
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package because why not
)
source_x86_64=(
	"${pkgname}-${pkgver}-beta.${_betaver}.deb::https://github.com/mountain-loop/yaak/releases/download/v${pkgver}-beta.${_betaver}/yaak_${pkgver}-beta.${_betaver}_amd64.deb"
	"${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/mountain-loop/yaak/refs/tags/v${pkgver}-beta.${_betaver}/LICENSE"
)
b2sums_x86_64=('dff46ca611a6f0cf291caefa47db27fc8c06e78a8be2c472c7077a6c1db0ba10b5369235236a1bf965226bd59c7a023e0e35220308f0ebe0105e3ccfd8ac09dd'
               '011fb406bfe4a8944efbae1f9cfa420fe421f1de3ae628802548676a1fe1318850a5f98c60cd29899efe3946dec329b6607f04917e966808f62f9e4ecaaea13b')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
}

build() {
	sed -e 's|Name=yaak|Name=Yaak-beta|' \
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
}
