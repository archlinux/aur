# Maintainer: Damglador <damglador@gmail.com>

pkgname=undertalemodtool-bin
_pkgname=undertalemodtool

pkgver=0.9.1.0
pkgrel=1
arch=('x86_64')

pkgdesc="The most complete tool for modding, decompiling and unpacking Undertale (and other GameMaker games!)"
url="https://github.com/UnderminersTeam/UndertaleModTool"
license=("GPL-3.0")

depends=("wine")
provides=("$_pkgname")
options=("!strip" "!debug")

source=(
  "${_pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/UndertaleModTool_v${pkgver}-Windows-SingleFile.zip"
  "${_pkgname}.sh"
  "${_pkgname}.exe.desktop"
  "gamemaker-data.xml"
  "icon.png"
  )
sha256sums=('7ad4855ddf3cb5c33c895f04a78d1cf9b86036b400a633483da8e393b995fb0a'
            '2f0ef17e0a6e2ff4fd7193ee5d53b801577bd88865ebbd82d827377634e2ee51'
            'b117db1939eaf99652da0617f82e6994e0e69ac45d993e504fb766793f2d7773'
            '64c7b9ab34a2c519f99533b85a6ff8b4a50710ec6ee93024f3b239493dc9d61e'
            '4f501b7495960a291dfaa3a5c7b87b529170c47447c365d2407d1d317d97c51f')

noextract=("${_pkgname}-${pkgver}.zip")

prepare() {
  mkdir -p "${_pkgname}-${pkgver}"
  bsdtar -xf "${_pkgname}-${pkgver}.zip" -C "${_pkgname}-${pkgver}"
}

package(){
  install -d "$pkgdir/opt"

  # Copy program files
  cp -r --preserve=mode "${_pkgname}-${pkgver}" "$pkgdir/opt/${_pkgname}"
  # Install launcher script
  install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
  # Install destkop file
  install -Dm644 "${_pkgname}.exe.desktop" "$pkgdir/usr/share/applications/${_pkgname}.exe.desktop"
  # Install icon
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  # Install MIME type
  install -Dm644 gamemaker-data.xml "$pkgdir/usr/share/mime/packages/gamemaker-data.xml"
  # Add a directory required for running font import script (has to be writable)
  install -dm777 "$pkgdir/opt/${_pkgname}/Packager"
}
