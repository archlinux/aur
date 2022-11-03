# Maintainer:
pkgname=scrt-sfx-opt-bin
pkgver=9.3.0
pkgrel=2905
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
	"7e33f44167371312b24c7a191be41080a4eb1a066353a90c7de18e8d96773c55d75a94a4a5d9137da881360fe248cde079a155779cfc18339ac47ea860c27e49"
	"6a0d596f6f3e9d930165356b81be39a181a1a8ac26ec9c3e42652b5e1a63f3597d01dc577cdbff1f2e591d070259e6cfc912e213248dd12d7147b10370708128"
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
