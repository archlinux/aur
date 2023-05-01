# Maintainer: éclairevoyant
# Contributor: EatMyVenom <eat.my.venomm at gmail dot com>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sysvinit
pkgver=3.07
pkgrel=1
pkgdesc='Linux System V Init'
url="https://github.com/slicer69/$pkgname"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc' 'procps-ng>=3.3.9')
optdepends=('e2fsprogs')
conflicts=('systemd-sysvcompat')
source=($url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz{,.sig}
        $pkgname-makefile.patch)
b2sums=('51943290c5f41ac6eb421a3ee1529d07bc127a44306973a2f3180079a28119001ad6b44c25156986fe249dd025f5eb1929189edfb5da72ee4fa64b5fd4cd5993'
        'SKIP'
        '8877b4523b2aeb75e602e4ef53007e9258a76a1a981e620ea3c6e275a97257f9efb060f102ea95a914c3729bd26fcc360b5613276641b61d452417bff2fa6878')
validpgpkeys=(
	'5A2DC686CDC5D6087D88C198351F75FA45D53656' # sysvinit-verification-key-2.pub
	'C1A4432D88896729E4300B04AFD1B98BF3273812' # sysvinit-verification-key-3.pub
)

prepare() {
	cd $pkgname-$pkgver

	# Patch for Arch's Linux filesystem hierarchy
	if [ "$(grep 'execv("/sbin/mount", args);' < src/killall5.c | wc -l)" = 1 ]; then
		sed -i 's|execv("/bin/mount", args);||' src/killall5.c
	fi
	sed -i 's|/bin:/sbin:/usr/bin:/usr/sbin|/usr/bin|' src/init.h src/shutdown.c
	sed -i 's|/sbin:/usr/sbin:/bin:/usr/bin|/usr/bin|' src/init.h src/shutdown.c
	sed -i 's|/bin:/usr/bin:/sbin:/usr/sbin|/usr/bin|' src/init.h src/shutdown.c
	sed -i 's|/sbin/|/bin/|g;s|/bin/|/usr/bin/|g;s|/usr/usr/|/usr/|g' \
		contrib/notify-pam-dead.patch man/*.{1,5,8} src/*.{c,h}

	# last, lastb, mesg are part of util-linux
	# pidof is part of procps-ng
	# logsave is part of e2fsprogs
	patch -Np0 -F0 -i ../$pkgname-makefile.patch
}

build() {
    cd $pkgname-$pkgver
    make DISTRO=archlinux
}

package() {
    cd $pkgname-$pkgver
    make DISTRO=archlinux ROOT="$pkgdir" install
}
