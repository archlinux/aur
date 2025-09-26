# Maintainer: Daniil Gentili <daniil@daniil.it>

# Note: 2.9.0 is the last real release.
#  2.10.0 is a dummy "end of life" release.

_pkgname="cabbage"
pkgname="$_pkgname-bin"
pkgver=2.9.0
pkgrel=2
pkgdesc="Framework for developing audio plugins with the Csound programming language"
url="https://cabbageaudio.com/"
license=('GPL-2.0-or-later')
arch=('x86_64')

makedepends=('patchelf')

optdepends=(
  'vst-host: for loading the VST2 format plugins'
  'vst3-host: for loading the VST3 format plugins'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source=("https://github.com/rorywalsh/cabbage/releases/download/v$pkgver/CabbageLinux-$pkgver.zip")
sha256sums=('9fd60f04a475989d2ac713c06e93732c65bbd1593d672d880dd22702e8e85a4a')

package() {
  depends=(
    'csound'
    'freetype2'
    'libglvnd'
  )

  cabbage_rack_path="$pkgdir/usr/bin/CabbageRack"
  bin_path="$pkgdir/usr/bin"
  vst2_path="$pkgdir/usr/lib/vst"
  vst3_path="$pkgdir/usr/lib/vst3"
  icon_path="$pkgdir/usr/share/pixmaps"
  doc_path="$pkgdir/usr/share/doc/cabbage"
  theme_path="$pkgdir/usr/share/cabbage"
  desktop_path="$pkgdir/usr/share/applications"

  install -Dm644 images/* -t "$icon_path"
  install -Dm644 /dev/stdin "$desktop_path/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Cabbage
Comment=Framework for developing audio plugins with the Csound programming language
Exec=Cabbage %u
Icon=cabbage
Terminal=false
StartupNotify=true
Categories=AudioVideo;Audio;Multimedia;
StartupWMClass=Cabbage
END

  # install plugins and binaries
  for i in bin/Cabbage bin/CabbagePlugin bin/CLIConverter; do
    patchelf --remove-rpath "$i"
    install -Dm755 "$i" -t "$bin_path"
  done

  for i in bin/*.so; do
    patchelf --remove-rpath "$i"
    install -Dm755 "$i" -t "$vst2_path"
  done

  for j in bin/*.vst3; do
    for i in "$j"/Contents/x86_64-linux/*.so; do
      patchelf --remove-rpath "$i"
      install -Dm755 "$i" -t "$vst3_path/$j"/Contents/x86_64-linux/
    done
  done

  # install examples and documentation
  install -dm755 "$doc_path"
  cp -r Examples "$doc_path"

  cp -r CabbageManual "$doc_path"

  install -dm755 "$cabbage_rack_path"
  cp -r "$srcdir/CabbageRack" "$bin_path"

  install -dm755 "$theme_path"
  cp -r "$srcdir/Themes" "$theme_path"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
