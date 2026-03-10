# Maintainer: Charlie Wolf <charlie@wolf.is>
# Based on scrt-sfx-opt-bin package by kistlin

pkgname=scrt-opt-bin
pkgver=9.7.1
pkgrel=3815
pkgdesc='SecureCRT'
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
)

_bundle_name=scrt
_tarball_base_name=${_bundle_name}-${pkgver}-${pkgrel}.ubuntu24-64
_tarball_name=${_tarball_base_name}.x86_64.deb

source=(
	"file://${_tarball_name}"
)

sha512sums=('67b7c6e8095de0ffb846c03023698e07dde0ae34bfd6486c61a418e90ab230334ccf37d669674d286ef1e0d01e75707935e54535ca4770679ac9b8beab53e1f5')

package() {
	stage_dir=${pkgdir}/opt/${pkgname}/${_tarball_base_name}

	install -dm755 "${stage_dir}"
	bsdtar -x -f data.tar.zst
	cp -R "${srcdir}"/usr/* "${stage_dir}"

	ln -s "/opt/${pkgname}/${_tarball_base_name}/lib/scrt/plugins/platforms" "${stage_dir}/bin"

	sed -ie "s+Exec=.*+Exec=env QT_QPA_PLATFORM=xcb /opt/${pkgname}/${_tarball_base_name}/bin/SecureCRT+" "${stage_dir}/share/applications/SecureCRT.desktop"

	mkdir -p ${pkgdir}/usr/share/applications
	ln -s "/opt/${pkgname}/${_tarball_base_name}/share/applications/SecureCRT.desktop" ${pkgdir}/usr/share/applications/SecureCRT.desktop
	mkdir -p ${pkgdir}/usr/share/vandyke/data
	ln -s "/opt/${pkgname}/${_tarball_base_name}/share/vandyke/data/securecrt_64.png" ${pkgdir}/usr/share/vandyke/data/securecrt_64.png
}
