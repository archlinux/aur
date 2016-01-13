# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>

pkgname=liquidsoap
pkgver=1.2.0
pkgrel=1
pkgdesc="a swiss-army knife for multimedia streaming, notably used for netradios and webtvs"
arch=('i686' 'x86_64')
url="http://savonet.sourceforge.net/"
license=('GPL')
depends=('faad2' 'ffmpeg' 'gavl' 'gd' 'giflib' 'gst-plugins-base-libs' 'libao' 'libfdk-aac' 'liblo' 'libmad' 'libxpm' 
'ocaml-camomile' 'portaudio' 'sdl_image' 'sdl_ttf' 'soundtouch' 'taglib')
makedepends=('dssi' 'frei0r-plugins' 'ladspa' 'libxml-perl' 'ocaml-gd4o' 'ocaml-ocamlsdl' 'ocaml-pcre' 'ocaml-xmlm' 'ocaml-yojson' 'perl-xml-dom')
source=(https://github.com/savonet/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-full.tar.bz2
PACKAGES
$pkgname.service
$pkgname.tmpfilesd)
install=$pkgname.install
options=(!makeflags)
conflicts=('liquidsoap-git' 'liquidsoap-full')
sha256sums=('a20601a893da0716c186619afbfd848a92fbc88bca91a40665e06c7a97a92787'
            '7aada825a04a63566b57df3258525edc7d2f797300d5725c47f6920ef03a07b2'
            'df6d2cec1be47a57a02ed04a1f527c0349221fad39d8d152aca13734d3808661'
            '9f286958af0c751c2a43d74614cdd1c4629c0583d619875385c09417a5383675')

prepare() {
  cd $srcdir/$pkgname-$pkgver-full
  cp $srcdir/PACKAGES PACKAGES
}

build() {
  cd $srcdir/$pkgname-$pkgver-full
  ./configure --prefix=/usr  --localstatedir=/var --sysconfdir=/etc --without-user --without-group
  make all && make doc
}

package() {
  cd $srcdir/$pkgname-$pkgver-full 
  make DESTDIR="$pkgdir/" datadir="$pkgdir/usr/share/" mandir="$pkgdir/usr/share/man/"  localstatedir="$pkgdir/var"  bindir="$pkgdir/usr/bin/"  libdir="$pkgdir/usr/lib/" sysconfdir="$pkgdir/etc/" install

 # install systemd unit
  install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/liquidsoap@.service"
# Install the tmpfilesd file
        install -Dm0644 $srcdir/$pkgname.tmpfilesd $pkgdir/usr/lib/tmpfiles.d/liquidsoap.conf
}
# vim:set ts=2 sw=2 et:
