# Maintainer: Mario Hros <m-aur@k3a.me>

pkgname=carbonapi
pkgver=0.16.1
_versuffix=
pkgrel=1
pkgdesc="Replacement graphite API server written in Go"
arch=(i686 x86_64)
url='https://github.com/go-graphite/carbonapi'
license=('BSD')
depends=(glibc cairo)
makedepends=('go>=1.14')
backup=('etc/carbonapi.yaml')
_gopkg=github.com/go-graphite/$pkgname
source=($pkgname-$pkgver.tar.gz::https://$_gopkg/archive/v$pkgver$_versuffix.tar.gz
		carbonapi.yaml
		carbonapi.service)
sha256sums=('0a7ee81949ec0e83a26c478833942e5eef663f56b53ea7b046113bca550b5ce3'
            'cef6f2fb6702d32ce84765615ec8208f8d03f9d540f177e904f47c61e5ea1215'
            '9d24333dfefc199957a2efa4779f69a9ad01f78bbff97c35dbacbb160b9bec50')

build() {
	export GOPATH="${srcdir}"

	# make fake GOPATH structure
	local _importPath="${srcdir}/src/$_gopkg"
	mkdir -p "${_importPath%/*}"

	ln -sf "${srcdir}/${pkgname}-${pkgver}${_versuffix}" "${_importPath}"
	cd "${_importPath}"

	make
}

package() {
	cd "${srcdir}/src/$_gopkg"

	install -Dm0755 "./carbonapi" "${pkgdir}/usr/bin/carbonapi"
	install -Dm0644 "${srcdir}/carbonapi.service" "${pkgdir}/usr/lib/systemd/system/carbonapi.service"
	install -Dm0644 "${srcdir}/carbonapi.yaml" "${pkgdir}/etc/carbonapi.yaml"

	install -Dm0644 "${srcdir}/${pkgname}-${pkgver}${_versuffix}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 noet:
