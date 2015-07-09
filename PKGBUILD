# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

_p=audacious
_pkg=${_p}-plugins
pkgname=${_p}2-plugins
pkgver=3.2.4
pkgrel=2
pkgdesc='Plugins for Audacious. Gtk2 Version.'
arch=('i686' 'x86_64')
url='http://audacious-media-player.org/'
license=('GPL')
depends=("${_p}2>=$pkgver")

makedepends=('alsa-lib' 'libpulse' 'jack2' 'lame' 'libvorbis' 'flac' 'libmodplug'
             'mpg123' 'faad2' 'ffmpeg' 'fluidsynth' 'libcdio' 'libsidplay' 'wavpack'
             'libnotify' 'lirc-utils' 'curl' 'libmtp'
             'neon' 'libmms' 'libcue')

optdepends=('alsa-lib: Advanced Linux Sound Arch. output'
            'pulseaudio: PulseAudio output'
            'jack2: Jack Audio Connection Kit output'
            'lame: FileWriter MP3 output'
            'libvorbis: Vorbis input, FileWriter Vorbis output'
            'flac: FLAC input, FileWriter FLAC output'

            'mpg123: MP3 input'
            'faad2: AAC input'
            'ffmpeg: ffaudio input'
            'fluidsynth: MIDI FluidSynth backend input'
            'libcdio: CD Digital Audio input'
            'libsidplay: Commodore 64 audio input'
            'wavpack: WavPack input'
            'libmodplug: MOD input'

            'libnotify: libnotify OSD'
            'lirc-utils: LIRC'
            'curl: AudioScrobbler Client'
            'libmtp: Upload to MTP device'

            'smbclient: samba transport'
            'neon: neon-based http transport'
            'libmms: libmms-based mms transport'
            'libcue: CUE playlist format')

source=("http://distfiles.audacious-media-player.org/$_pkg-$pkgver.tar.gz"
	libcdio.patch)
md5sums=('47c2e19b1873501243c1158991f0b390'
         '264fcf92fe37d3b16a1ed1cd95121582')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  patch -Np1 -i "$srcdir/libcdio.patch"
  # Patch to let this coexist with audacious-plugins
  sed -i "s|\"Audacious2\"|\"Audacious-2\"|" `grep -rl Audacious2 .`
  for _i in acious core gui tag tool; do
    msg "Processing aud$_i .."
    sed -i "s|\([aA]\)\(ud${_i}2\{0,1\}\)|\1ud${_i}2|g" `grep -rl "[aA]ud$_i" .`
    for _d in `find . -depth -type d -name "*[aA]ud$_i*"`; do
      _n="$(echo $_d | sed "s|\([aA]\)\(ud${_i}2\{0,1\}\)|\1ud${_i}2|g")"
      msg "Moving $_d -> $_n" && mv "$_d" "$_n"
    done
    for _f in `find . -depth -type f -name "*[aA]ud$_i*"`; do
      _n="$(echo $_f | sed "s|\([aA]\)\(ud${_i}2\{0,1\}\)|\1ud${_i}2|g")"
      msg "Renaming $_f -> $_n" && mv "$_f" "$_n"
    done
  done

  ./configure --prefix=/usr \
              --enable-amidiplug \
              --disable-adplug \
              --disable-gtk3
  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir/" install
}
