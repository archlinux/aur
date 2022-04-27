# Maintainer:
pkgname=scrt-sfx-opt-bin
pkgver=9.2.0
pkgrel=2755
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
	"55e71b0f5137dce775521c9ced5473a291b7af9bd8307dd2c5b60688e281f97f0f2649308f7f1b13675c579f781bba3881b2f0f49fecfcba8c0b425ddbf6dec7"
	"09c082c4c698d0baf1f7084a465624fe4237252f49d46d6caa6fcef91e08dac163566678ebd649e57a077a45d60bae512021cf5adc0c0a7da64ac54623fc443a"
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
