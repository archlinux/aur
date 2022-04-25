# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_pkgname=openvpn3-linux
pkgname=openvpn3
pkgver=17_beta
pkgrel=2
pkgdesc='OpenVPN 3 Linux client'
arch=('any')
url="https://github.com/OpenVPN/$_pkgname"
license=('AGPL3')
depends=(
  'glib2>=2.50' 'jsoncpp>=0.10.5' 'libcap-ng>=0.7.5' 'lz4>=1.7.3' 'util-linux-libs>=2.23.2' 'protobuf'
  'python-dbus' 'python-gobject' 'python-systemd' 'tinyxml2>=2.1.0'
)
optdepends=(
  'openssl: OpenSSL version' 'mbedtls: mbed TLS version' 'polkit>=0.105: for systemd-resolved integration'
)
makedepends=(
  'autoconf-archive' 'git' 'libnl' 'python-docutils' 'python-jinja' 'bash'
)
install="${pkgname}.install"
source=(
  "git+https://github.com/OpenVPN/$_pkgname.git#tag=v${pkgver}"
  'archlinux-glib.patch'
)
sha256sums=(
  'SKIP'
  '004c35951889d00caa09eac4a0d151fc8ecb95042a5a6a95023332b6a92d71ad'
)

prepare() {
  cd "$_pkgname"
  patch -Np1 -i ../archlinux-glib.patch
}

build() {
  cd "$_pkgname"
  ./bootstrap.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var --enable-bash-completion --enable-dco
  make
}

check() {
  cd "$_pkgname"

  make check
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_pkgname/src/shell/bash-completion/openvpn3" "$pkgdir/usr/share/bash-completion/completions/openvpn3"
}
