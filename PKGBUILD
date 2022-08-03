# Maintainer:
pkgname=scrt-sfx-opt-bin
pkgver=9.2.3
pkgrel=2829
pkgdesc='SecureCRT + SecureFX 9.0 Bundle'
arch=('x86_64')
url='https://www.vandyke.com/'
license=('custom:VanDyke')
depends=('glibc' 'openssl' 'qt5-base' 'icu66')
provides=('SecureCRT' 'SecureFX')
install=${pkgname}-${pkgver}-${pkgrel}.install

_bundle_name=scrt-sfx
_tarball_base_name=${_bundle_name}-${pkgver}.${pkgrel}.ubuntu20-64
_tarball_name=${_tarball_base_name}.tar.gz

source=(
	"file://${_tarball_name}"
	"${install}"
)

sha512sums=(
	"2f1c3c242ab1777bc552edc7040ef6b7fb5054c2fc922660d9462b8bae3b647e5f5834652069ddc4fe0d6dc37931063c83742a4b00248780b6ce3c192092c560"
	"ebd54e0f617f0d45eab8c11dda30446fa3efb83de82a5a7174ab91c401f8a6626452d943306a948adaf1e2e65fbd18f5d64862524d980c04ac5f239aa8ee8a01"
)

package() {
	stage_dir=${pkgdir}/opt/${pkgname}/${_tarball_base_name}

	install -dm755 "${stage_dir}"
	cp -R "${srcdir}"/${_bundle_name}-${pkgver}/* "${stage_dir}"

	ln -s /usr/lib/qt/plugins/platforms "${pkgdir}/opt/${pkgname}/${_tarball_base_name}"

	sed -ie "s+Exec=.*+Exec=env LD_LIBRARY_PATH=/opt/${pkgname}/${_tarball_base_name} /opt/${pkgname}/${_tarball_base_name}/SecureCRT+" ${srcdir}/${_bundle_name}-${pkgver}/SecureCRT.desktop
	sed -ie "s+Exec=.*+Exec=env LD_LIBRARY_PATH=/opt/${pkgname}/${_tarball_base_name} /opt/${pkgname}/${_tarball_base_name}/SecureFX+" ${srcdir}/${_bundle_name}-${pkgver}/SecureFX.desktop

	mkdir -p ${pkgdir}/usr/share/applications
	cp -ar ${srcdir}/${_bundle_name}-${pkgver}/SecureCRT.desktop ${pkgdir}/usr/share/applications
	cp -ar ${srcdir}/${_bundle_name}-${pkgver}/SecureFX.desktop ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/vandyke/data
	cp -ar ${srcdir}/${_bundle_name}-${pkgver}/securecrt_64.png ${pkgdir}/usr/share/vandyke/data/securecrt_64.png
	cp -ar ${srcdir}/${_bundle_name}-${pkgver}/securefx_64.png ${pkgdir}/usr/share/vandyke/data/securefx_64.png
}
