# Maintainer: sputnick <gilles *DOT* quenot *AT* gmail>
# Contributor: Roland Kammerer <dev.rck@gmail.com>

pkgname=hellanzb-git
pkgver=9999
pkgrel=7
pkgdesc="nzb downloader and post processor"
url="https://github.com/pjenvey/hellanzb"
depends=('python2' 'twisted-web2' 'par2cmdline' 'unrar' 'python2-pyopenssl')
source=("hellanzb.rc" "hellanzb.conf.d" "877271.diff" "877271-2.diff" "877281.diff" "par2fix.diff")
arch=('i686' 'x86_64')
conflicts=('hellanzb')
provides=('hellanzb')
makedepends=('git')
license=('BSD')
install=hellanzb.install
backup=('etc/conf.d/hellanzb')
md5sums=('e33d67945276f754e3ba406bd947296d'
         '0bda37be41e3d0662bd8cdb0fdff6a20'
         'e02e555616f9ffd748f3aedaaf17d143'
         '93160251bb66d63cbc55e79765b3b1db'
         'c0da3f5b87a84abe2d5cb7c3d87769df'
         '3337cb86e63325a6ffb81842f9cbaff3' )

build() {
	cd $srcdir
	git clone git://github.com/pjenvey/hellanzb.git

	cd $srcdir/hellanzb

	# change the configuration directories searched from /usr/etc to /etc and
	# from ./etc to ~/.config
	sed -i \
		-e "\|confDirs = |s|sys.prefix|'/'|" \
		-e "\|confDirs\.append|s|join(os.getcwd(), *'etc|expanduser('~/.config|" \
		Hellanzb/Core.py

	patch < $srcdir/877271.diff $srcdir/hellanzb/Hellanzb/HellaXMLRPC/xmlrpc.py  
	patch < $srcdir/877271-2.diff $srcdir/hellanzb/Hellanzb/HellaXMLRPC/HtPasswdAuth.py
	patch < $srcdir/877281.diff $srcdir/hellanzb/Hellanzb/HellaReactor.py
	patch < $srcdir/par2fix.diff $srcdir/hellanzb/Hellanzb/PostProcessorUtil.py
}

package() {
	cd $srcdir/hellanzb
	python2 ./setup.py install --root=$pkgdir

	# not cool, but the compiled version is always bad for me so this forces a re-compile
	sleep 1
	touch $pkgdir/usr/lib/python2.7/site-packages/Hellanzb/HellaXMLRPC/xmlrpc.py \
		$pkgdir/usr/lib/python2.7/site-packages/Hellanzb/HellaXMLRPC/HtPasswdAuth.py \
		$pkgdir/usr/lib/python2.7/site-packages/Hellanzb/HellaReactor.py \
		$pkgdir/usr/lib/python2.7/site-packages/Hellanzb/PostProcessorUtil.py

	# move /usr/etc to /etc
	mv $pkgdir/usr/etc $pkgdir/

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# install the rc scripts
	mkdir -p $pkgdir/etc/{rc.d,conf.d}
	install -D -m755 $srcdir/hellanzb.rc $pkgdir/etc/rc.d/hellanzb
	install -D -m644 $srcdir/hellanzb.conf.d $pkgdir/etc/conf.d/hellanzb

    # quick fix from https://aur.archlinux.org/packages.php?ID=3935&comments=all
    sed -i s,"from twisted.internet.selectreactor import _NO_FILENO","#from twisted.internet.selectreactor import _NO_FILENO", $pkgdir/usr/lib/python2.7/site-packages/Hellanzb/HellaReactor.py
    sed -i s,"from twisted.internet.selectreactor import _NO_FILEDESC","#from twisted.internet.selectreactor import _NO_FILEDESC", $pkgdir/usr/lib/python2.7/site-packages/Hellanzb/HellaReactor.py
}
