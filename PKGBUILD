# Maintainer: Geoffrey Frogeye <geoffrey+aur@frogeye.fr>

_pkgauthor=TrilliumIT
pkgname=docker-zfs-plugin
pkgver=1.0.5
pkgrel=1
pkgdesc="Docker volume plugin for creating persistent volumes as a dedicated zfs dataset."
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')
depends=('docker' 'zfs-utils')
makedepends=('go' 'sed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgauthor}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0e36553f8b6588af40c8dd026350d3d63d015b04eb4cce388f6a106339d0d28c')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's|/usr/local/bin/docker-zfs-plugin|/usr/bin/docker-zfs-plugin|' "${pkgname}.service"

}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	export GOLDFLAGS="-linkmode=external"
	go build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/${pkgname}
	install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	# For most cases this won't be usable as is, but also in most cases the
	# user will want to override the service's ConditionPathIsMountPoint.
	# So I prefer leaving it as is rather than providing a different service
	# file which is less maintainable.
	install -Dm644 "${pkgname}.socket" "${pkgdir}/usr/lib/systemd/system/${pkgname}.socket"
}
