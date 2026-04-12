# Maintainer: derfenix<derfenix@gmail.com>

pkgname=archiveopds
pkgver=1.0.9
pkgrel=1
pkgdesc='OPDS-server for INPX catalogs and external ZIP-files'
arch=(x86_64 aarch64)
url='https://git.derfenix.pro/derfenix/archiveopds'
license=('GPL-3.0-or-later')
install=archiveopds.install
makedepends=('go')
depends=('glibc')
options=('!lto')

_tag="v${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('50df591688d61ce19ffef8cdce810377ebde579a820b1d00b7a2efeda8b794b9')

prepare() {
	cd "${srcdir}"
	local _top _n
	_n=$(find . -mindepth 1 -maxdepth 1 -type d ! -name '.*' | wc -l)
	if [[ "$_n" -ne 1 ]]; then
		printf 'prepare: one root folder expected (got %s)\n' "$_n" >&2
		return 1
	fi
	_top=$(find . -mindepth 1 -maxdepth 1 -type d ! -name '.*')
	if [[ "$(basename "$_top")" != "$pkgname" ]]; then
		mv "$_top" "$pkgname"
	fi
}

build() {
	cd "${srcdir}/${pkgname}"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags="-s -w" -o archiveopds ./cmd/archiveopds
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 archiveopds "${pkgdir}/usr/bin/archiveopds"
	install -Dm644 deploy/systemd/archiveopds.service "${pkgdir}/usr/lib/systemd/system/archiveopds.service"
	install -Dm644 deploy/sysusers.d/archiveopds.conf "${pkgdir}/usr/lib/sysusers.d/archiveopds.conf"
	install -d "${pkgdir}/etc/archiveopds"
	install -Dm644 deploy/systemd/archiveopds.env.example "${pkgdir}/etc/archiveopds/environment.example"

	sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/archiveopds serve|' \
		"${pkgdir}/usr/lib/systemd/system/archiveopds.service"
}
