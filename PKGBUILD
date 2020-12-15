# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=everfight-git
pkgver=r42.c283cb7
pkgrel=1
pkgdesc='Space shooter/Bullet hell made for Game Off 2020'
arch=('x86_64' 'aarch64')
url='https://snoozetime.itch.io/everfight-gameoff2020'
license=('CC-BY-3.0')
provides=('everfight')
conflicts=('everfight')
depends=('glfw' 'alsa-lib')
makedepends=('git' 'cargo')
source=('git+https://github.com/SnoozeTime/spacegame'
        'no-glfw-sys.patch')
sha256sums=('SKIP'
            '57ecb5e9ac35ff1e468c47e4179fd281606aaa57fbaeedbc43a5861c30aa7834')

pkgver() {
  cd spacegame
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd spacegame
  sed -i '/ASSET_PATH/s,\(PathBuf::from\).*,\1("/usr/share/everfight"),' src/paths.rs

  # This patch is required for Wayland support.
  patch -p1 < ../no-glfw-sys.patch
  cargo update
}

build() {
  cd spacegame
  cargo build --release --no-default-features
}

package() {
  cd spacegame

  cargo install --path . --bin spacegame --locked --root "$pkgdir"/usr --no-default-features
  rm -f "$pkgdir"/usr/.crates.toml
  rm -f "$pkgdir"/usr/.crates2.json
  mv "$pkgdir"/usr/bin/spacegame "$pkgdir"/usr/bin/everfight

  install -Dm644 attributions.txt "$pkgdir"/usr/share/licenses/$pkgname/attributions.txt
  install -Dm644 game_readme.md "$pkgdir"/usr/share/doc/$pkgname/readme.md
  cp -a assets "$pkgdir"/usr/share/${pkgname%-git}
}
