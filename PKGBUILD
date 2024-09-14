# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nymvpn-x
pkgver=0.1.10
# upstream version
_pkgver=0.1.10
_release_tag=nym-vpn-x-v0.1.10
pkgrel=1
pkgdesc='NymVPN next desktop client'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('gcc-libs' 'bash' 'cairo' 'gtk3' 'webkit2gtk-4.1' 'gdk-pixbuf2' 'glib2' 'openssl' 'libsoup3')
makedepends=('rust' 'cargo' 'protobuf' 'npm')
optdepends=('nym-vpnd: NymVPN daemon as a systemd service')
provides=('nymvpn-x')
conflicts=('nymvpn-x')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_release_tag.tar.gz"
    'nymvpn-x-wrapper.sh'
    'nymvpn-x.desktop'
    'nymvpn-x.svg')
sha256sums=(
    'aa11acd8ababeee1150b5c3f4df3cc2390fd021105c22f6cbe0535b2c27c7063' 
    'aa573dad7ada4d6d6aacfc58d50184ee6b67e9e919187c9a6ed0fd4ea9652106' 
    '8bf0dbd2a6c312630e1c2e866431d0361b24975ba17b4ab14c891efea326251c' 
    'c15b6028f25ea931c9bedf2b5600f91d6f94f15066afdbd7f789c770ea250e06')
_srcdir="nym-vpn-client-$_release_tag"

prepare() {
  pushd "$_srcdir"

  # rip off all useless sources
  rm -rf nym-vpn-android
  rm -rf nym-vpn-apple
  popd
}

build() {
  pushd "$_srcdir/nym-vpn-x"

  # install Js dependencies
  npm i

  # build app
  pushd src-tauri

  export RUSTUP_TOOLCHAIN=stable
  # LTO build flag is enabled by default in Arch's makepkg config
  # but `zstd` fails to build with LTO (dependency of `build-info` crate)
  # set the C flag -ffat-lto-objects to solve the issue
  # see https://github.com/mozilla/sccache/issues/862
  # https://github.com/launchbadge/sqlx/issues/3149
  export CFLAGS+=' -ffat-lto-objects'

  npm run tauri build -- --no-bundle
}

package() {
  pushd "$_srcdir/nym-vpn-x"
  install -Dm755 "src-tauri/target/release/nymvpn-x" "$pkgdir/usr/bin/nymvpn-x"
  popd

  install -Dm755 "nymvpn-x-wrapper.sh" "$pkgdir/usr/bin/nymvpn-x-wrapper.sh"
  install -Dm644 "nymvpn-x.desktop"    "$pkgdir/usr/share/applications/nymvpn-x.desktop"
  install -Dm644 "nymvpn-x.svg"        "$pkgdir/usr/share/icons/nymvpn-x.svg"
}

