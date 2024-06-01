# Maintainer:

## useful links
# https://github.com/Alexey-T/CudaText
# https://github.com/Alexey-T/CudaText_up

: ${_widgets=qt6}

## basic info
_pkgname="cudatext"
pkgname="$_pkgname-git"
pkgver=1.214.7.0.r0.gb68336f
pkgrel=1
pkgdesc="Cross-platform text editor written in Free Pascal"
url="https://github.com/Alexey-T/CudaText"
license=("MPL-2.0")
arch=('x86_64')

case "${_widgets::1}" in
  g)
    depends=("${_widgets}")
    ;;
  q)
    depends=("${_widgets}pas")
    ;;
esac
makedepends=(
  'git'
  'lazarus'
  'xmlstarlet'
  'imagemagick'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="CudaText"
source=(
  "git+https://github.com/Alexey-T/ATBinHex-Lazarus"
  "git+https://github.com/Alexey-T/ATFlatControls"
  "git+https://github.com/Alexey-T/ATSynEdit"
  "git+https://github.com/Alexey-T/ATSynEdit_Cmp"
  "git+https://github.com/Alexey-T/ATSynEdit_Ex"
  "git+https://github.com/Alexey-T/CudaText"
  "git+https://github.com/Alexey-T/EControl"
  "git+https://github.com/Alexey-T/Emmet-Pascal"
  "git+https://github.com/Alexey-T/EncConv"
  "git+https://github.com/Alexey-T/Python-for-Lazarus"
  "git+https://github.com/bgrabitmap/bgrabitmap"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

# order matters; do not alphabetize
_packets=(
  bgrabitmap/bgrabitmap/bgrabitmappack.lpk
  EncConv/encconv/encconv_package.lpk
  ATBinHex-Lazarus/atbinhex/atbinhex_package.lpk
  ATFlatControls/atflatcontrols/atflatcontrols_package.lpk
  ATSynEdit/atsynedit/atsynedit_package.lpk
  ATSynEdit_Cmp/atsynedit_cmp/atsynedit_cmp_package.lpk
  EControl/econtrol/econtrol_package.lpk
  ATSynEdit_Ex/atsynedit_ex/atsynedit_ex_package.lpk
  Python-for-Lazarus/python4lazarus/python4lazarus_package.lpk
  Emmet-Pascal/emmet/emmet_package.lpk
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  magick "$_pkgsrc/app/cudatext_fullsize.ico[0]" "$_pkgname.png"

  cat > "$_pkgname.desktop" << END
[Desktop Entry]
Name=CudaText
Comment=$pkgdesc
Exec=$_pkgname %U
Icon=$_pkgname
Terminal=false
Type=Application
Categories=Office;Development;
END

  # modify compiler options
  for i in ${_packets[@]} "$_pkgsrc/app/cudatext.lpi"; do
    xmlstarlet edit --inplace --delete '//Other' "$i"
    sed -E 's&(</CompilerOptions>)&<Other><CustomOptions Value='\''-O3 -Sa -CX -XX -k"--sort-common --as-needed -z relro -z now"'\''/></Other>\n\1&' \
      -i "$i"
  done
}

build() (
  mkdir -p build
  for i in ${_packets[@]} "$_pkgsrc/app/cudatext.lpi"; do
    lazbuild -B "$i" \
      --lazarusdir="/usr/lib/lazarus" \
      --widgetset="$_widgets" \
      --os=linux --cpu=$ARCH \
      --primary-config-path=build
  done
)

package() (
  install -Dm755 "$_pkgsrc/app/cudatext" -t "$pkgdir/usr/bin/"

  install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
)
