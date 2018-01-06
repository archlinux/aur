# $Id: PKGBUILD 276332 2017-12-28 05:13:56Z eschwartz $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nicolas Doualot <packages@slubman.info>

pkgname=neatx
pkgver=0.3.1
pkgrel=15
pkgdesc="A free NX server by google"
arch=('x86_64')
url="https://code.google.com/archive/p/neatx/"
license=('GPL')
depends=('python2-pexpect' 'python2-simplejson' 'netcat' 'pygtk')
makedepends=('docutils')
optdepends=('xorg-xdm: if you want to use KDE or GNOME session'
	    'xorg-fonts-misc: to use default font'
	    'xterm: if you want console session')
install=neatx.install
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/neatx/$pkgname-$pkgver.tar.gz
        constants.archlinux.patch)
md5sums=('5748656738d5f04fef1af01b9fe5ef20'
         'a5ca4aa399cc25fa8435280e8b03c5a3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -i "$srcdir/constants.archlinux.patch" -p2

  ./configure --prefix=/usr --localstatedir=/var RST2HTML=/usr/bin/rst2html2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  chmod 777 "$pkgdir/var/lib/neatx/sessions"

  install -d -m755 "$pkgdir"/etc/ld.so.conf.d/
  echo -e '/usr/lib\n/opt/NX/lib' > "$pkgdir"/etc/ld.so.conf.d/neatx.conf
}
