# Maintainer: Keil <keilmillerjr@outlook.com>

pkgname=odadrawingsexplorer-bin
_pkgname=odadrawingsexplorer
_appname=ODADrawingsExplorer
_build=QT6_lnxX64_11dll
pkgver=27.10
pkgrel=1
pkgdesc='Free viewer for DWG, DXF and DGN drawings by the Open Design Alliance'
arch=('x86_64')
url='https://www.opendesign.com/guestfiles/oda_drawings_explorer'
license=('LicenseRef-ODA')
depends=('dbus' 'fontconfig' 'freetype2' 'glib2' 'glibc' 'hicolor-icon-theme'
         'krb5' 'libgcc' 'libglvnd' 'libstdc++' 'libx11' 'libxcb' 'libxkbcommon'
         'libxkbcommon-x11' 'zlib')
optdepends=('libcups: printing')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$_appname-$pkgver.deb::https://www.opendesign.com/guestfiles/get?filename=${_appname}_${_build}_$pkgver.deb"
        "$_pkgname.sh"
        "$_pkgname.desktop"
        'LICENSE')
sha256sums=('68aeb8379101e5d00ec7f8a5f09d45df8af5d16dc4e659113a6f4b51e6247f29'
            '4717cd40b9292cb2cd30a8d23377d1aeec86ebe2e8273b5530a38bda96e3c93a'
            '2e7d54873f5f89274720cc9bf47e4d448584a93e32cfccebf18f50cc8694e3a1'
            '165163d5b80d599d204f92445c5efc7ab923ad8afd9a34d044fdffaf6c8d4c13')

prepare() {
  mkdir -p data
  bsdtar -xf data.tar.* -C data
}

package() {
  local _src="data/usr/bin/${_appname}_$pkgver.0.0"
  local _dest="$pkgdir/opt/$_pkgname"

  # Keep the bundled Qt: the binary refuses to load against Arch's qt6-base
  install -d "$_dest"
  cp -r --no-preserve=ownership "$_src/." "$_dest"
  rm "$_dest/AppRun"

  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  local _size
  for _size in 16 32 64 128; do
    install -Dm644 "data/usr/share/icons/hicolor/${_size}x$_size/apps/$_appname.png" \
      "$pkgdir/usr/share/icons/hicolor/${_size}x$_size/apps/$_pkgname.png"
  done
}
