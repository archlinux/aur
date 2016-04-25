# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: fdev31@gmail.com
pkgname=instant-meshes
pkgver=git
pkgrel=5
pkgdesc="interactive retopology of .obj or .ply (point cloud) developed as part of SIGGRAPH ASIA 2015"
arch=("any")
url="http://igl.ethz.ch/projects/instant-meshes/"
license=('custom')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/wjakob/instant-meshes
_gitname=instant-meshes

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone --recursive "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  cmake .
  make -j 4
}

package() {
  cd "$srcdir/$_gitname-build"
  bin="Instant Meshes"
  install -TD -m 755 "$bin" "$pkgdir/usr/bin/$bin"
  install -TD -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -TD -m 644 resources/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/instant-meshes.png"
  cat > instant-meshes.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Instant-Meshes
Exec=Instant\ Meshes
Icon=default
Categories=Application;
Comment=Retopology Tool
EOF
  install -TD -m 644 instant-meshes.desktop "$pkgdir/usr/share/applications/instant-meshes.desktop"
}

# vim:set ts=2 sw=2 et:
