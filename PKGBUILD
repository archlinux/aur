# Maintainer: gaou-piou <i.am.piou@gmail.com>

pkgname=gitpulsar
pkgver=1.4.0
pkgrel=1
pkgdesc='Fast, native Git client for GNOME (GTK4 + libadwaita)'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/ilshat-apps/gitpulsar'
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'git'
  'glib2'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'libgcc'
  'libgit2'
  'libssh2'
  'oniguruma'
  'openssl'
  'pango'
)
makedepends=('cargo')
conflicts=('gitpulsar-appimage')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        'system-libgit2.patch')
sha256sums=('aad433bd05265ec3d6e3db633858428014d47df8a3f1d5927b0133efe31979cb'
            '32c40a1471a9bed6dee02425f005281acdac8e73b0bd17524c62a50e7c270685')

_appid=io.gitlab.ilshat_apps.gitpulsar

prepare() {
  cd "$pkgname-v$pkgver"
  # git2 0.19 pins libgit2 1.8.x, so with Arch's 1.9 libgit2-sys would build
  # its bundled copy (whose LTO objects rust-lld cannot link). git2 0.20 is a
  # drop-in here and uses the system libgit2.
  patch -Np1 -i ../system-libgit2.patch
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBGIT2_NO_VENDOR=1
  export RUSTONIG_SYSTEM_LIBONIG=1
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release
}

check() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBGIT2_NO_VENDOR=1
  export RUSTONIG_SYSTEM_LIBONIG=1
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  # The GTK crate's tests need a display; the core holds the git logic.
  cargo test --frozen --release -p gitpulsar-core
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 target/release/gitpulsar-gtk -t "$pkgdir/usr/bin"
  ln -s gitpulsar-gtk "$pkgdir/usr/bin/gitpulsar"

  install -Dm644 "data/$_appid.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "data/$_appid.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
  install -Dm644 "data/icons/hicolor/scalable/apps/$_appid.svg" \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 data/icons/hicolor/scalable/actions/*.svg \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/actions"

  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
}
