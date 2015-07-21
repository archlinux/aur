# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=ring-daemon-git
pkgver=20150718
pkgrel=1
pkgdesc="SIP/IAX2 compatible softphone for Linux, based on a DHT (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="http://ring.cx"
license=('GPL3')
groups=("ring")
depends=('opendht-git' 'yaml-cpp' 'alsa-lib' 'libpulse' 'jack'
         'libsamplerate' 'libsndfile' 'dbus-c++' 'ffmpeg' 'udev' 'gnutls'
         'expat' 'gsm' 'speex' 'speexdsp' 'opus' 'libupnp' 'libsrtp')
makedepends=('git' 'boost')
provides=('ring-daemon')
conflicts=('ring-daemon')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-daemon#commit=b264aa7b6617ac56c2c49463da20b4494b104841")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "${pkgname%-git}"

  msg2 'Building pjproject...'
  # Build the customised version of pjproject (heavily patched...)
  mkdir -p contrib/native
  cd contrib/native
  ../bootstrap
  make .pjproject

  cd ../..
  msg2 'Building...'
  # Build dring
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/bin \
    --sysconfdir=/etc \
    --enable-ipv6
  make
}

package() {
  cd "${pkgname%-git}"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
