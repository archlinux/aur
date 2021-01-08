# Maintainer: Senya <senya at riseup.net>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Bruno Pagani <archange@archlinux.org>

_pkgname=ring-daemon
pkgname=jami-daemon-git
pkgver=4.0.0.r1820.g9835b0487
pkgrel=2
pkgdesc="Free and universal communication platform which preserves the users’ privacy and freedoms (daemon component)"
arch=(x86_64)
url="https://jami.net"
license=(GPL3)
groups=(jami)
depends=(yaml-cpp alsa-lib libpulse jack jsoncpp dbus-c++ ffmpeg gnutls
         expat libnatpmp libva libvdpau libsecp256k1 util-linux
         opus libjsoncpp.so)
makedepends=(git boost msgpack-c autoconf-archive)
#checkdepends=(cppunit)
provides=(${_pkgname})
conflicts=(${_pkgname} jami-daemon)
replaces=(${_pkgname})
source=("git+https://git.jami.net/savoirfairelinux/ring-daemon.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  mkdir -p contrib/native
  autoreconf -fvi
}

build() {
  cd ${_pkgname}/contrib/native
  ../bootstrap \
      --disable-all \
      --enable-pjproject \
      --enable-opendht \
      --enable-upnp
  make .upnp
  make

  cd ../..
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --enable-ipv6
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

# Disabled because some tests (TURN) use the network.
#check() {
#  cd ${_pkgname}
#  make -k check
#}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
