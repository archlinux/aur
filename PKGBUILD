# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributors: Det, Lexiw, Angel 'angvp' Velasquez, dongiovanni,
# Darwin Bautista, Jeremy Sands, carstene1ns
# And the people here: http://bbs.archlinux.org/viewtopic.php?id=48978
 
pkgname=splashy-full
pkgver=c2c9cc2
pkgrel=1
pkgdesc="A boot splashing system"
arch=('any')
url="http://anonscm.debian.org/gitweb/?p=splashy/splashy;a=summary"
license=('GPL')
depends=('mkinitcpio' 'sysfsutils' 'glib2' 'directfb')
makedepends=('git')
options=('!libtool' '!distcc' '!makeflags')
provides=(splashy)
install=$pkgname.install
backup=(etc/splash.conf
	etc/splashy/config.xml)
source=(splashy::git+https://alioth.debian.org/anonscm/git/splashy/splashy.git
	splash.conf
	splash-initscripts
	splashy-functions
	initcpio_hook
	initcpio_install
	automake.patch
	configure.ac.patch)
sha512sums=('SKIP'
            'd48cffcd5f810c53100011b4f4b5437b69c2e0da3d261d22907dcbe20515abbeef06755c367ff3f0a77bf830eb67e165bb62eea717af76b4bcb0b631832af830'
            'd60dbb2b71f30b1d94a43f28fd8219df6271c08b26e92b5bd43d0beed0e9360afa1de250af01af104811cfcb7b30458669689d10b74a197033d6def562f60f3e'
            'c2cb16c9f61eb1feea8ebc22daa03d0aa3633caa30d2e45112e11da02940ee0028cb5e65e7ca07ae090f71150488ac0938e98dd4066b0e1e732710b96b1f99a3'
            '270511c7336aaf0dea0db13c868ebd93916519bb042c245f031703cc49ad395c444f33817803fbd11fa5e6dca42624135223028176bec8deae9622f15caf4494'
            '5d12f6edcf572d26daf51b95aba98db1097ff2f2aeab4cd6cc400ba84b1194589d5a0a0360f9f929f2fcf63c79e107892401d38336ef908794447c14bda2fdb8'
            '129866f6c84a1642fbe68f614f288655e0ddda5b4036454978321e0b9ba597ab019c952c4950d0b25c421ef1cd7ee1fa784a8b2a8809ef32acf52da1831c4644'
            '2ede62cc64e5348b564a93d07449bd3d60296203ca8112ded073239e77f288be52e774b3cd5fe2026d41cb8bc117b45c00208653809da0d2056a85ad8fab152f')

pkgver() {
  cd "$srcdir/splashy"
  git describe --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
cd splashy
 
# Fix the build
#sed -e 's|-Werror||g' -i configure.ac
	patch -p1 ./autogen.sh $srcdir/automake.patch
	patch -p1 ./configure.ac $srcdir/configure.ac.patch
 
./autogen.sh 	--prefix=/usr \
		--libdir=/usr/lib \
		--sysconfdir=/etc \
		--sbindir=/sbin \
		--datarootdir=/usr/share \
		--mandir=/usr/share/man \
		--includedir=/usr/include
 
make
}
 
package() {
cd splashy
 
make DESTDIR="$pkgdir/" install
 
rm -rf "$pkgdir/"{etc/{console-tools,default,init.d,lsb-base-logging.sh},usr/share/initramfs-tools}
 
install -Dm644 ../initcpio_install "$pkgdir"/usr/lib/initcpio/install/splashy
install -Dm644 ../initcpio_hook "$pkgdir"/usr/lib/initcpio/hooks/splashy
install -Dm644 ../splashy-functions "$pkgdir"/etc/rc.d/splashy-functions
install -Dm644 ../splash-initscripts "$pkgdir"/etc/rc.d/functions.d/splash
install -Dm644 ../splash.conf "$pkgdir"/etc/splash.conf
 
sed -e 's|>/etc/splashy/themes<|>/usr/share/splashy/themes<|' -i "$pkgdir"/etc/splashy/config.xml
}