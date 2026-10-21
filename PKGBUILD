# Maintainer: Andrew-Velox <mohabbat.bd2020@gmail.com>
pkgname=bornopata
pkgver=0.1.0_alpha.2
pkgrel=1
pkgdesc='Bangla (Avro phonetic) input method for Fcitx5 that learns your words'
arch=('x86_64')
url='https://github.com/Andrew-Velox/Bornopata'
license=('GPL-3.0-or-later' 'CC-BY-SA-4.0' 'LicenseRef-Character')
depends=('fcitx5' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon' 'wayland')
makedepends=('cargo' 'cmake' 'gcc' 'git' 'nlohmann-json' 'pkgconf' 'python' 'systemd-libs' 'wayland-protocols')
install=bornopata.install
options=('!lto' '!debug')
_tag=${pkgver//_/-}
# The dictionary and the word pair model are not in the repository; the data releases pin them
# (assets/dictionary/words.bnd.release and lm.bnd.release).
source=("$pkgname-$_tag-source.tar.gz::$url/releases/download/v$_tag/$pkgname-$_tag-source.tar.gz"
        "words.bnd::$url/releases/download/data-v1/words.bnd"
        "lm.bnd::$url/releases/download/data-lm-v1/lm.bnd")
sha256sums=('fd56152d4e1ed9f22d053ba5a94c8f45627b0e257869798b6d43a6bbe346612b'
            'db0da0846c795e4339d4b3257cd79e65324a0de3fe06105079edc4d0a3aa064d'
            '60a8ef66dde12085a4626ace1b8d8b1dc955229882fd1fe3118774c8f339a733')

prepare() {
  cd "$pkgname-$_tag"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release -p borno-linux-server -p borno-settings
  apps/linux/scripts/build-gloss.sh target/gloss-en.bnd
  cmake -S apps/linux/fcitx5 -B target/fcitx5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF
  cmake --build target/fcitx5
}

package() {
  cd "$pkgname-$_tag"
  install -Dm755 target/release/borno-linux-server "$pkgdir/usr/bin/borno-linux-server"
  install -Dm755 target/release/bornopata-settings "$pkgdir/usr/bin/bornopata-settings"
  DESTDIR="$pkgdir" cmake --install target/fcitx5
  install -Dm644 "$srcdir/words.bnd" "$pkgdir/usr/share/bornopata/words.bnd"
  install -Dm644 "$srcdir/lm.bnd" "$pkgdir/usr/share/bornopata/lm.bnd"
  install -Dm644 target/gloss-en.bnd "$pkgdir/usr/share/bornopata/gloss-en.bnd"
  sed 's|@PREFIX@|/usr|' apps/linux/systemd/bornopata.service |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/bornopata.service"
  sed 's|@PREFIX@|/usr|' apps/settings/linux/bornopata-settings.desktop |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/bornopata-settings.desktop"
  for icon in apps/settings/linux/icons/*/apps/bornopata.png; do
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$(basename "$(dirname "$(dirname "$icon")")")/apps/bornopata.png"
  done
  local licenses="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$licenses/LICENSE"
  install -Dm644 NOTICE.md "$licenses/NOTICE.md"
  install -Dm644 assets/dictionary/ATTRIBUTION.txt "$licenses/DICTIONARY-ATTRIBUTION.txt"
  install -Dm644 assets/gloss/ATTRIBUTION.txt "$licenses/GLOSS-ATTRIBUTION.txt"
  install -Dm644 assets/emoji/LICENSE-unicode.txt "$licenses/EMOJI-LICENSE-UNICODE.txt"
}
