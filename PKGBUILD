# Maintainer: vogan <voganwong@hotmail.com>

pkgname=cherry-studio-bin
_pkgname=cherry-studio
pkgver=1.7.21
pkgrel=1
pkgdesc="🍒 Cherry Studio is a desktop client that supports for multiple LLM providers "
arch=('x86_64' 'aarch64')
url="https://github.com/cherryHQ/cherry-studio"
license=('AGPL-3.0')
options=('!strip' '!debug')
depends=('fuse2')
conflicts=("$_pkgname")

# Determine architecture-specific values
case "$CARCH" in
  x86_64)
    _appimage_arch='x86_64'
    ;;
  aarch64)
    _appimage_arch='arm64'
    ;;
esac

source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Cherry-Studio-${pkgver}-${_appimage_arch}.AppImage"
  "${_pkgname}.desktop"
  "${_pkgname}.png"
  "${pkgname}.sh")

noextract=("${_pkgname}-${pkgver}.AppImage")

# Architecture-specific SHA256 checksums
case "$CARCH" in
  x86_64)
    _sha256sum='7a76683b6f854a82c72ec7535b36f52cd2e17cd41caa0e849f1245e28ce0fdcf'
    ;;
  aarch64)
    _sha256sum='6cba9739bd61e93a66cb55ce06ea1e9ec3e55a21b8fc140c5f689ce356ac09c4'
    ;;
esac

sha256sums=("$_sha256sum"
            'fd0b11ca782c9c0de6dbf34143b7f14560b4a7020e316c58e9a5e1115551c7ee'
            '597463003798254ab97505e2374485e55262152483f717f3169da3444de60f94'
            '6aed5e7ca95679b2545540241dc9e6b055da1dfde696006a1712f90cfbfaec92')

package() {
  cd "$srcdir"

  # Create directories
  install -dm755 "$pkgdir/usr/bin/$pkgname"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  # Install AppImage
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"
  # Install icon
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  # Install desktop file
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  # Install wrapper script
  install -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
