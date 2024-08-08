# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_pkgname=openvpn3-linux
pkgname=openvpn3-git
pkgver=22_dev.r5.ga3de5e2
pkgrel=2
pkgdesc='OpenVPN 3 Linux client'
arch=('x86_64' 'aarch64')
provides=("openvpn3=${pkgver}")
conflicts=('openvpn3')
url="https://codeberg.org/OpenVPN/$_pkgname"
license=('AGPL3')
depends=(
  'jsoncpp>=0.10.5' 'libcap-ng>=0.7.5' 'lz4>=1.8.4' 'util-linux-libs>=2.23.2' 'protobuf>=2.4.0'
  'python-dbus' 'python-gobject' 'python-systemd' 'tinyxml2>=2.1.0' 'libnl>=3.2.29' 'gdbuspp'
)
optdepends=(
  'openssl: OpenSSL version' 'mbedtls: mbed TLS version' 'polkit>=0.105: for systemd-resolved integration'
  'repkg: Automatically rebuild the package on dependency updates'
)
makedepends=(
  'git' 'python-docutils' 'python-jinja' 'meson'
)
source=(
  "git+https://codeberg.org/OpenVPN/$_pkgname.git"
  "git+https://github.com/OpenVPN/openvpn3.git"
  "git+https://github.com/chriskohlhoff/asio.git"
  'openvpn3.rule'
  'sysusers-openvpn3.conf'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'ec0b8e28ae77b4b074d3eb8a084626e6dcfc587a07bef5d53fe1c6e160c0fc01'
  '045e914bb6fff5a082314dfc805bb511c9a80170619fa1e94a07825fa977c90a'
)
install=openvpn3-git.install

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  meson subprojects download --sourcedir="${_pkgname}"
  cd "${_pkgname}"
  git submodule init
  git config submodule.openvpn3-core.url "$srcdir/openvpn3"
  git config submodule.vendor/asio.url "$srcdir/asio"
  git -c protocol.file.allow=always submodule update
}

build() {
  env CXXFLAGS="$CXXFLAGS -Wno-error=non-virtual-dtor" \
    arch-meson \
    --auto-features auto \
      "${_pkgname}" \
      _builddir \
    -Dtest_programs=disabled \
    -Dunit_tests=disabled
  meson compile -C _builddir
}

check() {
  env CXXFLAGS="$CXXFLAGS -Wno-error=non-virtual-dtor" \
    arch-meson \
    --auto-features auto \
      "${_pkgname}" \
      _builddir \
    -Dtest_programs=enabled \
    -Dunit_tests=enabled
  meson compile -C _builddir
  meson test -C _builddir
}

package() {
  meson install -C _builddir --destdir "$pkgdir"
  install -Dm644 "openvpn3.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
  install -Dm644 "sysusers-openvpn3.conf"  "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
