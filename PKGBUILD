_pkgname=slimevr
pkgname=$_pkgname-bin
pkgver=19.0.0
_tag=v19.0.0
pkgrel=6
pkgdesc="VR Full Body Tracking System"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server"
license=('MIT','Apache-2.0')
groups=()
depends=("fuse2")
makedepends=()
checkdepends=()
optdepends=()
provides=("slimevr-server")
conflicts=("slimevr-server")
replaces=()
backup=()
options=(!strip)
install=
changelog=CHANGELOG
_appimage=SlimeVR-amd64.appimage
source=("$url/releases/download/$_tag/$_appimage"
		"$url/raw/$_tag/LICENSE-MIT"
		"$url/raw/$_tag/LICENSE-APACHE")
noextract=()
sha512sums=('23f5ba73994d3bbc2c7d874c0c3c5f720b74eae1c2a7da8d7eb795cdd143edf4b808b5d9ab283a4cc69d8ad720f6b283b6053c69fae38c1ae61ddd1e185f01d9'
            '3b6306600ce9420d982a589293281db31c3c013bc9e0a829ae85e924f1318fa420bad7c73d0b1924ffdc74a92d44793de749daccd383ddcdc4c82169bf1d7e9d'
            '530b18b93fcec33499964bcbc019398194035247efdf6c1a8bf78fb56c7e1e0e401b02287b5201423b2bcfb4f8c7fddbf0aba161e3909ac25078b426459558ae')
validpgpkeys=()

prepare() {
  # Extract the AppImage
  chmod +x "$_appimage"
  ./"$_appimage" --appimage-extract
  # Create an exec file with an environment variable that disables AppImageLauncher integration
  echo '#!/usr/bin/env sh' > $_pkgname
  echo env APPIMAGELAUNCHER_DISABLE=true /opt/$_pkgname/$_pkgname >> $_pkgname
}

package() {
  install -Dm755 "$_appimage" "$pkgdir/opt/$_pkgname/$_pkgname"
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE-MIT" "LICENSE-APACHE" -t "$pkgdir/opt/$_pkgname"

  cd squashfs-root

  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
  for i in 32x32 128x128; do
    install -Dm644 "usr/share/icons/hicolor/$i/apps/$_pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/$i/apps"
  done
}
