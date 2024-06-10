# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_pkgname=openvpn3-linux
_commit=4f37952340
pkgname=openvpn3
pkgver=22_rc_4f37952340
pkgrel=1
pkgdesc='OpenVPN 3 Linux client'
arch=('x86_64' 'aarch64')
url="https://codeberg.org/OpenVPN/$_pkgname"
license=('AGPL3')
depends=(
  'jsoncpp>=0.10.5' 'libcap-ng>=0.7.5' 'lz4>=1.8.4' 'util-linux-libs>=2.23.2' 'protobuf>=2.4.0'
  'python-dbus' 'python-gobject' 'python-systemd' 'tinyxml2>=2.1.0' 'libnl>=3.2.29' gdbuspp-git
)
optdepends=(
  'openssl: OpenSSL version' 'mbedtls: mbed TLS version' 'polkit>=0.112: for systemd-resolved integration'
  'repkg: Automatically rebuild the package on dependency updates'
)
makedepends=(
  'autoconf-archive' 'git' 'python-docutils' 'python-jinja' 'bash' 'meson' 'pcre2' 'xz' 'libffi' 'zlib'
)
source=(
  "git+https://codeberg.org/OpenVPN/$_pkgname.git#commit=${_commit}"
  "git+https://github.com/OpenVPN/openvpn3.git"
  "git+https://github.com/chriskohlhoff/asio.git"
  'openvpn3.rule'
  'openvpn3.install'
  'sysusers-openvpn3.conf'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'ec0b8e28ae77b4b074d3eb8a084626e6dcfc587a07bef5d53fe1c6e160c0fc01'
  'a5879d9e637658f5127e849d17f4050bae1f82fa9b25f05bbbbb531867120e8b'
  '045e914bb6fff5a082314dfc805bb511c9a80170619fa1e94a07825fa977c90a'
)

prepare() {
  meson subprojects download --sourcedir="${_pkgname}"
  cd "${_pkgname}"
  git submodule init
  git config submodule.openvpn3-core.url "$srcdir/openvpn3"
  git config submodule.vendor/asio.url "$srcdir/asio"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson \
    --auto-features auto \
      "${_pkgname}" \
      _builddir \
    -Dbash-completion=enabled \
    -Dtest_programs=disabled \
    -Dunit_tests=disabled
  meson compile -C _builddir
}

check() {
  arch-meson \
    --auto-features auto \
    --wrap-mode default \
      "${_pkgname}" \
      _builddir \
    -Dtest_programs=enabled \
    -Dunit_tests=enabled
  meson compile -C _builddir
  meson test -C _builddir
}

package() {
  meson install -C _builddir --destdir "$pkgdir"
  install -Dm644 "${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
  install -Dm644 "sysusers-$pkgname.conf"  "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
