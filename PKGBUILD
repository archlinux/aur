# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=ring-daemon-git
pkgver=20161111
pkgrel=1
pkgdesc="ring.cx is a secure and distributed voice, video and chat communication platform that requires no centralized server and leaves the power of privacy in the hands of the user (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="http://ring.cx"
license=('GPL3')
groups=("ring")
depends=('opendht-git' 'yaml-cpp' 'alsa-lib' 'libpulse' 'jack' 'jsoncpp'
         'libsamplerate' 'libsndfile' 'dbus-c++' 'ffmpeg' 'udev' 'gnutls'
         'expat' 'gsm' 'libupnp' 'libnatpmp' 'crypto++' 'libva' 'boost-libs'
         'pjproject-savoirfairelinux' 'restbed-latest')
makedepends=('git' 'boost' 'msgpack-c')
optdepends=('restbed: for the REST interface to the daemon (untested)')
conflicts=('ring-daemon')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-daemon")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "${pkgname%-git}"

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

package() {
  cd "${pkgname%-git}"

  msg2 'Installing...'
  DISABLE_CONTRIB_DOWNLOADS="TRUE" make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
