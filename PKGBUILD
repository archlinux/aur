# Maintainer: Daniil Gentili <daniil@daniil.it>

_pkgname="cabbage"
pkgname="$_pkgname-bin"
pkgver=2.9.0
pkgrel=1
pkgdesc="Framework for developing audio plugins with the Csound programming language"
url="https://cabbageaudio.com/"
license=('GPL')
arch=(x86_64)

makedepends=('gendesk')

provides=("cabbage=${pkgver}")
conflicts=("cabbage")

source=("https://github.com/rorywalsh/cabbage/releases/download/v${pkgver}/CabbageLinux-${pkgver}.zip")
sha256sums=('9fd60f04a475989d2ac713c06e93732c65bbd1593d672d880dd22702e8e85a4a')

prepare() {
  local _gendesk_options=(
    -q -f -n
    --pkgname="$_pkgname"
    --pkgdesc="$pkgdesc"
    --name="Cabbage"
    --exec="Cabbage %u"
    --icon="$_pkgname"
    --terminal=false
    --categories="AudioVideo;Audio;Multimedia"
    --startupnotify=true
    --custom="StartupWMClass=Cabbage"
  )

  gendesk "${_gendesk_options[@]}"
}

package() {
  depends+=('csound')

  cabbage_rack_path="$pkgdir/usr/bin/CabbageRack"
  bin_path="$pkgdir/usr/bin"
  icon_path="$pkgdir/usr/share/pixmaps"
  doc_path="$pkgdir/usr/share/doc/cabbage"
  theme_path="$pkgdir/usr/share/cabbage"
  desktop_path="$pkgdir/usr/share/applications"

  install -Dm644 "$srcdir"/images/* -t "$icon_path"
  install -Dm644 "$_pkgname.desktop" -t "$desktop_path"

  install -dm755 "$bin_path"
  cp --reflink=auto -r "$srcdir"/bin/* "$bin_path"

  install -dm755 "$doc_path"
  cp --reflink=auto -r "$srcdir/Examples" "$doc_path"

  cp --reflink=auto -r "$srcdir/CabbageManual" "$doc_path"

  install -dm755 "$cabbage_rack_path"
  cp --reflink=auto -r "$srcdir/CabbageRack" "$bin_path"

  install -dm755 "$theme_path"
  cp --reflink=auto -r "$srcdir/Themes" "$theme_path"
}
