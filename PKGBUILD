# Maintainer: meowkate
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: quininer

pkgname=ruffle-dinnerbone-git
pkgver=r11167.74134363d
pkgrel=1
epoch=1
pkgdesc="A Flash Player emulator written in Rust"
arch=(x86_64 aarch64)
url="https://ruffle.rs/"
license=(Apache MIT)
depends=(alsa-lib gtk3

         # namcap implicit depends
         glibc gcc-libs glib2 zlib openssl hicolor-icon-theme)
makedepends=(git cargo clang python jdk-openjdk at-spi2-core)
provides=(ruffle)
conflicts=(ruffle ruffle-git)
options=(!lto)
source=("git+https://github.com/Dinnerbone/ruffle.git#branch=wgpu_0_19"
      '0001-feat-initialize_adapter_from_env.patch')
sha256sums=('SKIP'
            '488c46400a1d347f900f90950f8420f6b7cb596257ce1a1a6e84e94e36bfc34e')

pkgver() {
  cd "ruffle/desktop"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "ruffle"

  # patch: try WGPU_ADAPTER_NAME as wayland+NVIDIA+wgpu not work for me
  git apply "${srcdir}/0001-feat-initialize_adapter_from_env.patch"

  cd "desktop"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build(){
  cd "ruffle/desktop"

  cargo build --frozen --release
}

package() {
  cd ruffle
  install -D -m755 "target/release/ruffle_desktop" "$pkgdir/usr/bin/ruffle"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"

  for s in 16x16 32x32 128x128 256x256 512x512; do
    install -Dm0644 "desktop/assets/Assets.xcassets/RuffleMacIcon.iconset/icon_$s.png" "${pkgdir}/usr/share/icons/hicolor/$s/apps/ruffle.png"
  done

  install -d "${pkgdir}/usr/share/applications/"
 cat > "${pkgdir}/usr/share/applications/ruffle.desktop" << _EOD
[Desktop Entry]
Type=Application
Name=Ruffle
GenericName=Ruffle
Comment=Player for using content created on the Adobe Flash platform
Exec=ruffle
Icon=ruffle
Terminal=false
StartupNotify=false
Categories=Audio;AudioVideo;Graphics;GTK;Player;Video;Viewer;
MimeType=application/x-shockwave-flash;
_EOD
}
