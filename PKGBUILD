# Maintainer: Mario Hros <m-aur@k3a.me>

_userid=511
_username=carbonapi

pkgname=carbonapi
pkgver=0.11.0
pkgrel=1
pkgdesc="Replacement graphite API server written in Go"
arch=(i686 x86_64)
url='https://github.com/go-graphite/carbonapi'
license=('BSD')
conflicts=("$_pkgname-git")
options=('!strip')
depends=(glibc)
makedepends=('go>=1.8')
_gopkg=github.com/go-graphite/$pkgname
source=($pkgname-$pkgver.tar.gz::https://$_gopkg/archive/$pkgver.tar.gz
		carbonapi.yaml
		carbonapi.service)
sha256sums=('d54228f0fce17db1ed319bc7a65c4296b539e6fec34645bfcaed4baf39840efc'
            'cef6f2fb6702d32ce84765615ec8208f8d03f9d540f177e904f47c61e5ea1215'
            'd82c982d0f2673385d129c96d2566b28beed642b0bbd75f2b54dc497fa36bc24')

build() {
	export GOPATH="${srcdir}"

	# make fake GOPATH structure
	local _importPath="${srcdir}/src/$_gopkg"
	mkdir -p `dirname "$_importPath"`

	ln -sf "${srcdir}/${pkgname}-${pkgver}" "${_importPath}"
	cd "${_importPath}"

	make
}

package() {
	cd "${srcdir}/src/$_gopkg"

	install -Dm0755 "./carbonapi" "${pkgdir}/usr/bin/carbonapi"
	install -Dm0644 "${srcdir}/carbonapi.service" "${pkgdir}/usr/lib/systemd/system/carbonapi.service"
	install -Dm0644 "${srcdir}/carbonapi.yaml" "${pkgdir}/etc/carbonapi.yaml"
}

