# Maintainer: SoftExpert <softexpert at gmail dot com>
_pkgname=euro-office-lite
pkgname=${_pkgname}-bin
pkgver=0.17.44
pkgrel=1
pkgdesc='Lightweight desktop office suite built on Tauri v2 and Euro-Office editors. No cloud, no telemetry.'
arch=(x86_64)
url='https://github.com/delmarguillen/euro-office-lite'
license=(MIT)
depends=(
	# As reported by namcap
	cairo
	dbus
	glib2
	glibc
	gdk-pixbuf2
	gtk3
	libgcc
	libsoup3
	webkit2gtk-4.1
)
provides=(euro-office-lite)
conflicts=(
	euro-office-lite
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package
)
source_x86_64=(
	"${pkgname}-${pkgver}.deb::https://github.com/delmarguillen/${_pkgname}/releases/download/v${pkgver}-alpha/Euro-Office-Lite_${pkgver}-alpha_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/delmarguillen/euro-office-lite/refs/heads/main/LICENSE"
)
b2sums_x86_64=('de8c4a4050808d580df8f61a143156d7f329c551494cc02bbd07f27e423b60843624db667451dfab4730a26f8fb12fe4d0eb3317a19fcd3011b3660cc8ca5ddd'
               '25ff89b638fae6a63641f5196157086bdcb76c6f1d4c49470551a3cfd131951d2b7c40c48a9380fa4569b725e43e57e85d48df4a56abf9a119ddcd1b11d2a897')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
}

pkgver() {
	local _tagver
	_tagver=$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort=-v:refname --tags https://github.com/delmarguillen/euro-office-lite.git '*.*.*' | head -1 | sed 's/.*\///' | sed 's/^v//')
	printf "%s" "${_tagver%-alpha}"
}

package() {
	cp -r "${srcdir}/usr" "${pkgdir}/"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/lib"
	install -dm755 "${pkgdir}/usr/share"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
