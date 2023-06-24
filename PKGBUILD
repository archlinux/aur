# Maintainer:

# set source - chaotic-aur or bitbucket (default) 
_pkg='chaotic-aur'
_caur_pkgrel=1.1

_pkgname=art-rawconverter
pkgname="$_pkgname-bin"
pkgver=1.20
pkgrel=2
pkgdesc="Raw image Converter forked from RawTherapee with ease of use in mind (including blackfoxx-theme)"
arch=('x86_64')
url="https://bitbucket.org/agriggio/art"
license=('GPL3')

depends=()
makedepends=()

optdepends=(
  'art-rawconverter-imageio: add support for additional image formats'
  'lcms2-ff: lcms2 with fast-float plugin for improved export speed'
  'perl-image-exiftool: metadata support for CR3 images'
)

conflicts=('art-rawconverter')
provides=('art-rawconverter')

options=(!strip !debug)

case "$_pkg" in
  '1'|'chaotic-aur'|'caur')
    # chaotic-aur
    _url="https://cdn-mirror.chaotic.cx/chaotic-aur/$CARCH"
    _dl_url="$_url/art-rawconverter-$pkgver-$_caur_pkgrel-$CARCH.pkg.tar.zst"

    source=(
      "$_pkgname-$pkgver-caur.tar.xz"::"$_dl_url"
    )
    sha256sums+=(
      'SKIP'
    )
    ;;
  *)
    # bitbucket
    _dl_url="$url/downloads/ART-$pkgver-linux64.tar.xz"
    source=(
      "$_pkgname-$pkgver.tar.xz"::"$_dl_url"
      "bft_20.zip::https://discuss.pixls.us/uploads/short-url/fG7iCaIWBWBem30O67V15EfO521.zip"
    )
    sha256sums+=(
      'bba6bc335bfd337e2805cac435c51d3493d1a8271b78ba4355920403b8771e90'
      '7381c57e48b1437bec6b775029370f99f6fc14eced53678972e9f0b7e02a4346'
    )
    ;;
esac


prepare() {
  case "$_pkg" in
    '1'|'chaotic-aur'|'caur')
      # chaotic-aur
      ;;
    *)
      # bitbucket
      cp -rl "$srcdir/ART-$pkgver-linux64" "$srcdir/$_pkgname-$pkgver"
      cp "$srcdir/blackfoxx-GTK3-20_.css" "$srcdir/$_pkgname-$pkgver/themes"

      cat "$srcdir/$_pkgname-$pkgver/share/applications/ART.desktop" \
        | sed 's/Name=ART/Name=ART Raw Converter/' \
        | sed 's/Exec=ART/Exec=art/' \
        | sed "s/Icon=ART/Icon=$_pkgname/" \
        > "$srcdir/$_pkgname.desktop"
      ;;
  esac
}

package() {
  depends+=(
    'desktop-file-utils'
    'exiv2'
    'fftw'
    'glibmm'
    'gtk3'
    'gtkmm3'
    'lcms2'
    'lensfun'
    'libcanberra'
    'libiptcdata'
    'libraw'
    'mimalloc'
    'opencolorio'
    'openmp'
  )

  case "$_pkg" in
    '1'|'chaotic-aur'|'caur')
      # chaotic-aur
      mv "$srcdir/usr" "$pkgdir"

      ln -s "ART" "$pkgdir/usr/bin/art"
      ln -s "ART-cli" "$pkgdir/usr/bin/art-cli"
      ;;
    *)
      # bitbucket
      OPT_PATH="opt/$_pkgname"

      # Install the package files
      install -d "$pkgdir"/{usr/bin,opt}
      cp -r "$_pkgname-$pkgver" "$pkgdir/$OPT_PATH"
      ln -s "/$OPT_PATH/ART" "$pkgdir/usr/bin/art"
      ln -s "/$OPT_PATH/ART-cli" "$pkgdir/usr/bin/art-cli"

      # Install .desktop files
      install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

      # Install icons
      SRC_LOC="$srcdir/$_pkgname-$pkgver/share/icons/hicolor"
      DEST_LOC="$pkgdir/usr/share/icons/hicolor"
      for i in 16 24 48 128 256
      do
        install -Dm644 "$SRC_LOC/${i}x${i}/apps/ART.png" "$DEST_LOC/${i}x${i}/apps/$_pkgname.png"
      done
      ;;
  esac
}
