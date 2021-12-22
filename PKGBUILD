# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_pkgname=openvpn3-linux
pkgname=openvpn3
pkgver=17_beta
pkgrel=1
pkgdesc='OpenVPN 3 Linux client'
arch=('any')
url="https://github.com/OpenVPN/$_pkgname"
license=('AGPL3')
depends=('glib2>=2.50' 'jsoncpp>=0.10.5' 'libcap-ng>=0.7.5' 'lz4>=1.7.3' 'util-linux-libs>=2.23.2' 'protobuf' 'python-dbus')
optdepends=(
  'python>=3.6' 'python-docutils' 'openssl: OpenSSL version' 'mbedtls: mbed TLS version'
  'python-gobject' 'polkit>=0.105: for systemd-resolved integration'
  'tinyxml2>=2.1.0: for AWS-VPC integration'
)
makedepends=(
  'pkgconf' 'autoconf' 'autoconf-archive' 'automake' 'make' 'gcc' 'git'
  'libnl' 'python-jinja' 'tinyxml2'
)
install="${pkgname}.install"
source=("git+https://github.com/OpenVPN/$_pkgname.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$_pkgname"
  ./bootstrap.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var --enable-bash-completion --enable-dco
  make -j $(nproc)
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
