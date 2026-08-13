# Maintainer: Ali Kaya <akilaya@outlook.com.tr>

# AUR sürümü. Yerel geliştirme paketinden (../PKGBUILD) farkı: kaynağı
# depodan etiketle indirir, böylece paketi herkes yeniden üretebilir.
#
# Yayınlamadan önce: kaynak deposu anonim erişime açık olmalıdır.

pkgname=confsync
pkgver=0.1.0
pkgrel=1
pkgdesc='Backs up and restores Linux configuration files in a git repository, with a tray agent'
arch=('x86_64')
url='https://github.com/alikaya/confsync'
license=('MIT')
# Doğrudan bağlananlar `readelf -d` ile, çalışma anında `dlopen` edilenler
# ikili içindeki soname dizgileriyle çıkarıldı. namcap ikinci grubu
# "gereksiz" sanır; winit/glutin bunları çalışma anında yükler.
depends=('glibc' 'libgcc' 'openssl' 'zlib-ng-compat' 'hicolor-icon-theme'
         'libglvnd' 'wayland' 'libxkbcommon' 'libxkbcommon-x11'
         'libx11' 'libxcb' 'libxcursor' 'libxi')
makedepends=('cargo' 'git')
install=confsync.install
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

# !lto: makepkg'in LTO seçeneği CFLAGS'e `-flto=auto`, RUSTFLAGS'e
#       `-C linker-plugin-lto` ekler. git2 kendi libgit2'sini `cc` ile
#       derlediğinden ortaya çıkan arşiv bitcode olur ve bağlama
#       "undefined symbol: git_*" ile düşer.
# !debug: ayrı bir hata ayıklama paketi üretilmesin.
options=(!lto !debug)

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  # Bağımlılıklar önceden indirilir; build() ve check() ağ kullanmadan çalışır.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Panik mesajlarına gömülen `file!()` yolları derleme dizinini ele
  # veriyordu ("Package contains reference to $srcdir"); yeniden eşlenir.
  # check() ile aynı bayraklar kullanılır, aksi halde cargo her şeyi
  # yeniden derler.
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/usr/src/$pkgname"
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/usr/src/$pkgname"
  cargo test --frozen --release --workspace
}

package() {
  cd "$pkgname"

  install -Dm755 target/release/confsync "$pkgdir/usr/bin/confsync"
  install -Dm755 target/release/confsync-agent "$pkgdir/usr/bin/confsync-agent"

  install -Dm644 packaging/confsync.desktop \
    "$pkgdir/usr/share/applications/confsync.desktop"
  install -Dm644 packaging/confsync.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/confsync.svg"

  install -Dm644 packaging/confsync-agent.service \
    "$pkgdir/usr/lib/systemd/user/confsync-agent.service"

  # Ajan paketle birlikte etkin gelir ("vendor enabled"): etkinleştirme
  # bağlantısı /usr/lib altında olduğu için kullanıcının `systemctl --user
  # enable` çalıştırması gerekmez. Kullanıcının ~/.config'i her zaman üstün
  # gelir; vazgeçmek isteyen `systemctl --user mask` eder.
  install -d "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants"
  ln -s ../confsync-agent.service \
    "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/confsync-agent.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
