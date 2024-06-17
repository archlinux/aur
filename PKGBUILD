# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_pkgname=openvpn3-linux
pkgname=openvpn3
pkgver=22_dev
pkgrel=3
pkgdesc='OpenVPN 3 Linux client'
arch=('x86_64' 'aarch64')
url="https://codeberg.org/OpenVPN/$_pkgname"
license=('AGPL3')
depends=(
  'glib2>=2.56' 'jsoncpp>=0.10.5' 'libcap-ng>=0.7.5' 'lz4>=1.8.4' 'util-linux-libs>=2.23.2' 'protobuf>=2.4.0'
  'python-dbus' 'python-gobject' 'python-systemd' 'tinyxml2>=2.1.0' 'libnl>=3.2.29' gdbuspp
)
optdepends=(
  'openssl: OpenSSL version' 'mbedtls: mbed TLS version' 'polkit>=0.112: for systemd-resolved integration'
  'repkg: Automatically rebuild the package on dependency updates'
)
makedepends=(
  'python-docutils' 'python-jinja' 'meson'
)
source=(
  "https://swupdate.openvpn.net/community/releases/${_pkgname}-${pkgver}.tar.xz"
  'openvpn3.rule'
  'sysusers-openvpn3.conf'
)
sha256sums=(
  'ad8f373814bfbefd12f9824d57badef4535f6c1fde68d2c73d7ee14863547cb6'
  'ec0b8e28ae77b4b074d3eb8a084626e6dcfc587a07bef5d53fe1c6e160c0fc01'
  '045e914bb6fff5a082314dfc805bb511c9a80170619fa1e94a07825fa977c90a'
)
install=openvpn3.install

prepare() {
  meson subprojects download --sourcedir="${_pkgname}-${pkgver}"
}

build() {
  arch-meson \
    -Dselinux=disabled \
    -Dselinux_policy=disabled \
    -Dbash-completion=enabled \
    -Dtest_programs=disabled \
    -Dunit_tests=disabled \
    "${_pkgname}-${pkgver}" \
    _builddir
  meson compile -C _builddir
}

check() {
  arch-meson \
    -Dselinux=disabled \
    -Dselinux_policy=disabled \
    -Dtest_programs=enabled \
    -Dunit_tests=enabled \
    "${_pkgname}-${pkgver}" \
    _builddir
  meson compile -C _builddir
  meson test -C _builddir
}

package() {
  meson install -C _builddir --destdir "$pkgdir"
  install -Dm644 "${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
  install -Dm644 "sysusers-$pkgname.conf"  "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

post_install() {
  openvpn3-admin init-config --write-configs --force
  systemctl reload dbus
}
