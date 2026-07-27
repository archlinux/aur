# Maintainer: Matjaz Domen Pecan <matjaz.pecan@gmail.com>
pkgname=rusted-claude-meter
pkgver=0.1.6
pkgrel=1
pkgdesc="Cross-platform tray app showing your Claude plan usage"
arch=('x86_64')
url="https://github.com/mpecan/rusted-claude-meter"
license=('MIT')
# ring (a transitive TLS dep) compiles C/asm objects outside rustc's LTO
# awareness, and makepkg.conf's default LTO then breaks symbol resolution
# against them at link time. Must stay off.
options=('!lto')
# Mirrors bundle.linux.deb.depends in src-tauri/tauri.conf.json. xdotool
# provides libxdo.so, so it belongs here rather than in makedepends. libjxl is
# deliberately absent — it reaches us only through webkit2gtk-4.1, which
# carries its own soname dependency on it.
depends=(
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'librsvg'
  'gtk3'
  'openssl'
  'xdotool'
)
makedepends=(
  'rust>=1.96.0'
  'nodejs>=24'
  'npm'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mpecan/rusted-claude-meter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('456b9a8f9cde647760428619887ffd726a61ecb165afed2f37f1f53fb7e58e3d')

build() {
  cd "$pkgname-$pkgver"
  npm ci
  npm run build
  npm run tauri build -- --bundles deb
}

package() {
  cd "$pkgname-$pkgver"

  # Unpack the built .deb rather than Tauri's staging directory beside it: that
  # layout is an undocumented internal, and a glob over it fails silently.
  local debs=(target/release/bundle/deb/*.deb)
  if (( ${#debs[@]} != 1 )) || [[ ! -f "${debs[0]}" ]]; then
    echo "expected exactly one .deb under target/release/bundle/deb, found ${#debs[@]}" >&2
    return 1
  fi

  # 'data.tar*' because which compression the bundler picks is not a contract.
  # bsdtar is always present: pacman itself depends on libarchive.
  bsdtar -xOf "${debs[0]}" 'data.tar*' | bsdtar -xf - -C "$pkgdir" ./usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
