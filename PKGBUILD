# $Id$
# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christopher O'Neill <milkytracker@chrisoneill.co.uk>
# Contributor: Maks Verver <maksverver@geocities.com>

_pkgbase=milkytracker
pkgname=milkytracker-git
pkgver=v1.02.00.r25.gfd607a3
pkgrel=1
pkgdesc='Fast Tracker II inspired music tracker'
arch=('x86_64' 'i686')
url="http://www.milkytracker.org/"
license=('GPL3')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
depends=('sdl2' 'alsa-lib' 'zlib' 'gcc-libs' 'lhasa' 'zziplib' 'rtaudio' 'rtmidi')
makedepends=('jack' 'gendesk' 'cmake')
optdepends=('jack: JACK audio support')
options=('docs' '!strip')
install="${_pkgbase}.install"
source=("${_pkgbase}::git+https://github.com/Deltafire/MilkyTracker.git"
        "${_pkgbase}.install")
sha256sums=('SKIP'
            'de270bb640a7ca57b4c70d270c55fc45228d823232b2fd9d00682465c635d1fb')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  gendesk -f -n --pkgname "$_pkgbase" --pkgdesc "$pkgdesc" --name 'MilkyTracker' \
    --categories 'AudioVideo;Audio;AudioVideoEditing;'

  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"

  cmake \
    -DCMAKE_INSTALL_PREFIX:FILEPATH="/usr" \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS:STRING="${LDFLAGS}" \
    "../${_pkgbase}"

  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/doc/milkytracker"

  cd "$srcdir/${_pkgbase}"
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
