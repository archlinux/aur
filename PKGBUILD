# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
pkgname=liquidsoap-git
pkgver=Full_GIT
pkgrel=12
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
md5sums=('SKIP'
         '21d7e17ac7114edfd0a944c7773aa5af'
         '762d6607ff0889e34b8c874970b38bc9'
         'f9106e5c42cabc21c4c8464d9b1ad63e')
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
