# Maintainer:

## links
# https://github.com/Alexey-T/CudaText
# https://github.com/Alexey-T/CudaText_up

## options
: ${_widgets=qt6}

_pkgname="cudatext"
pkgname="$_pkgname-git"
pkgver=1.229.5.0.r57.gb9ce0d8
pkgrel=1
pkgdesc="Text editor written in Free Pascal with Lazarus (${_widgets^})"
url="https://github.com/Alexey-T/CudaText"
license=("MPL-2.0")
arch=('x86_64')

depends=(
  'python'
)
makedepends=(
  'git'
  'lazarus'
  'imagemagick'
)
optdepends=(
  'python-brotli'
  'python-brotlicffi'
  'python-certifi'
  'python-chardet'
  'python-charset-normalizer'
  'python-cryptography'
  'python-h2'
  'python-idna'
  'python-pyopenssl'
  'python-pysocks'
  'python-requests'
  'python-simplejson'
  'python-typing_extensions'
  'python-urllib3'
  'python-zstandard'
)

case "${_widgets::1}" in
  g)
    depends+=("${_widgets}")
    ;;
  q)
    depends+=("${_widgets}pas")
    ;;
esac

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

_pkgsrc="CudaText"
source=(
  "$_pkgsrc"::"git+$url.git"
  "git+https://github.com/Alexey-T/ATBinHex-Lazarus.git"
  "git+https://github.com/Alexey-T/ATFlatControls.git"
  "git+https://github.com/Alexey-T/ATSynEdit.git"
  "git+https://github.com/Alexey-T/ATSynEdit_Cmp.git"
  "git+https://github.com/Alexey-T/ATSynEdit_Ex.git"
  "git+https://github.com/Alexey-T/EControl.git"
  "git+https://github.com/Alexey-T/Emmet-Pascal.git"
  "git+https://github.com/Alexey-T/EncConv.git"
  "git+https://github.com/Alexey-T/Python-for-Lazarus.git"
  "git+https://github.com/bgrabitmap/bgrabitmap.git"
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
  "$_pkgsrc/app/cudatext.lpi"
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  magick "$_pkgsrc/app/cudatext.ico[0]" \
    -define png:compression-filter=0 \
    -define png:compression-level=9 \
    -define png:compression-strategy=0 \
    png8:"$_pkgname.png"
}

build() (
  mkdir -p build

  local _laz_opts=(
    --build-all
    --cpu="$CARCH"
    --lazarusdir="/usr/lib/lazarus"
    --os=linux
    --primary-config-path=build
    --widgetset="$_widgets"
    --opt="-O3 -Sa -CX -XX -k--sort-common -k--as-needed -k-z -krelro -k-z -know"
  )

  for i in ${_packets[@]}; do
    lazbuild "${_laz_opts[@]}" "$i"
  done
)

package() (
  # binary
  install -Dm755 "$_pkgsrc/app/cudatext" -t "$pkgdir/usr/bin/"

  # icon
  install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/pixmaps/"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=CudaText
Comment=$pkgdesc
Exec=$_pkgname %U
Icon=$_pkgname
Terminal=false
Type=Application
Categories=Office;Development;
END

  # share
  for i in data py settings_default; do
    install -dm755 "$pkgdir/usr/share/$_pkgname/$i"
    cp -r "$_pkgsrc/app/$i"/* "$pkgdir/usr/share/$_pkgname/$i/"
  done

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
)
