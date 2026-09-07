# Maintainer: vogan <voganwong@hotmail.com>

pkgname=cherry-studio-bin
_pkgname=cherry-studio
pkgver=2.0.12
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
    _appimage_arch='linux-x64'
    ;;
  aarch64)
    _appimage_arch='linux-arm64'
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
    _sha256sum='9a48c1311d73431149a9b231c73f401bd7caf84f408cb62c505e4299f481fd1f'
    ;;
  aarch64)
    _sha256sum='2f7242e396b978ed5b4dacf2c2dc059576614da5152cde5244bd89e0528770d9'
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
