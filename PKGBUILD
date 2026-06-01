# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: hm_b <holger@music-nerds.net>
# Contributor: Leslie P. Polzer <polzer@stardawn.org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=jack_capture
_pkgver=0.9.73
pkgver=${_pkgver}post1
pkgrel=1
pkgdesc='Simple command line tool to record JACK audio output to a file'
arch=(x86_64)
url='https://github.com/kmatheussen/jack_capture'
license=(GPL-2.0-or-later)
groups=(pro-audio)
depends=(glibc jack)
makedepends=(git lame liblo libsndfile)
optdepends=(
  'meterbridge: levels monitor'
  'bash: GUI wrapper'
  'zenity: GUI wrapper'
)
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz"
        'jack_capture-post-release-fixes.patch::https://github.com/kmatheussen/jack_capture/compare/0.9.73...a539d444d388c4cfed7279e385830e7767d59c41.patch'
        'jack_capture-file-rotation.patch::https://github.com/kmatheussen/jack_capture/pull/57.patch')
sha256sums=('21afb0257ed7437708cc9e5bec2f6299599461b7eec8bf66967d8ecadb0751de'
            '23989ea8507a2a0097eb7c4a68c54b2709c4221839955469d218b6e0925818ab'
            '78226e3bda39fbea478dfa2895f87612f33a9d5d1a57f5b0fd81fb478bbb56e5')

prepare() {
  cd $pkgname-$_pkgver
  # Post 0.9.73 release commits up until 2026-06-01
  git apply "$srcdir"/jack_capture-post-release-fixes.patch
  # https://github.com/kmatheussen/jack_capture/pull/57
  git apply "$srcdir"/jack_capture-file-rotation.patch
}

build() {
  cd $pkgname-$_pkgver
  make
}

package(){
  depends+=(libjack.so liblo.so libmp3lame.so libsndfile.so)
  cd $pkgname-$_pkgver
  make PREFIX='/usr' DESTDIR="$pkgdir" install
  # GUI wrapper
  install -vDm 755 "${pkgname}_gui" "$pkgdir"/usr/bin/${pkgname}_gui
  # Documentation
  install -vDm 644 README -t "$pkgdir"/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
