# Maintainer: ZorinArch <zorinarch@protonmail.com>

_pkgname=penpot-desktop
pkgname=$_pkgname-bin
pkgdesc="Unofficial desktop app to Penpot — The open-source design tool for design and code collaboration. (binary release)"
pkgver=0.3.1
pkgrel=1
url="https://sudovanilla.com/code/Korbs/Penpot-Desktop/"
license=('MPL-2.0 license')
arch=('x86_64' 'aarch64')
depends=('alsa-lib' 'libappindicator-gtk3' 'libnotify' 'libsodium' 'libxss' 'libxtst' 'mesa' 'nss')
makedepends=('fuse2')
provides=("$_pkgname")
conflicts=("$_pkgname")
if [ "$CARCH" == "x86_64" ]; then
    _appimage="$_pkgname-$pkgver.AppImage"
  elif [ "$CARCH" == "aarch64" ]; then
    _appimage="$_pkgname-$pkgver-arm64.AppImage"
fi
source_x86_64=("$_appimage::https://dl.sudovanilla.com/applications/$_pkgname/latest/Penpot%20Desktop-$pkgver.AppImage")
source_aarch64=("$_appimage::https://dl.sudovanilla.com/applications/$_pkgname/latest/Penpot%20Desktop-$pkgver-arm64.AppImage")
sha256sums_x86_64=('48a50166200de21955ca286cb14d4a516bf9527c41c945e6047250fd70d4e691')
sha256sums_aarch64=('SKIP')


_fix_permissions() (
  target=$1

  if [[ -L "$target" ]]; then
    return 0
  fi

  if [[ -d "$target" || -x "$target" ]]; then
    chmod 755 "$target"
    return 0
  fi

  if [[ -f "$target" ]]; then
    chmod 644 "$target"
    return 0
  fi

  echo "Unrecognizable filesystem entry: $target" >&2
  return 1
)

prepare() {
# Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
# Edit the shortcut
  cd squashfs-root
  sed -i -E "s|Exec=AppRun|Exec=$_pkgname|g" $_pkgname.desktop
  sed -i "/X-AppImage-Version=$pkgver/d; /actions=undefined/d" $_pkgname.desktop
  sed -i 's/--no-sandbox //g' $_pkgname.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
# Install
  cd squashfs-root
  install -D -m644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/$_pkgname.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  rm -dr usr AppRun $_pkgname.desktop $_pkgname.png .DirIcon resources/app-update.yml
  ln -s /opt/$_pkgname/$_pkgname -t "$pkgdir/usr/bin"
  mv * "$pkgdir/opt/$_pkgname"
# Fix permissions
  find "$pkgdir/opt/$_pkgname" | while read -r target; do
    _fix_permissions "$target"
  done
}
