# Maintainer:
pkgname=scrt-sfx-opt-bin
pkgver=9.6.2
pkgrel=3540
pkgdesc='SecureCRT + SecureFX 9.0 Bundle'
arch=('x86_64')
url='https://www.vandyke.com/'
license=('custom:VanDyke')
depends=(
	'glibc'
	'openssl'
	'qt5-base'
	'icu74'
)
provides=(
	'SecureCRT'
	'SecureFX'
)

_bundle_name=scrt-sfx
_tarball_base_name=${_bundle_name}-${pkgver}-${pkgrel}.ubuntu24-64
_tarball_name=${_tarball_base_name}.x86_64.deb

source=(
	"file://${_tarball_name}"
)

sha512sums=(
	"e732a55b9fed5dd0401d0ab72f1d60704cd2cfae448db08e49c85854208f73297c1cae3dd1cfeb7e41f03ccf32618f60bac66fe3b4ab293b6c01cd52b786bfab"
)

package() {
	stage_dir=${pkgdir}/opt/${pkgname}/${_tarball_base_name}

	install -dm755 "${stage_dir}"
	bsdtar -x -f data.tar.zst
	cp -R "${srcdir}"/usr/* "${stage_dir}"

	ln -s "/opt/${pkgname}/${_tarball_base_name}/lib/scrt-sfx/plugins/platforms" "${stage_dir}/bin"

	sed -ie "s+Exec=.*+Exec=/opt/${pkgname}/${_tarball_base_name}/bin/SecureCRT+" "${stage_dir}/share/applications/SecureCRT.desktop"
	sed -ie "s+Exec=.*+Exec=/opt/${pkgname}/${_tarball_base_name}/bin/SecureFX+" "${stage_dir}/share/applications/SecureFX.desktop"

	mkdir -p ${pkgdir}/usr/share/applications
	ln -s "/opt/${pkgname}/${_tarball_base_name}/share/applications/SecureCRT.desktop" ${pkgdir}/usr/share/applications/SecureCRT.desktop
	ln -s "/opt/${pkgname}/${_tarball_base_name}/share/applications/SecureFX.desktop" ${pkgdir}/usr/share/applications/SecureFX.desktop
	mkdir -p ${pkgdir}/usr/share/vandyke/data
	ln -s "/opt/${pkgname}/${_tarball_base_name}/share/vandyke/data/securecrt_64.png" ${pkgdir}/usr/share/vandyke/data/securecrt_64.png
	ln -s "/opt/${pkgname}/${_tarball_base_name}/share/vandyke/data/securefx_64.png" ${pkgdir}/usr/share/vandyke/data/securefx_64.png
}
