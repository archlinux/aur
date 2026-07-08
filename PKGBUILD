# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: KokaKiwi <kokakiwi plus aur at kokakiwi dot net>
# Contributor: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: E5ten <e5ten.arch@gmail.com>
# Contributor: anna <morganamilo@gmail.com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-git
pkgver=0.24.12.r315.g1f7ffe1f7
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music"
url="https://www.musicpd.org/"
license=(BSD-2-Clause GPL-2.0-or-later)
arch=(x86_64)
depends=(bzip2 chromaprint expat fmt gcc-libs glibc
         hicolor-icon-theme lame libcdio libcdio-paranoia libgme
         libmad libmms libmodplug libmpcdec libnfs libpipewire
         libshout libsidplayfp libsoxr liburing openal opus pcre2
         sqlite wavpack wildmidi zlib zziplib

         libFLAC.so libao.so libasound.so libaudiofile.so
         libavahi-client.so libavahi-common.so libavcodec.so libavformat.so
         libavutil.so libcurl.so libdbus-1.so libfaad.so libfluidsynth.so
         libicui18n.so libicuuc.so libid3tag.so libjack.so libmikmod.so
         libmpdclient.so libmpg123.so libogg.so libpulse.so libsamplerate.so
         libsndfile.so libsystemd.so libtwolame.so libvorbis.so
         libvorbisenc.so libupnp.so)
makedepends=(alsa-lib audiofile avahi boost curl dbus faad2
             ffmpeg flac fluidsynth git icu jack libao libid3tag libmikmod
             libmpdclient libogg libpulse libsamplerate libsndfile libupnp
             libvorbis meson mpg123 python-sphinx python-sphinx_rtd_theme
             systemd-libs twolame nlohmann-json)
provides=(mpd)
conflicts=(mpd)
backup=("etc/mpd.conf")
source=("git+https://github.com/MusicPlayerDaemon/MPD.git"
        "mpd.conf"
        "mpd.sysusers"
        "mpd.tmpfiles")
sha256sums=('SKIP'
            'f40f68205834ca53cea3372e930bfe6c2f9ecc9df3b1605df2fec63a658b2e03'
            '0b74c6e5db08daab3091dc15a6b0c75210ba2f9e98fa074f6cfd605a461056b6'
            '2faa85c12449a5b3ca422ff1c1fa06d057c7e262a74bfa6298c914a92d6f2e7a')
b2sums=('SKIP'
        '0969a3c477b6a3f34b44e067e515d7f306414dd14e0163584417b9d071e3cc825898219f7ff66ead7905b15429b8411304052d3b2b14a72e560bfabf9bf0adcf'
        '4ab6e415284c77802a39d0913d701fe55e56f3c22b19557661fbef77e456b5e1d151da4202695282b956602e716a7afdb994aa2fc17368b9a0d0d051d47a3afb'
        'd7b587c25dd5830c27af475a8fdd8102139d7c8fdd6f04fe23b36be030e4411582e289f575c299255ff8183096f7d47247327276f9a24641cbd032d9675b837a')

pkgver() {
  cd "MPD"
  git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "MPD"
  sed -e '/\[Service\]/a User=mpd' \
      -i "systemd/system/mpd.service.in"
}

build() {
  cd "MPD"

  # NOTE: sndio conflicts with alsa
  # TODO: package adplug
  # TODO: package shine
  meson setup --prefix /usr \
        --libexecdir lib \
        --sbindir bin \
        --buildtype plain \
        --auto-features enabled \
        --wrap-mode nodownload \
        -D b_lto=true \
        -D b_pie=true \
        -D documentation=enabled \
        -D adplug=disabled \
        -D sndio=disabled \
        -D shine=disabled \
        -D tremor=disabled \
        -D openmpt=disabled \
        -D vgmstream=disabled \
        -D psgplay=disabled \
        build

  ninja -C build
}

# There aren't tests
#check() {
#  cd "MPD"
#  ninja -C build test
#}

package() {
  cd "MPD"

  DESTDIR="${pkgdir}" ninja -C build install

  install -vDm 644 "doc/mpdconf.example" \
    -t "${pkgdir}/usr/share/doc/mpd/"
  install -vDm 644 "doc/mpd.conf.5.rst" -t "${pkgdir}/usr/share/man/man5/"
  install -vDm 644 "doc/mpd.1.rst" -t "${pkgdir}/usr/share/man/man1/"

  install -vDm 644 "../mpd.conf" -t "${pkgdir}/etc/"
  install -vDm 644 "../mpd.sysusers" "${pkgdir}/usr/lib/sysusers.d/mpd.conf"
  install -vDm 644 "../mpd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mpd.conf"

  install -vDm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
