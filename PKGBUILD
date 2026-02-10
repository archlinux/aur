# Maintainer: Renat Gorbushin <lis@lis314.ru>
pkgname=amd-container-toolkit
pkgver=1.2.0
pkgrel=2
pkgdesc="Offers tools that streamline the use of AMD GPUs with containers."
arch=('x86_64')
url="https://github.com/ROCm/container-toolkit"
license=('Apache-2.0')
depends=('docker')
checkdepends=('go')
_srcname=container-toolkit
source=("${pkgname}-${pkgver}.tar.gz"::https://github.com/ROCm/container-toolkit/archive/refs/tags/v${pkgver}.tar.gz,
		'docker-rootless.patch')
sha256sums=('1b4a07f4775aa4538db28c5340c1b917355d3ff3c4a427ddeb349368271e4cf1'
            'a5e338acd28048cf3029ba83f737fc44ad1ad5e0bdc76109409169fa23ce06a6')

prepare() {
	if docker info -f "{{println .SecurityOptions}}" | grep rootless >/dev/null; then
		echo "Docker is running in rootless mode, applying patch"
		patch -d "${_srcname}-${pkgver}" -Np1 -i ../docker-rootless.patch
	fi
}

build() {
	cd "${srcdir}/${_srcname}-${pkgver}"
	make
}

check() {
	cd "${_srcname}-${pkgver}"
	make test
}

package() {
	cd "${_srcname}-${pkgver}"
	install -Dm755 bin/deb/amd-container-runtime "${pkgdir}/usr/local/bin/amd-container-runtime"
	install -Dm755 bin/deb/amd-ctk "${pkgdir}/usr/local/bin/amd-ctk"
}
