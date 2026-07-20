pkgname=neuro-karaoke-app
_pkgname=neuro-karaoke-app
_execname=neuro-karaoke-player
_reponame=neuro-karaoke-wrapper
pkgver=1.7.0
pkgrel=1
pkgdesc='Desktop wrapper for neurokaraoke.com with media controls and tray support.'
arch=('x86_64' 'aarch64')
url="https://github.com/AferilVT/$_reponame"
license=('MIT')
depends=('electron')
makedepends=('git' 'yarn' 'npm')
provides=("$_pkgname" "neuro-karaoke-wrapper")
conflicts=("$pkgname" "neuro-karaoke-wrapper-git")
replaces=("neuro-karaoke-wrapper-git")
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')
options=(!strip)

build() {
  cd "$_reponame/Desktop"
  rm -f ./assets/*.ico
  rm -f ./assets/*.icns
  npm_config_platform=linux yarn install --frozen-lockfile
  case "$CARCH" in
    x86_64) _arch=x64 ;;
    aarch64) _arch=arm64 ;;
  esac
  yarn build:pre
  yarn electron-builder --dir --linux --$_arch
}

package() {
  cd "$_reponame/Desktop"

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
Exec=env DISABLE_AUTOUPDATE=1 $_execname
Icon=$_pkgname
Type=Application
Categories=AudioVideo;Player;
Comment=$pkgdesc
Terminal=false
EOF

  # install license (as required by MIT license)
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
