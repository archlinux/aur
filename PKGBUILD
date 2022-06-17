# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_pkgname=openvpn3-linux
pkgname=openvpn3
pkgver=18_beta
pkgrel=2
pkgdesc='OpenVPN 3 Linux client'
arch=('any')
url="https://github.com/OpenVPN/$_pkgname"
license=('AGPL3')
depends=(
  'glib2>=2.50' 'jsoncpp>=0.10.5' 'libcap-ng>=0.7.5' 'lz4>=1.7.3' 'util-linux-libs>=2.23.2' 'protobuf>=2.4.0'
  'python-dbus' 'python-gobject' 'python-systemd' 'tinyxml2>=2.1.0' 'libnl>=3.2.29'
)
optdepends=(
  'openssl: OpenSSL version' 'mbedtls: mbed TLS version' 'polkit>=0.105: for systemd-resolved integration'
  'repkg: Automatically rebuild the package on dependency updates'
)
makedepends=(
  'autoconf-archive' 'git' 'python-docutils' 'python-jinja' 'bash'
)
source=(
  "git+https://github.com/OpenVPN/$_pkgname.git#tag=v${pkgver}"
  'openvpn3.rule'
  'openvpn3.conf'
)
sha256sums=(
  'SKIP'
  'ec0b8e28ae77b4b074d3eb8a084626e6dcfc587a07bef5d53fe1c6e160c0fc01'
  'a2361bb4060aa351c33bda56f40c470420da64b922d7795ab6ddb19fab16b9c5'
)

build() {
  cd "$_pkgname"
  ./bootstrap.sh
  ./configure \
    --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var \
    --enable-bash-completion --enable-dco
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
  install -Dm644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
  install -Dm644 "../$pkgname.conf"  "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
