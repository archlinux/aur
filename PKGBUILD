pkgname=neuro-karaoke-wrapper-git
_pkgname=neuro-karaoke-wrapper
_execname=neuro-karaoke-player
pkgver=1.5.1.r0.cfc6434
pkgrel=1
pkgdesc='Desktop wrapper for neurokaraoke.com with media controls and tray support'
arch=('x86_64' 'aarch64')
url="https://github.com/AferilVT/$_pkgname"
license=('MIT')
depends=('electron')
makedepends=('git' 'yarn')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "$_pkgname"
  
  # delete inferior icon formats to save a little space
  rm -f ./assets/*.ico
  rm -f ./assets/*.icns
  
  # install dependencies for building
  npm_config_platform=linux yarn install --frozen-lockfile
  
  # detect architecture
  case "$CARCH" in
    x86_64) _arch=x64 ;;
    aarch64) _arch=arm64 ;;
  esac
  
  # build application
  yarn electron-builder --linux --dir --$_arch
}

package() {
  cd "$_pkgname"

  # install .asar and wrapper script
  install -Dm644 dist/linux-unpacked/resources/app.asar "$pkgdir/usr/lib/$_pkgname/app.asar"
  cat <<EOF > "$pkgdir/usr/lib/$_pkgname/$_execname"
#!/bin/sh
exec electron /usr/lib/$_pkgname/app.asar "$@"
EOF
  chmod +x "$pkgdir/usr/lib/$_pkgname/$_execname"

  # symlink wrapper script to /usr/bin/
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/$_execname" "$pkgdir/usr/bin/$_execname"

  # install icon file
  install -Dm644 "assets/neurokaraoke.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # install shortcut
  install -d "$pkgdir/usr/share/applications"
  cat <<EOF > "$pkgdir/usr/share/applications/$pkgname.desktop"
[Desktop Entry]
Name=Neuro Karaoke Player
Exec=$_execname
Icon=$_pkgname
Type=Application
Categories=AudioVideo;Player;
Comment=Desktop wrapper for neurokaraoke.com
Terminal=false
EOF

  # install license (as required by MIT license)
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
