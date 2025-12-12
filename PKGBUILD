_pkgname=slimevr
pkgname=$_pkgname-bin
pkgver=18.1.0
_tag=v18.1.0
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
sha512sums=('ddb2ed73173a320dd9982e53abe52f7e6528dd029b002b7ae6715f4b517f03a10e7719fbab7e5c07d51c966eb977c424e3be845b78e2395d083598699959eda9'
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
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 "usr/share/icons/hicolor/$i/apps/$_pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/$i/apps"
  done
}
