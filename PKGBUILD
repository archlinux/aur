# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>

pkgname=liquidsoap-git
pkgver=c31461b
pkgrel=1
pkgdesc="a swiss-army knife for multimedia streaming, notably used for netradios and webtvs"
arch=('i686' 'x86_64')
url="http://savonet.sourceforge.net/"
license=('GPL')
depends=('faad2' 'ffmpeg' 'gavl' 'gd' 'giflib' 'gst-plugins-base-libs' 'libao' 'libfdk-aac' 'liblo' 'libmad' 'libxpm' 
'ocaml-camomile' 'portaudio' 'sdl_image' 'sdl_ttf' 'soundtouch' 'taglib')
makedepends=('git' 'dssi' 'frei0r-plugins' 'ladspa'  'libxml-perl' 'ocaml-gd4o' 'ocaml-ocamlsdl' 'ocaml-pcre' 'ocaml-xmlm' 'ocaml-yojson' 'perl-xml-dom')
source=($pkgname::git://github.com/savonet/liquidsoap-full.git
PACKAGES
$pkgname.service
$pkgname.tmpfilesd)
install=$pkgname.install
options=(!makeflags)
provides=('liquidsoap')
conflicts=('liquidsoap' 'liquidsoap-full')
sha256sums=('SKIP'
            '7aada825a04a63566b57df3258525edc7d2f797300d5725c47f6920ef03a07b2'
            'df6d2cec1be47a57a02ed04a1f527c0349221fad39d8d152aca13734d3808661'
            '9f286958af0c751c2a43d74614cdd1c4629c0583d619875385c09417a5383675')

pkgver() {
  cd $pkgname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd $srcdir/$pkgname
  make init
  cp $srcdir/PACKAGES PACKAGES
  ./bootstrap 
}

build() {
  cd $srcdir/$pkgname
  ./configure --prefix=/usr  --localstatedir=/var --sysconfdir=/etc --without-user --without-group
  make all && make doc
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir/" datadir="$pkgdir/usr/share/" mandir="$pkgdir/usr/share/man/"  localstatedir="$pkgdir/var"  bindir="$pkgdir/usr/bin/"  libdir="$pkgdir/usr/lib/" sysconfdir="$pkgdir/etc/" install

 # install systemd unit
  install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/liquidsoap@.service"
# Install the tmpfilesd file
        install -Dm0644 $srcdir/$pkgname.tmpfilesd $pkgdir/usr/lib/tmpfiles.d/liquidsoap.conf
find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
# vim:set ts=2 sw=2 et:
