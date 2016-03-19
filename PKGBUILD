pkgname=atomic-game-engine-git
provides=(atomic-game-engine)
conflicts=(atomic-game-engine)

pkgdesc='A cross platform authoring solution with deployment to Windows, OSX, Android, iOS, Linux, and WebGL'
url=http://atomicgameengine.com/
license=(MIT)

pkgver=r1839.e8ab6b0
pkgrel=1

arch=(i686 x86_64)
_name=AtomicGameEngine
source=("git+https://github.com/AtomicGameEngine/$_name.git")
md5sums=(SKIP)

makedepends=(cmake nodejs git)
depends=(gtk3 alsa-lib libxrandr libgl glu)

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_name"
  ./Build_AtomicEditor.sh 
}

package() {
  _bin="/usr/bin/AtomicEditor"
  _dest="/opt/AtomicEditor"

  install -Dm644 "$_name/Resources/CoreData/Images/AtomicLogo32.png" "$pkgdir/usr/share/pixmaps/$_name.png"

  install -d "$pkgdir/usr/bin"
  ln -s "$_dest/AtomicEditor" "$pkgdir/$_bin"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$_name.desktop" <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Atopic Game Engine
Comment=$pkgdesc
Path=$_dest
Exec=$_bin
Icon=$_name
Terminal=false
Categories=Development;Building;IDE;Game;
EOF

  install -d "$pkgdir/$_dest"
  cp -r "$_name/Artifacts/AtomicEditor/"* "$pkgdir/$_dest"
}
