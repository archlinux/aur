# Maintainer:
pkgname=scrt-sfx-opt-bin
pkgver=9.2.2
pkgrel=2794
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
	"9354a46d7b3062b42b93fdcd4f35f1b59ba44ea68ecb90df9ce08f155f311b755186b1472f494f04aa76c611c558b131932b7438089e80c7ac82ce31d45bb161"
	"9cffb2c7f6a73127b2d591474770270470e56057ba4ded83e7d702070930d18ffe36dc3fc45b4684c01ac73a916af0269385412b060bcf3a4677713b521f69c7"
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
