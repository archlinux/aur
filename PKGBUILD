# Maintainer: Peltoche <contact@duckcloud.fr>
pkgname=duckcloud
pkgver=24.03.02
pkgrel=2
epoch=1
pkgdesc="A full featured DAVx server"
arch=(x86_64 i686 armv6h armv7h aarch64)
url=https://duckcloud.fr
license=(AGPL3)
depends=(glibc)
makedepends=(go)
optdepends=()
backup=(usr/lib/systemd/system/duckcloud.service)

source=(https://github.com/theduckcompany/duckcloud/archive/refs/tags/${pkgver}.tar.gz
	LICENSE
	${pkgname}.service
	${pkgname}.sysusers
	${pkgname}.tmpfiles
	var_file
)

sha256sums=('16eb21015a5f7c3a422126cac1090772410e32549723817b3476eeb4a58e875d'
	'8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
	'8ae47dbd5fe33b71476045693e4a9eb0e03ffc66039c1f8c4221edb8d8b821c2'
	'ca526231ca260be83df4dfb5cc3d7400e82a35e3f164b9799c63be9d4b1bcead'
	'8ee8d3bf748a986fdd040e56c208742045df91837de3e250d5148e0b3fd65692'
	'a138ccf62a99c9735e44e78db833ee04b55d56ddbf6b229b405332c6b20deec2')

prepare() {
	cd ${pkgname}-${pkgver}
	go mod vendor
}

build() {
	cd ${pkgname}-${pkgver}
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -v \
		-ldflags "-linkmode external \
    -X github.com/theduckcompany/duckcloud/internal/tools/buildinfos.version=${pkgver} \
    -X github.com/theduckcompany/duckcloud/internal/tools/buildinfos.buildTime=$(date --utc -Iseconds) \
    -X github.com/theduckcompany/duckcloud/internal/tools/buildinfos.isRelease=true" \
		-o ${pkgname} ./cmd/duckcloud
}

package() {
	install -Dm644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm700 -d "${pkgdir}/etc/duckcloud"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "var_file" "${pkgdir}/etc/duckcloud"

	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
}
