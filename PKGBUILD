# Maintainer: D Basso <dbas.so@poul.org>

pkgname=strata-files
pkgver=1.1.1
pkgrel=1
pkgdesc='A fast, keyboard-first file manager for Linux'
url='https://stratafiles.io/ '
license=(MIT)
makedepends=('cargo' 'quickjs-ng')
depends=(
  'bubblewrap'
  'desktop-file-utils'
  'ffmpeg'
  'ffmpegthumbnailer'
  'fontconfig'
  'glibc>=2.39'
  'gst-libav'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk4'
  'gtksourceview5'
  'gvfs'
  'poppler-glib'
  'unrar'
  'xdg-utils'
)
optdepends=(
  'gvfs-smb: SMB network share support'
  'imagemagick: additional image preview support'
  'libraw: camera RAW preview support'
  'dcraw: camera RAW preview support'
  'xdg-desktop-portal: use Strata for Open/Save file chooser dialogs'
  'udiskie: unlock encrypted volumes with Strata'
)
arch=('i686' 'x86_64')
source=("https://github.com/lgse/strata/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1a65e931a53cc83182d7b7138b8fd5f5697387f31e5f104f6671e245107a9665')

options=(!lto)

prepare() {
    cd strata-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd strata-$pkgver
    export ZSTD_SYS_USE_PKG_CONFIG=1
    export CARGO_PROFILE_RELEASE_LTO=false
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd strata-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd strata-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    # for custom license, e.g. MIT
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # install -Dm755 strata "$pkgdir/usr/bin/strata"
  install -Dm644 data/io.github.lgse.Strata.desktop "$pkgdir/usr/share/applications/io.github.lgse.Strata.desktop"
  install -Dm644 data/brand/strata-logo-white.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.lgse.Strata.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
  install -Dm644 data/licenses/UnRAR.txt "$pkgdir/usr/share/licenses/$pkgname/UnRAR.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/portal-file-chooser.md "$pkgdir/usr/share/doc/$pkgname/portal-file-chooser.md"
  install -Dm644 data/io.github.lgse.Strata.FileManager1.service "$pkgdir/usr/share/dbus-1/services/io.github.lgse.Strata.FileManager1.service"
}
