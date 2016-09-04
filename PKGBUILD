# Maintainer: Chris Cromer <chris@cromer.cl>
# Maintainer: artoo <artoo@manjaro.org>
# Contributor: Philip Müller <philm|manjaro|org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

_spkgrel=1
_repo=http://mirror.netcologne.de/archlinux/core/os

pkgbase=eudev-systemdcompat
pkgname=('eudev-systemd' 'libeudev-systemd')
pkgver=231
pkgrel=3
pkgdesc="systemd client libraries without udev; systemd compatibility package"
arch=('i686' 'x86_64')
license=('GPL2')
groups=('base' 'base-openrc')
url="http://www.freedesktop.org/wiki/Software/systemd"
source_i686=("$_repo/i686/libsystemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz"
		"$_repo/i686/systemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz")
source_x86_64=("$_repo/x86_64/libsystemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz"
		"$_repo/x86_64/systemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz"
		"gummibootx64.efi")
sha256sums_i686=('2f759a0864788357b4d27e77ebd743fbbf877c10a364bfb7b0dc004525b94e6a'
                 '40c5c372e008931240ec3e059a4b06ac67a58d86d492e66d4abb5651fef9483b')
sha256sums_x86_64=('a53e9c88112c2852b11410cdcd5365ce57e66b408a4a23195070c8fe4ab58a41'
                   '5efc276863a80fe9fea8bbe7f3e2a33792f9ec6be5e5db21c55c028e889ac18d'
                   'e0c6a40c74dc3a597dda977cb44bdf21759b8869e152d898d35664b8d3675fd3')

package_eudev-systemd() {
	pkgdesc="systemd-sysuser and systemd-tmpfiles binary; systemd compatibility package"
	provides=("systemd=${pkgver}" "systemd-tools=${pkgver}")
	depends=('eudev' 'libseccomp')
	conflicts=('systemd-tools' 'systemd' 'eudev-systemdcompat')
	replaces=('eudev-systemdcompat')

	install -d "$pkgdir"/usr/{bin,lib/systemd}
	for f in usr/bin/{systemd-tmpfiles,systemd-sysusers};do
		mv -v $f "$pkgdir"/usr/bin
	done
	for f in usr/lib/systemd/libsystemd-shared*.so*;do
		mv -v $f $pkgdir/usr/lib/systemd
	done
}

package_libeudev-systemd() {
	pkgdesc="systemd client libraries without udev; systemd compatibility package"
	provides=("libsystemd=${pkgver}" 'libsystemd.so')
	depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz' 'libeudev')
	conflicts=('libsystemd' 'eudev-systemdcompat')
	replaces=('eudev-systemdcompat')

	install -d $pkgdir/usr/lib/systemd/boot/efi
	for f in usr/lib/libsystemd*.so*;do
		mv -v $f $pkgdir/usr/lib
	done

	if [[ $CARCH == 'x86_64' ]];then
		install $srcdir/gummibootx64.efi $pkgdir/usr/lib/systemd/boot/efi/systemd-bootx64.efi
	fi
}
