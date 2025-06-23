# Maintainer: Scott Alfter <scott@alfter.us>
pkgname=mac-fdisk
pkgver=0.1p18
pkgrel=2
pkgdesc="Apple II/Mac disk partitioning utility (ported from the Gentoo ebuild)"
arch=("i686" "x86_64")
url="ftp://ftp.mklinux.apple.com/pub/Other_Tools/"
license=("GPL-2")
provides=("pdisk")
conflicts=("pdisk")
source=(
	"mac-fdisk-$pkgver.tar.gz::http://ftp.us.debian.org/debian/pool/main/m/mac-fdisk/mac-fdisk_0.1.orig.tar.gz"
	"http://ftp.us.debian.org/debian/pool/main/m/mac-fdisk/mac-fdisk_0.1-18.diff.gz"
	"largerthan2gb.patch"
	"mac-fdisk-0.1-headers.patch"
	"mac-fdisk-0.1_p16-ppc64.patch"
	"mac-fdisk-amd64.patch"
	"big_pt.patch"
	"mac-fdisk-0.1_p16-ppc-inline.patch"
	"mac-fdisk-0.1_p18-lseek64.patch"
)
sha256sums=(
	7059fc4ba41ca2ef857e1092e9c56e910f27693d407b5c3d78f7102ad0c56a66
	49e14aab9deefac5da67ebe8ce72412d27091853806fe2da690ff3854704181e
	0132bb4185d5ec13a4f2220579763c83e6472eeba1c30f6972ba8e3039ffa0b3
	02fa96e89dabe0eeaeb219ecbf88ec553639f7b84d58e7e058d589daf2cdff0f
	18ad277e06b9f67397a2d91b288fb67a303d4edc995300c8c6e5d614619b7858
	8c0a160d1f93b5cd79265a088eff3546a3963512a619d9570aae60b63517a7ec
	217659768cea64ac99133f3b67307c2687f6d8682f1dfe0669706a48a9fcb2ef
	c10a17d83dcecf195ba862b41a61a7b529834dfa5cfcefdf472592fccf552cc0
	a7c45115ab1d4ba7c1505f1c8ff5f5d2c166a85b6b831b833d9138958fe4e72d
)

prepare()
{
	cd mac-fdisk-0.1.orig
	patch -p1 -i $srcdir/mac-fdisk_0.1-18.diff
	# patchset borrowed from Gentoo
	patch -p1 -i $srcdir/largerthan2gb.patch
	patch -p1 -i $srcdir/mac-fdisk-0.1-headers.patch
	patch -p1 -i $srcdir/mac-fdisk-0.1_p16-ppc64.patch
	patch -p1 -i $srcdir/mac-fdisk-amd64.patch
	patch -p1 -i $srcdir/big_pt.patch
	patch -p1 -i $srcdir/mac-fdisk-0.1_p16-ppc-inline.patch
	patch -p1 -i $srcdir/mac-fdisk-0.1_p18-lseek64.patch
}

build()
{
	export CFLAGS="${CFLAGS} -Wno-error=format-security" # io.c fails without this
	cd mac-fdisk-0.1.orig
	make
}

package()
{
	cd mac-fdisk-0.1.orig
	install -Dm 755 pdisk "${pkgdir}/usr/bin/pdisk"
	gzip pdisk.8
	install -Dm 644 pdisk.8.gz "${pkgdir}/usr/share/man/man8/pdisk.8.gz"
}
