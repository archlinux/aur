# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=ring-daemon
pkgver=2.1.0.r640.g12996f1
pkgrel=1
epoch=1
pkgdesc="ring.cx is a secure and distributed voice, video and chat communication platform that requires no centralized server and leaves the power of privacy in the hands of the user (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="http://ring.cx"
license=('GPL3')
groups=("ring")
depends=('opendht' 'yaml-cpp' 'alsa-lib' 'libpulse' 'jack' 'jsoncpp'
         'libsamplerate' 'libsndfile' 'dbus-c++' 'ffmpeg' 'udev' 'gnutls'
         'expat' 'gsm' 'libupnp' 'libnatpmp'
         'pjproject-savoirfairelinux')
makedepends=('git' 'boost' 'msgpack-c')
optdepends=('restbed: for the REST interface to the daemon (untested)')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-daemon#commit=12996f11f7cd76a771338a7c2d3287f4a72505a7")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  msg2 'Building...'
  autoreconf --force --install --verbose
  # To compile with restbed, add `--with-restbed` here.
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/bin \
    --sysconfdir=/etc \
    --with-contrib="no" \
    --enable-ipv6
  DISABLE_CONTRIB_DOWNLOADS="TRUE" make
}

package() {
  cd "${pkgname}"

  msg2 'Installing...'
  DISABLE_CONTRIB_DOWNLOADS="TRUE" make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
