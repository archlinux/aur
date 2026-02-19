# Maintainer:
pkgname=scrt-sfx-opt-bin
pkgver=9.7.1
pkgrel=3815
pkgdesc='SecureCRT + SecureFX 9.0 Bundle'
arch=('x86_64')
url='https://www.vandyke.com/'
license=('custom:VanDyke')
depends=(
	'glibc'
	'openssl'
	'qt6-base'
	'qt6-multimedia'
	'qt6-5compat'
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
	"f2bc66634b4c88cfd2a76e27c008360224e4d4e3a00ea36218b3d734eee8fea05a954a4f7cd068d8a7ac3209ac15eba9d51891bc3c7fe744175775ebd2e58219"
)

package() {
	stage_dir=${pkgdir}/opt/${pkgname}/${_tarball_base_name}

	install -dm755 "${stage_dir}"
	bsdtar -x -f data.tar.zst
	cp -R "${srcdir}"/usr/* "${stage_dir}"

	ln -s "/opt/${pkgname}/${_tarball_base_name}/lib/scrt-sfx/plugins/platforms" "${stage_dir}/bin"

	sed -ie "s+Exec=.*+Exec=env QT_QPA_PLATFORM=xcb /opt/${pkgname}/${_tarball_base_name}/bin/SecureCRT+" "${stage_dir}/share/applications/SecureCRT.desktop"
	sed -ie "s+Exec=.*+Exec=env QT_QPA_PLATFORM=xcb /opt/${pkgname}/${_tarball_base_name}/bin/SecureFX+" "${stage_dir}/share/applications/SecureFX.desktop"

	mkdir -p ${pkgdir}/usr/share/applications
	ln -s "/opt/${pkgname}/${_tarball_base_name}/share/applications/SecureCRT.desktop" ${pkgdir}/usr/share/applications/SecureCRT.desktop
	ln -s "/opt/${pkgname}/${_tarball_base_name}/share/applications/SecureFX.desktop" ${pkgdir}/usr/share/applications/SecureFX.desktop
	mkdir -p ${pkgdir}/usr/share/vandyke/data
	ln -s "/opt/${pkgname}/${_tarball_base_name}/share/vandyke/data/securecrt_64.png" ${pkgdir}/usr/share/vandyke/data/securecrt_64.png
	ln -s "/opt/${pkgname}/${_tarball_base_name}/share/vandyke/data/securefx_64.png" ${pkgdir}/usr/share/vandyke/data/securefx_64.png
}
