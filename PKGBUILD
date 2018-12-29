# Maintainer: robertfoster

pkgname=liquidsoap
pkgver=1.3.5
pkgrel=1
pkgdesc="A swiss-army knife for multimedia streaming, notably used for netradios and webtvs"
arch=('i686' 'x86_64')
url="http://savonet.sourceforge.net/"
license=('GPL')
depends=('fluidsynth' 'giflib' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-ugly'
	'ocaml-alsa'
	'ocaml-ao'
	'ocaml-bjack'
	'ocaml-camomile'
	'ocaml-cry'
	'ocaml-dssi'
	'ocaml-dtools'
	'ocaml-duppy'
	'ocaml-faad'
	'ocaml-fdkaac'
	'ocaml-ffmpeg'
	'ocaml-flac'
	#'ocaml-frei0r'
	'ocaml-gavl'
	'ocaml-gd4o'
	'ocaml-gstreamer'
	'ocaml-inotify'
	'ocaml-yojson'
	'ocaml-lame'
	'ocaml-lastfm'
	'ocaml-lo'
	'ocaml-mad'
	'ocaml-magic'
	'ocaml-mm'
	'ocaml-ocamlsdl'
	'ocaml-ogg'
	'ocaml-opus'
	'ocaml-pulseaudio'
	'ocaml-samplerate'
	'ocaml-shine'
	'ocaml-soundtouch'
	'ocaml-speex'
	'ocaml-taglib'
	'ocaml-theora'
	'ocaml-vorbis'
	'ocaml-xmlplaylist'
)

makedepends=('camlp4' 'libxml-perl' 'ocaml-findlib' 'ocaml-pcre' 'perl-xml-dom')
optdepends=('curl')
source=("https://github.com/savonet/liquidsoap/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2"
	$pkgname.service
	$pkgname.tmpfilesd
)

install=$pkgname.install
options=(!makeflags)
conflicts=('liquidsoap-git' 'liquidsoap-full')

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr  --localstatedir=/var --sysconfdir=/etc \
		--without-user --without-group \
		--disable-oss --without-frei0r-dir

	make all && make doc
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir/" datadir="$pkgdir/usr/share/" mandir="$pkgdir/usr/share/man/"  localstatedir="$pkgdir/var"  bindir="$pkgdir/usr/bin/"  libdir="$pkgdir/usr/lib/" sysconfdir="$pkgdir/etc/" install

	# Install systemd unit
	install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/liquidsoap@.service"
	# Install the tmpfilesd file
	install -Dm0644 $srcdir/$pkgname.tmpfilesd $pkgdir/usr/lib/tmpfiles.d/liquidsoap.conf
}

md5sums=('5f5afd75be384c9f128b81e059d3bc1a'
	'762d6607ff0889e34b8c874970b38bc9'
'f9106e5c42cabc21c4c8464d9b1ad63e')
