# Maintainer: nl6720 <nl6720@archlinux.org>
pkgname=zswap-disable-writeback
pkgver=1
pkgrel=1
pkgdesc='Disable zswap writeback using systemd cgroup configuration'
arch=('any')
url='https://aur.archlinux.org/packages/zswap-disable-writeback'
license=('0BSD')

package() {
	local _unit_type
	install -d "${pkgdir}/usr/lib/systemd/"{system,user}/{scope,service,slice,socket,mount,swap}.d/ "${pkgdir}/usr/lib/tmpfiles.d/"

	for _unit_type in {scope,service,slice,socket,mount,swap}; do
		printf '[%s]\nMemoryZSwapWriteback=false\n' "${_unit_type^}" >"${pkgdir}/usr/lib/systemd/system/${_unit_type}.d/zswap-disable-writeback.conf"
		cp -a -- "${pkgdir}/usr/lib/systemd/"{system,user}"/${_unit_type}.d/zswap-disable-writeback.conf"
	done
	printf 'w\t/sys/fs/cgroup/memory.zswap.writeback\t-\t-\t-\t-\t0\n' >"${pkgdir}/usr/lib/tmpfiles.d/zswap-disable-writeback.conf"
}
