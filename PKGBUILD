# Maintainer: ZorinArch <zorinarch@protonmail.com>

app_name=penpot-desktop
pkgname=$app_name-bin
pkgdesc="Open-source design tool for design and code collaboration (binary release)"
pkgver=0.3.1
pkgrel=1
url="https://sudovanilla.com/code/Korbs/Penpot-Desktop/"
license=('MPL-2.0 license')
arch=('x86_64')
depends=('alsa-lib' 'libappindicator-gtk3' 'libnotify' 'libsodium' 'libxss' 'libxtst' 'mesa' 'nss')
makedepends=('fuse2')
provides=("$app_name")
conflicts=("$app_name")
_appimage="$app_name-$pkgver.AppImage"
source_x86_64=("$_appimage::https://dl.sudovanilla.com/applications/$app_name/latest/Penpot%20Desktop-$pkgver.AppImage")
sha256sums_x86_64=('48a50166200de21955ca286cb14d4a516bf9527c41c945e6047250fd70d4e691')


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
  sed -i -E "s|Exec=AppRun|Exec=$app_name|g" $app_name.desktop
  sed -i "/X-AppImage-Version=$pkgver/d; /actions=undefined/d" $app_name.desktop
  sed -i 's/--no-sandbox //g' $app_name.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/$app_name" "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
# Install
  cd squashfs-root
  install -D -m644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/$app_name.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$app_name.png"
  install -Dm644 $app_name.desktop -t "$pkgdir/usr/share/applications"
  rm -dr usr AppRun $app_name.desktop $app_name.png .DirIcon resources/app-update.yml
  ln -s /opt/$app_name/$app_name -t "$pkgdir/usr/bin"
  mv * "$pkgdir/opt/$app_name"
# Fix permissions
  find "$pkgdir/opt/$app_name" | while read -r target; do
    _fix_permissions "$target"
  done
}



