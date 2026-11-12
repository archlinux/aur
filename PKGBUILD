# Maintainer: Mujtaba1i
# pkgver is rewritten from the git tag by .github/workflows/release.yml.

pkgname=archtoys
pkgver=0.7.4
pkgrel=1
pkgdesc="PowerToys-style tools for Linux: color picker, text extractor, screen ruler"
arch=('x86_64')
url="https://github.com/Mujtaba1i/Archtoys"
license=('MIT')
depends=('gcc-libs' 'glibc' 'fontconfig' 'libx11' 'libxcb' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libglvnd' 'wayland' 'hicolor-icon-theme')
optdepends=('tesseract: Text Extractor (Archtoys can also install it when you turn it on)'
            'tesseract-data-eng: English for Text Extractor'
            'tesseract-data-osd: lets Text Extractor find the writing system by itself')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Mujtaba1i/Archtoys/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('17184e2c97d02bc9fbd7246ef8a7c0f486c5707a894454a93766036a33cf9951')

prepare() {
  cd "Archtoys-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Archtoys-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "Archtoys-${pkgver}"

  # The crate is named "archtoys", so Cargo produces target/release/archtoys
  # (this used to say target/release/color-picker, the old name).
  install -Dm755 target/release/archtoys "${pkgdir}/usr/lib/archtoys/archtoys-bin"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/archtoys" <<'WRAP'
#!/bin/sh
export SLINT_BACKEND=winit
exec /usr/lib/archtoys/archtoys-bin "$@"
WRAP

  install -Dm644 packaging/archtoys.desktop "${pkgdir}/usr/share/applications/archtoys.desktop"
  install -Dm644 packaging/io.github.Mujtaba1i.Archtoys.metainfo.xml "${pkgdir}/usr/share/metainfo/io.github.Mujtaba1i.Archtoys.metainfo.xml"

  install -Dm644 packaging/archtoys.png "${pkgdir}/usr/share/pixmaps/archtoys.png"
  ln -sf archtoys.png "${pkgdir}/usr/share/pixmaps/archtoys-bin.png"

  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "packaging/archtoys-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/archtoys.png"
    ln -sf archtoys.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/archtoys-bin.png"
  done
  # archtoys.png is the 1024x1024 master icon
  install -Dm644 packaging/archtoys.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/archtoys.png"
  ln -sf archtoys.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/archtoys-bin.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 data/colornames-LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/colornames-LICENSE.txt"
}
