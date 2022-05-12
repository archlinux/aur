# Maintainer:
pkgname=scrt-sfx-opt-bin
pkgver=9.2.1
pkgrel=2768
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
	"9d3526927bb585ddbe6427671d4cfda902a17d2ce86d3edda441689bf2bec016a27c040710b2c5a70f555c7ddea4bd9334887235d12db48aa61b31169b0c8fb2"
	"f46030dc72545c82e12bd59f5a54003eab04bdb8cae9584f00ab0fd33550c943f48b8621cbd82efff0333286f0d795bee870bba18c7753358645cf14bf4fbc84"
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
