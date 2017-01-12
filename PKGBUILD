# Maintainer: Leonard de Ruijter <dev@systeemdenker.nl>

pkgname=liquidsoap
pkgver=1.2.1
pkgrel=6
pkgdesc="A swiss-army knife for multimedia streaming, notably used for netradios and webtvs"
arch=('i686' 'x86_64')
url="http://savonet.sourceforge.net/"
license=('GPL')
depends=('faad2' 'ffmpeg' 'fluidsynth' 'gavl' 'gd' 'giflib' 'gst-plugins-bad'  'gst-plugins-base'  'gst-plugins-good'  'gst-plugins-ugly' 'libao' 'libfdk-aac' 'liblo' 'libmad' 'libxpm' 'ocaml-camomile' 'openssl' 'portaudio' 'sdl_image' 'sdl_ttf' 'soundtouch' 'taglib')
makedepends=('dssi' 'frei0r-plugins' 'ladspa' 'libxml-perl' 'ocaml-gd4o' 'ocaml-ocamlsdl' 'ocaml-pcre' 'ocaml-ssl' 'ocaml-xmlm' 'ocaml-yojson' 'perl-xml-dom')
source=(https://github.com/savonet/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-full.tar.gz
	PACKAGES
	$pkgname.service
	$pkgname.tmpfilesd
	ocaml-alsa.patch)
install=$pkgname.install
options=(!makeflags)
conflicts=('liquidsoap-git' 'liquidsoap-full')

prepare() {
  cd $srcdir/$pkgname-$pkgver-full
  cp $srcdir/PACKAGES PACKAGES
}

build() {
  cd $srcdir/$pkgname-$pkgver-full
  patch -Np1 -i ../ocaml-alsa.patch
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

md5sums=('a665fda35f2cf7395cf46970a8ff3ff6'
         '21d7e17ac7114edfd0a944c7773aa5af'
         '762d6607ff0889e34b8c874970b38bc9'
         'f9106e5c42cabc21c4c8464d9b1ad63e'
         '81769723888a75306c51323d86774c34')
