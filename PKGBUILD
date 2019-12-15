# Maintainer: robertfoster

pkgname=liquidsoap
pkgver=1.4.0
pkgrel=2
pkgdesc="A swiss-army knife for multimedia streaming, notably used for netradios and webtvs"
arch=('i686' 'x86_64')
url="https://www.liquidsoap.info"
license=('GPL')
depends=('fluidsynth' 'giflib' 'gst-plugins-good' 'gst-plugins-ugly'
	'ocaml-alsa'
	'ocaml-ao'
	'ocaml-bjack'
	'ocaml-camomile'
	'ocaml-cry'
	'ocaml-dssi'
	'ocaml-dtools-git'
	'ocaml-duppy'
	'ocaml-faad'
	'ocaml-fdkaac-git'
	'ocaml-ffmpeg-git'
	'ocaml-flac'
	'ocaml-frei0r'
	'ocaml-gavl'
	'ocaml-gd4o'
	'ocaml-gstreamer'
	'ocaml-inotify'
	'ocaml-yojson-git'
	'ocaml-ladspa'
	'ocaml-lame-git'
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
	'ocaml-sedlex-git'
	'ocaml-shine'
	'ocaml-soundtouch'
	'ocaml-speex'
	'ocaml-taglib'
	'ocaml-theora'
	'ocaml-vorbis'
	'ocaml-xmlplaylist'
)
makedepends=('camlp4' 'libxml-perl' 'ocaml-findlib' 'ocaml-menhir' 'ocaml-pcre' 'ocaml-sedlex-git' 'perl-xml-dom')
optdepends=('curl')
options=('!makeflags')
source=("https://github.com/savonet/liquidsoap/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2"
	$pkgname.service
	$pkgname.tmpfilesd
)

install=$pkgname.install
conflicts=('liquidsoap-git' 'liquidsoap-full')

prepare() {
        cd $srcdir/$pkgname-$pkgver
	sed -i "s|bashcompdir=|bashcompdir=${pkgdir//\//\\/}|g" configure.ac
        sed -i "s|emacsdir=|emacsdir=${pkgdir//\//\\/}|g" configure.ac
	./bootstrap
	./configure --prefix=/usr  --localstatedir=/var --sysconfdir=/etc \
                --without-user --without-group \
                --disable-oss
}

build() {
	cd $srcdir/$pkgname-$pkgver
	make all
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir" datadir="$pkgdir/usr/share/" mandir="$pkgdir/usr/share/man/"  localstatedir="$pkgdir/var"  bindir="$pkgdir/usr/bin/"  libdir="$pkgdir/usr/lib/" sysconfdir="$pkgdir/etc/" install

	# Install systemd unit
	install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/liquidsoap@.service"
	# Install the tmpfilesd file
	install -Dm0644 $srcdir/$pkgname.tmpfilesd $pkgdir/usr/lib/tmpfiles.d/liquidsoap.conf
}

md5sums=('04b7e8fa1f49236df86bc48f386e8f40'
         '762d6607ff0889e34b8c874970b38bc9'
         'f9106e5c42cabc21c4c8464d9b1ad63e')
