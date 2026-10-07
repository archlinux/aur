# Maintainer: Mohamad Obeid <mobeid nine nine nine nine at gmail dot com>
# Contributor: Keo Ponleou Sok <dev.ponleousk@gmail.com>
pkgname=mixtapes-git
pkgver=2026.10.07.1
pkgrel=1
pkgdesc="A modern, Linux-first YouTube Music player"
arch=('x86_64' 'aarch64')
url="https://github.com/m-obeid/Mixtapes"
license=('GPL3')
# Note: webkitgtk-6.0 must come from the 'extra' repository. The CachyOS build
# is known to malfunction with Mixtapes - see the install hook below.
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'openssl' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'sqlite' 'yt-dlp' 'yt-dlp-ejs' 'nodejs')
makedepends=('git' 'cargo')
optdepends=('ffmpeg: for downloading music')
provides=("mixtapes")
conflicts=("mixtapes")
install="${pkgname}.install"
# makepkg's -flto breaks the link of aws-lc-sys, the C library under rustls.
options=(!lto)
source=("${pkgname}::git+https://github.com/m-obeid/Mixtapes.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  grep -oP '(?<=<release version=")[^"]+' com.pocoguy.Muse.metainfo.xml | head -1 | tr '-' '.'
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The stylesheet and icons are compiled into the binary by build.rs. The v8
  # crate under the PO-token minter fetches its prebuilt library here.
  cargo build --frozen --release
}

package() {
  cd "$pkgname"

  install -Dm755 target/release/mixtapes "$pkgdir/usr/bin/mixtapes"
  # 'muse' stays as an alias, which is what the desktop file runs.
  ln -sf mixtapes "$pkgdir/usr/bin/muse"

  install -Dm644 com.pocoguy.Muse.desktop "$pkgdir/usr/share/applications/com.pocoguy.Muse.desktop"
  install -Dm644 com.pocoguy.Muse.metainfo.xml "$pkgdir/usr/share/metainfo/com.pocoguy.Muse.metainfo.xml"
  install -Dm644 assets/icons/hicolor/scalable/apps/com.pocoguy.Muse.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.pocoguy.Muse.svg"
  install -Dm644 assets/icons/hicolor/symbolic/apps/com.pocoguy.Muse-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.pocoguy.Muse-symbolic.svg"
}
