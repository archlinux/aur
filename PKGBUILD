# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=ring-daemon
pkgver=20171215.1.bc414d7
pkgrel=1
epoch=2
pkgdesc="ring.cx is free software for universal communication which respects freedoms and privacy of its users (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="https://ring.cx"
license=('GPL3')
groups=("ring")
depends=('opendht' 'yaml-cpp' 'alsa-lib' 'libpulse' 'jack' 'jsoncpp'
         'libsamplerate' 'libsndfile' 'dbus-c++' 'ffmpeg' 'udev' 'gnutls'
         'expat' 'gsm' 'libupnp' 'libnatpmp' 'libva' 'libvdpau' 'restbed'
         'libsecp256k1' 'pjproject-savoirfairelinux')
makedepends=('git' 'boost' 'msgpack-c' 'autoconf-archive')
#checkdepends=('cppunit')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-daemon#commit=d08826f038f6fe9a275ba66ff8d0af60a78a7f88")
md5sums=('SKIP')

build() {
  cd "${pkgname}"

  msg2 'Building...'
  autoreconf --force --install --verbose
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/bin \
    --sysconfdir=/etc \
    --with-contrib="no" \
    --enable-ipv6
  DISABLE_CONTRIB_DOWNLOADS="TRUE" make
}

# Disabled because some tests (TURN) use the network.
#check() {
#  cd "${pkgname}"
#  make -k check
#}

package() {
  cd "${pkgname}"

  msg2 'Installing...'
  DISABLE_CONTRIB_DOWNLOADS="TRUE" make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
