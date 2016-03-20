pkgname=atomic-game-engine-git
provides=(atomic-game-engine)
conflicts=(atomic-game-engine)

pkgdesc='A cross platform authoring solution with deployment to Windows, OSX, Android, iOS, Linux, and WebGL'
url=http://atomicgameengine.com/
license=(MIT)

pkgver=r1839.e8ab6b0
pkgrel=2

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
  _dest="/opt/AtomicEditor"
  _cef="$_dest/CEF"
  _bindir=/usr/bin
  _bin="$_bindir/atomic-editor"

  install -Dm644 "$_name/Resources/CoreData/Images/AtomicLogo32.png" "$pkgdir/usr/share/pixmaps/$_name.png"

  install -d "$pkgdir/$_bindir"
  cat > "$pkgdir/$_bin" <<EOF
#!/bin/sh
LD_PRELOAD="$_cef/libcef.so" "$_dest/AtomicEditor"
EOF
  chmod +x "$pkgdir/$_bin"

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

  install -Dm644 "$_name/Submodules/CEF/Linux/Release/libcef.so" "$pkgdir/$_cef/libcef.so"
  cp -r "$_name/Submodules/CEF/Linux/Release//"* "$pkgdir/$_cef"
  cp -r "$_name/Artifacts/AtomicEditor/"* "$pkgdir/$_dest"
}
