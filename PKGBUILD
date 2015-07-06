# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=yfktest
pkgver=0.0.10
pkgrel=2
pkgdesc="Ham Radio Contesting Logger"
arch=('any')
url="http://fkurz.net/ham/yfktest.html"
license=('GPL')
depends=('perl-curses' 'desktop-file-utils' 'cty' 'masterscp')
optdepends=('hamlib: rig interfacing'
	    'cwdaemon: transmitting cw'
	    'winkeydeamon: usb cw xmit'
	    'bigcty: contest version country files')
install=$pkgname.install
source=(
#http://fkurz.net/ham/$pkgname/$pkgname-$pkgver.tar.gz
		$pkgname.desktop
		$pkgname.png
		$pkgname.1)

__svntrunk="svn://svn.fkurz.net/yfktest/"
__svnmod=('trunk')
__svnrev=656

prepare() {
	cd "$srcdir"
	msg "Connecting to SVN server...."

	for i in "${__svnmod[@]}"; do
	  if [[ -d "$i/.svn" ]]; then
	  (cd "$i" && svn up -r "$__svnrev")
	    else
	    svn co "$__svntrunk/$i" -r "$__svnrev"
	  fi
	done

	msg "SVN checkout done or server timeout"
}

package() {
	cd "$srcdir/$__svnmod"
	install -d $pkgdir/usr/share/$pkgname

	cp -a * $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications

	cd "$pkgdir/usr/share/$pkgname"
	cp -a docs/MANUAL docs/FAQ-NEW-INFO .
	rm -rf cty.dat master.scp README* winkey* yfktest.* docs/ misc/ voice/
	sed -i s:'.\/yfktest ':'yfktest ': subs/newcontest.pl
	sed -i s:'.\/yfktest ':'yfktest ': yfktest
	sed -i s:'.\/yfktest ':'yfktest ': MANUAL
}
md5sums=('9bb89d06dccd06098209c3f35cfc9997'
         '0c5fc02db4577b3b1ffcc23e5c7a2b8e'
         'a5b6724edc0adb82e53870c81dac4281')
sha256sums=('c7f87c8c1e049277acde59db12a07ee52d2ba8757464652ddccd5d5354d20675'
            'ae4886c24e08425d7a9d6c31290924f8b328d0b2fe59b3d0c0e94ecf4d62b039'
            'c5018a263f314eca09561d8daa8f15b5de1b31f97811ca6d52a65b0b20e63409')
