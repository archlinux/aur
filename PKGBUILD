# Maintainer: jakob <grandchild@mailbox.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

_pkgname=mpd
pkgname=${_pkgname}-smbclient
pkgver=0.23.13
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music (with buggy smbclient plugin enabled, don't complain upstream!)"
arch=('x86_64' 'aarch64')
url="https://www.musicpd.org/"
license=(GPL2)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  libcdio
  libcdio-paranoia
  libgme
  libmad
  libmms
  libmodplug
  libmpcdec
  libnfs
  libshout
  libsidplayfp
  libsoxr
  smbclient  # Enabled despite https://bugzilla.samba.org/show_bug.cgi?id=11413 - the point of this package
  pcre2
  wavpack
  wildmidi
  zlib
  zziplib
)
makedepends=(
  alsa-lib
  audiofile
  avahi
  boost
  bzip2
  chromaprint
  curl
  dbus
  expat
  faad2
  ffmpeg
  flac
  fluidsynth
  fmt
  icu
  jack
  lame
  libao
  libid3tag
  libmikmod
  libmpdclient
  libogg
  libopenmpt
  libpulse
  libsamplerate
  libsndfile
  libupnp
  liburing
  libvorbis
  meson
  mpg123
  openal
  opus
  libpipewire
  python-sphinx
  sqlite
  systemd
  twolame
  yajl
)
provides=('mpd')
conflicts=('mpd')
backup=(etc/$pkgname.conf)
source=(
  https://www.musicpd.org/download/${_pkgname}/${pkgver%.*}/${_pkgname}-$pkgver.tar.xz{,.sig}
  ${_pkgname}.conf
  ${_pkgname}.sysusers
  ${_pkgname}.tmpfiles
  ${_pkgname}.service.override
)
sha512sums=('1ef2b3a2089aa6078a455e43a2fb9097dc0d5b27b170e6d64e416d5e82349a794eb0acf8db72a975ad024083e872e4a1bd0e0fd51302d327d373b61f01bb819d'
            'SKIP'
            '25a823740d92da8e186916701413114142eb6ad91a172c592e68b569c8e4f50fa99580e555ccf6cd31fc4f55a09bfe0278efa46e4e76ee0fe02846292fadf3c1'
            '6e467481406279767b709ec6d5c06dbd825c0de09045c52ffa2d21d0604dcfe19b7a92bf42bed25163d66a3a0d1dbde6185a648b433eaf5eac56be90491e2e18'
            'db473db27cd68994c3ee26e78e0fb34d13126301d8861563dcc12a22d62ecb14c4ffb1e0798c6aaccdff34e73bae3fbeeff7b42606c901a2d35e278865cdf35d'
            'c1782b82f9db1d30aece43a07230c5d57370f2494a16e108af03815d83968805472f10f53ea5495cf0e08ff8f245430c3c3bc44025af43aaf9ecd12fcd6afc6c')
b2sums=('02907f08cc504d0fbf703179b333b301c7ad8fc8535d85305faa7962dd7faa164f4492286902cb48eaf3db2a1445b541b1261c18a89ca8a73e80016af9581e26'
        'SKIP'
        '0969a3c477b6a3f34b44e067e515d7f306414dd14e0163584417b9d071e3cc825898219f7ff66ead7905b15429b8411304052d3b2b14a72e560bfabf9bf0adcf'
        '4ab6e415284c77802a39d0913d701fe55e56f3c22b19557661fbef77e456b5e1d151da4202695282b956602e716a7afdb994aa2fc17368b9a0d0d051d47a3afb'
        'd7b587c25dd5830c27af475a8fdd8102139d7c8fdd6f04fe23b36be030e4411582e289f575c299255ff8183096f7d47247327276f9a24641cbd032d9675b837a'
        '753664445d7d5cc0b36f51ac66549beea403b9731cbcb81b0a782974a0a73d90559ba93e6afcaa470b6f2f5a844c09ef695bdf3b1e6dfee97aa080f41b7fe513')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@blarg.de>

build() {
  local _meson_options=(
    -D smbclient=enabled
    -D documentation=enabled
    -D adplug=disabled
    -D sndio=disabled
    -D shine=disabled
    -D tremor=disabled
    -D b_ndebug=true
  )

  # NOTE: sndio conflicts with alsa
  # TODO: package adplug
  # TODO: package shine
  arch-meson "${_meson_options[@]}" build ${_pkgname}-$pkgver
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  depends+=(
    alsa-lib libasound.so
    audiofile libaudiofile.so
    avahi libavahi-{client,common}.so
    bzip2 libbz2.so
    chromaprint libchromaprint.so
    curl libcurl.so
    dbus libdbus-1.so
    expat libexpat.so
    faad2 libfaad.so
    ffmpeg libav{codec,filter,format,util}.so
    flac libFLAC.so
    fluidsynth libfluidsynth.so
    fmt libfmt.so 
    icu libicui18n.so libicuuc.so
    jack libjack.so
    lame libmp3lame.so
    libao libao.so
    libid3tag libid3tag.so
    libmikmod libmikmod.so
    libmpdclient libmpdclient.so
    libogg libogg.so
    libopenmpt libopenmpt.so
    libpipewire libpipewire-0.3.so
    libpulse libpulse.so
    libsamplerate libsamplerate.so
    libsndfile libsndfile.so
    libupnp libixml.so libupnp.so
    liburing liburing.so
    libvorbis libvorbis{,enc}.so
    mpg123 libmpg123.so
    openal libopenal.so
    opus libopus.so
    sqlite libsqlite3.so
    systemd-libs libsystemd.so
    twolame libtwolame.so
    yajl libyajl.so
  )

  DESTDIR="$pkgdir" ninja -C build install
  install -vDm 644 ${_pkgname}-$pkgver/doc/${_pkgname}conf.example -t "$pkgdir/usr/share/doc/${_pkgname}/"
  install -vDm 644 ${_pkgname}.service.override "$pkgdir/usr/lib/systemd/system/mpd.service.d/00-arch.conf"
  install -vDm 644 ${_pkgname}.conf -t "$pkgdir/etc/"
  install -vDm 644 ${_pkgname}.sysusers "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm 644 ${_pkgname}.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
