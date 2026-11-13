
  pkgname=ferrumpix-bin
  pkgver=0.9.82
  pkgrel=2
  pkgdesc='Desktop Photo/RAW-Editor, Viewer, Gallery, Immich and Nextcloud Client in one App'
  arch=('x86_64')
  url='https://github.com/Bitpainter75/FerrumPix'
  license=('GPL-3.0-only')
  depends=('glibc' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'libxkbcommon' 'libice' 'libsm'
           'mpv' 'libraw')
  optdepends=('libheif: read HEIC, HEIF and AVIF files'
              'libjxl: read and write JPEG XL files'
              'dnglab: convert RAW files to DNG')
  provides=('ferrumpix')
  conflicts=('ferrumpix')
  options=('!strip')

  source=("FerrumPix-${pkgver}-${pkgrel}-linux-x64.zip::https://github.com/Bitpainter75/FerrumPix/releases/download/latest/FerrumPix-${pkgver}-${pkgrel}-linux-x64.zip"
          "io.github.Bitpainter75.FerrumPix.desktop"
          "io.github.Bitpainter75.FerrumPix.png")
  noextract=("FerrumPix-${pkgver}-${pkgrel}-linux-x64.zip")
sha256sums=('bde2441de92d025f53da791487f167cad172c41d4b7d62f725dcc5b433c176bb'
            'e2b596afb3471c36194d50905f0f158f03dd340fcf0f788668bf37204eb7c2ec'
            '27b9941afcef5738a56f6bd520ab88b9407754c766f5338d67375063510e7b1c')

  prepare() {
    rm -rf "$srcdir/FerrumPix-${pkgver}"
    mkdir -p "$srcdir/FerrumPix-${pkgver}"
    bsdtar -xf "$srcdir/FerrumPix-${pkgver}-${pkgrel}-linux-x64.zip" -C "$srcdir/FerrumPix-${pkgver}"
  }

  package() {
    install -dm755 "$pkgdir/opt/ferrumpix"
    cp -a "$srcdir/FerrumPix-${pkgver}/." "$pkgdir/opt/ferrumpix/"

    install -Dm644 "$pkgdir/opt/ferrumpix/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    if [ -f "$pkgdir/opt/ferrumpix/THIRD-PARTY-NOTICES.txt" ]; then
      install -Dm644 "$pkgdir/opt/ferrumpix/THIRD-PARTY-NOTICES.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
    fi
    rm -f "$pkgdir/opt/ferrumpix/"{*.desktop,*.png}
    chmod +x "$pkgdir/opt/ferrumpix/FerrumPix"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/ferrumpix/FerrumPix "$pkgdir/usr/bin/ferrumpix"

    install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPix.desktop" \
      "$pkgdir/usr/share/applications/io.github.Bitpainter75.FerrumPix.desktop"

    install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPix.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.Bitpainter75.FerrumPix.png"
  }
