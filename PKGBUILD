# Maintainer: robertfoster

pkgname=liquidsoap
pkgver=1.4.0
pkgrel=1
pkgdesc="A swiss-army knife for multimedia streaming, notably used for netradios and webtvs"
arch=('i686' 'x86_64')
url="https://www.liquidsoap.info"
license=('GPL')
depends=('fdk-aac-free' 'fluidsynth' 'giflib' 'gst-plugins-good' 'gst-plugins-ugly'
	'ocaml-alsa'
	'ocaml-ao'
	'ocaml-bjack'
	'ocaml-camomile'
	'ocaml-cry'
	'ocaml-dssi'
	'ocaml-dtools'
	'ocaml-duppy'
	'ocaml-faad'
	'ocaml-fdkaac-git'
	'ocaml-ffmpeg'
	'ocaml-flac'
	'ocaml-frei0r'
	'ocaml-gavl'
	'ocaml-gd4o'
	'ocaml-gstreamer'
	'ocaml-inotify'
	'ocaml-yojson'
	'ocaml-ladspa'
	'ocaml-lame'
	'ocaml-lastfm'
	'ocaml-lo'
	'ocaml-mad'
	'ocaml-magic'
	'ocaml-menhir'
	'ocaml-mm'
	'ocaml-ocamlsdl'
	'ocaml-ogg'
	'ocaml-opus'
	'ocaml-pulseaudio'
	'ocaml-samplerate'
	'ocaml-sedlex'
	'ocaml-shine'
	'ocaml-soundtouch'
	'ocaml-speex'
	'ocaml-taglib'
	'ocaml-theora'
	'ocaml-vorbis'
	'ocaml-xmlplaylist'
)
makedepends=('camlp4' 'libxml-perl' 'ocaml-findlib' 'ocaml-menhir' 'ocaml-pcre' 'ocaml-sedlex' 'perl-xml-dom')
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
		--disable-oss

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

md5sums=('04b7e8fa1f49236df86bc48f386e8f40'
	'762d6607ff0889e34b8c874970b38bc9'
'f9106e5c42cabc21c4c8464d9b1ad63e')
