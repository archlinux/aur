# Maintainer: robertfoster

pkgname=liquidsoap
pkgver=2.0.0
pkgrel=1
_commit=bd9a2e3531ec03bae4f2812b6d83bdacf2277f0c
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
  'ocaml-dtools'
  'ocaml-duppy'
  'ocaml-faad'
  'ocaml-fdkaac'
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
options=('!makeflags')
source=("https://github.com/savonet/${pkgname}/archive/${_commit}.tar.gz"
  ${pkgname}.service
  ${pkgname}.tmpfilesd
)

install=${pkgname}.install
conflicts=('liquidsoap-git' 'liquidsoap-full')

prepare() {
  cd "${srcdir}/${pkgname}-${_commit}"
  find . -name "*.in" -type f -exec sed -i "s/@version@/${pkgver}/ig" {} +
  find . -type f -exec sed -i "s/liq_libs_dir_version=\".*\"/liq_libs_dir_version=\"${pkgver}\"/" {} +
}

build() {
  cd "${srcdir}/${pkgname}-${_commit}"
  ./bootstrap
  ./configure --prefix="${pkgdir}/usr" \
    --with-bash-completion-dir="${pkgdir}/usr/share/bash-completion/completions" \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --without-user --without-group \
    --disable-oss
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"

  make DESTDIR="${pkgdir}" datadir="${pkgdir}/usr/share/" mandir="${pkgdir}/usr/share/man/" localstatedir="${pkgdir}/var" bindir="${pkgdir}/usr/bin/" libdir="${pkgdir}/usr/lib/" sysconfdir="${pkgdir}/etc/" install

  # Install systemd unit
  install -Dm644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/liquidsoap@.service"
  # Install the tmpfilesd file
  install -Dm644 "${srcdir}/${pkgname}.tmpfilesd" \
    "${pkgdir}/usr/lib/tmpfiles.d/liquidsoap.conf"
}

sha256sums=('45bb9c3e4113173e2df007a03dd1f4320706f134c500a152bafdbba9e66ac4fb'
            'df6d2cec1be47a57a02ed04a1f527c0349221fad39d8d152aca13734d3808661'
            '9f286958af0c751c2a43d74614cdd1c4629c0583d619875385c09417a5383675')
