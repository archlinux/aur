# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_pkgname=openvpn3-linux
pkgname=openvpn3
pkgver=21
pkgrel=3
pkgdesc='OpenVPN 3 Linux client'
arch=('x86_64' 'aarch64')
url="https://github.com/OpenVPN/$_pkgname"
license=('AGPL3')
depends=(
  'jsoncpp>=0.10.5' 'libcap-ng>=0.7.5' 'lz4>=1.8.4' 'util-linux-libs>=2.23.2' 'protobuf>=2.4.0'
  'python-dbus' 'python-gobject' 'python-systemd' 'tinyxml2>=2.1.0' 'libnl>=3.2.29'
)
optdepends=(
  'openssl: OpenSSL version' 'mbedtls: mbed TLS version' 'polkit>=0.112: for systemd-resolved integration'
  'repkg: Automatically rebuild the package on dependency updates'
)
makedepends=(
  'autoconf-archive' 'git' 'python-docutils' 'python-jinja' 'bash' 'meson' 'pcre2' 'xz' 'libffi' 'zlib'
)
source=(
  "git+https://github.com/OpenVPN/$_pkgname.git#tag=v${pkgver}"
  'openvpn3.rule'
  'openvpn3.install'
  'sysusers-openvpn3.conf'
  'https://download.gnome.org/sources/glib/2.74/glib-2.74.6.tar.xz'
)
sha256sums=(
  'SKIP'
  'ec0b8e28ae77b4b074d3eb8a084626e6dcfc587a07bef5d53fe1c6e160c0fc01'
  'a5879d9e637658f5127e849d17f4050bae1f82fa9b25f05bbbbb531867120e8b'
  '045e914bb6fff5a082314dfc805bb511c9a80170619fa1e94a07825fa977c90a'
  '069cf7e51cd261eb163aaf06c8d1754c6835f31252180aff5814e5afc7757fbc'
)

build() {
  (
    cd 'glib-2.74.6' || exit
    meson setup _build --default-library static --strip --prefix "$(pwd)/_out"
    meson compile -C _build
    meson install -C _build
  )

  cd "$_pkgname"
  ./bootstrap.sh
  PKG_CONFIG_PATH="$(pwd)/../glib-2.74.6/_out/lib/pkgconfig/" \
  CFLAGS="$(pkg-config --cflags --libs glib-2.0) $CFLAGS" \
  CXXFLAGS="$(pkg-config --cflags --libs glib-2.0) $CXXFLAGS" \
  LDFLAGS="$(pkg-config --libs glib-2.0) $LDFLAGS" \
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
  install -Dm644 "../sysusers-$pkgname.conf"  "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
