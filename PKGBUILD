# Maintainer:
pkgname=scrt-sfx-opt-bin
pkgver=9.7.3
pkgrel=3916
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
	"ee8de434f2104bb990f85302ff9a3e553b9d5e6a260344209f15288c7831faae676c662743f6c73452596612cf3106c0d3629d948e9c62f02adcb6e6d93c23f7"
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
