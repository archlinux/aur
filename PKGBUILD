# $Id$
# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christopher O'Neill <milkytracker@chrisoneill.co.uk>
# Contributor: Maks Verver <maksverver@geocities.com>

_pkgbase=milkytracker
pkgname=milkytracker-git
pkgver=v0.90.86.r103.g5801528
pkgrel=1
pkgdesc='Fast Tracker II inspired music tracker'
arch=('x86_64' 'i686')
url="http://www.milkytracker.org/"
license=('GPL3')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
depends=('sdl2' 'alsa-lib' 'zlib' 'gcc-libs')
makedepends=('jack-audio-connection-kit' 'gendesk')
optdepends=('jack-audio-connection-kit: JACK audio support')
options=('docs' '!strip')
install="${_pkgbase}.install"
source=("${_pkgbase}::git+https://github.com/Deltafire/MilkyTracker.git"
        "rtaudio::git+https://github.com/thestk/rtaudio.git"
        "rtmidi::git+https://github.com/thestk/rtmidi.git"
        "${_pkgbase}.install")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'de270bb640a7ca57b4c70d270c55fc45228d823232b2fd9d00682465c635d1fb')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  gendesk -f -n --pkgname "$_pkgbase" --pkgdesc "$pkgdesc" --name 'MilkyTracker' \
    --categories 'AudioVideo;Audio;AudioVideoEditing;'

  cd "$srcdir/${_pkgbase}"
  git submodule init
  git config "submodule.src/milkyplay/drivers/generic/rtaudio.url" "$srcdir/rtaudio"
  git config "submodule.src/midi/rtmidi.url" "$srcdir/rtmidi"
  git submodule update
}

build() {
  cd "$srcdir/${_pkgbase}"

  autoreconf -fiv
  ./configure --prefix=/usr --with-alsa --with-jack
  make CXXFLAGS="$CXXFLAGS -lasound"
}

package() {
  cd "$srcdir/${_pkgbase}"

  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/doc/milkytracker"
  install -Dm644 resources/pictures/carton.png \
    "$pkgdir/usr/share/pixmaps/milkytracker.png"
  install -m644 "$srcdir/milkytracker.desktop" \
    "$pkgdir/usr/share/applications"
  install -m644 docs/ChangeLog.html "$pkgdir/usr/share/doc/milkytracker"
  install -m644 docs/MilkyTracker.html "$pkgdir/usr/share/doc/milkytracker"
  install -m644 docs/readme_unix "$pkgdir/usr/share/doc/milkytracker"
  install -m644 docs/FAQ.html "$pkgdir/usr/share/doc/milkytracker"
}

# vim:set ts=2 sw=2 et:
