# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=jfbterm-freebsd
pkgver=0.6.1
pkgrel=2
pkgdesc="A multilingual terminal on framebuffer"
arch=('i686' 'x86_64')
url='http://www.ac.auone-net.jp/~baba/jfbterm/'
conflicts=('jfbterm')
license=('BSD')
groups=('i18n')
install=$pkgname.install
depends=('pcf-unifont' 'libpng')
makedepends=('sed')
backup=etc/jfbterm/jfbterm.conf
source=("http://www.ac.auone-net.jp/~baba/jfbterm/jfbterm-FreeBSD-0.6.1.tar.gz"
'framebuffer.c.patch'
'screensaver.c.patch'
'jfbterm.conf.sample.Linux.patch'
)
md5sums=('fc5946d2ee0a9dae0d5aa6fc806416c3'
         '976e2e90cd24b9280a255da72bd69db8'
         'e598fccf3ac19267386d8e29463c30ef'
         'c57861774ec9b05b8b59d936f6cdb4a6')

prepare() {
  cd "$srcdir/jfbterm-FreeBSD-$pkgver"
  patch -p0 --verbose -i ../framebuffer.c.patch
  patch -p0 --verbose -i ../screensaver.c.patch
  patch -p0 --verbose -i ../jfbterm.conf.sample.Linux.patch
}

build() {
  cd "$srcdir/jfbterm-FreeBSD-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc/jfbterm
  make
}

package() {
  cd "$srcdir/jfbterm-FreeBSD-$pkgver"
  install -d "$pkgdir/"{etc/jfbterm,usr/share/man/man1}
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/"etc/jfbterm/jfbterm.conf.sample "$pkgdir/"etc/jfbterm/jfbterm.conf
  sed --in-place --expression='s/X11//g' "$pkgdir/"etc/jfbterm/jfbterm.conf
}

# vim:set ts=2 sw=2 et:
