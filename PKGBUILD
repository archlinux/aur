# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
pkgname=liquidsoap
pkgver=1.1.1
pkgrel=4
pkgdesc="a swiss-army knife for multimedia streaming, notably used for netradios and webtvs"
arch=('i686' 'x86_64')
url="http://savonet.sourceforge.net/"
license=('GPL')
depends=('faad2' 'ffmpeg' 'gavl' 'gd' 'giflib' 'gst-plugins-base-libs' 'libao' 'libfdk-aac' 'liblo' 'libmad' 'libxpm' 
'ocaml-camomile' 'portaudio' 'sdl_image' 'sdl_ttf' 'soundtouch' 'taglib')
makedepends=('dssi' 'frei0r-plugins' 'ladspa' 'libxml-perl' 'ocaml-gd4o' 'ocaml-includepatch' 'ocaml-ocamlsdl' 'ocaml-pcre' 'ocaml-xmlm' 'ocaml-yojson' 'perl-xml-dom')
source=(http://sourceforge.net/projects/savonet/files/$pkgname/$pkgver/$pkgname-$pkgver-full.tar.gz
PACKAGES
$pkgname.service
$pkgname.tmpfilesd)
install=$pkgname.install
options=(!makeflags)
conflicts=('liquidsoap-git' 'liquidsoap-full')
md5sums=('db65ddb099526423cc19fb7283db8821'
         '21d7e17ac7114edfd0a944c7773aa5af'
         '762d6607ff0889e34b8c874970b38bc9'
         'f9106e5c42cabc21c4c8464d9b1ad63e')

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
