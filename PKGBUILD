# Maintainer: artoo <artoo@manjaro.org>
# Contributor: Philip Müller <philm|manjaro|org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

_spkgrel=1
_y=2015
_m=05
_d=23
_url=http://seblu.net/a/arm/$_y/$_m/$_d/core/os
_repo=http://mirror.netcologne.de/archlinux/core/os

pkgname=eudev-systemdcompat
pkgver=221
pkgrel=2
pkgdesc="systemd client libraries without udev; systemd compatibility package"
arch=('i686' 'x86_64')
license=('GPL2')
groups=('eudev-base')
url="http://www.freedesktop.org/wiki/Software/systemd"
provides=("libsystemd=${pkgver}"
            "systemd=${pkgver}"
            "systemd-tools=${pkgver}"
            'libsystemd.so'
            'libsystemd-daemon.so'
            'libsystemd-id128.so'
            'libsystemd-journal.so'
            'libsystemd-login.so')
depends=('glib2' 'glibc' 'libgcrypt' 'xz' 'eudev>=3.1.2')
optdepends=('upower-pm-utils: pm-utils support')
conflicts=('systemd'
			'systemd-tools'
			'libsystemd'
			'openrc-systemdcompat')
replaces=('openrc-systemdcompat')

if [ "$CARCH" = "i686" ]; then
    source=("$_repo/i686/libsystemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz"
			"$_repo/i686/systemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz")
	sha256sums=('8b314f4bf6773ef9211f46d34cee7112cade6b567e18a8c270aa3822a2838362'
				'8f783aaa36927c5082cd42f2738f90cd81da927959b18afbef42353a5cfc1c9c')
elif [ "$CARCH" = "x86_64" ]; then
    source=("$_repo/x86_64/libsystemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz"
			"$_repo/x86_64/systemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz")
	sha256sums=('567732f68b3a6c583516205bd2fddef4f7db63bd869988cb7c1f34b401968c15'
            '53faf6a01bd593b077a44b3d9a4bf66540f7c0f7ba3c6ea84a1ddcab28bdb573')
fi

# if [ "$CARCH" = "i686" ]; then
#     source=("$_url/i686/libsystemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz"
# 			"$_url/i686/systemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz")
# 	sha256sums=('5dd169b36e126702d683a2b81efcc80a830fea622dc83380dbec94513876a586'
# 				'f9f3d59c9fa2ed6474216feca2fc36fcb231aa8ca07f69d6a4f4f10db84399ab')
# elif [ "$CARCH" = "x86_64" ]; then
#     source=("$_url/x86_64/libsystemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz"
# 			"$_url/x86_64/systemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz")
# 	sha256sums=('f9f3d59c9fa2ed6474216feca2fc36fcb231aa8ca07f69d6a4f4f10db84399ab'
# 				'f9f3d59c9fa2ed6474216feca2fc36fcb231aa8ca07f69d6a4f4f10db84399ab')
# fi

prepare() {
	#clean libsystemd
	rm usr/lib/libudev*.so*

	# clean systemd
	rm -r {etc,var,usr/{include,share}}
	rm usr/lib/libnss*
	for d in usr/lib/*;do
		[[ -d $d ]] && rm -r $d
	done
	for f in usr/bin/*;do
		[[ $f != 'usr/bin/systemd-tmpfiles' && $f != 'usr/bin/systemd-sysusers' ]] && rm $f
	done
}

package() {
	mv "$srcdir/usr/" "$pkgdir"
}
