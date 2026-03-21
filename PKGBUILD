pkgname=neuro-karaoke-wrapper-git
_pkgname=neuro-karaoke-wrapper
_execname=neuro-karaoke-player
pkgver=1.4alpha.r6.3ff7041
pkgrel=1
pkgdesc='Desktop wrapper for neurokaraoke.com with media controls and tray support'
arch=('x86_64')
url="https://github.com/AferilVT/$_pkgname"
license=('MIT')
depends=('libx11' 'alsa-lib')
makedepends=('git' 'yarn' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "$_pkgname"
  npm_config_platform=linux yarn install --frozen-lockfile
  yarn electron-builder --linux --dir --x64
}

package() {
  cd "$_pkgname"

  install -d "$pkgdir/usr/lib/$_pkgname"
  cp -r dist/linux-unpacked/* "$pkgdir/usr/lib/$_pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/$_execname" "$pkgdir/usr/bin/$_execname"

  install -Dm644 "assets/neurokaraoke.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

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

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
