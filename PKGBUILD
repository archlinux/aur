# Maintainer: PerilousBooklet <raffaele.orabona at protonmail dot com> 
# Contributor: dalz <aur @t alsd d0t eu>
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot-voxel
pkgver=4.1
pkgrel=1
pkgdesc="The Godot game engine with Zylann's voxel tools module"
url="https://voxel-tools.readthedocs.io/en/latest/"
license=('MIT')
arch=('x86_64')
makedepends=('scons' 'gcc')
depends=('pkgconf' 'libxcursor' 'libxinerama' 'libxi' 'libxrandr' 'mesa' 'glu' 'libglvnd' 'alsa-lib' 'pulseaudio')
source=("git+https://github.com/godotengine/godot.git"
        "git+https://github.com/Zylann/godot_voxel.git")
sha256sums=()

prepare() {
  # Create the package folder
  mkdir -vp $srcdir/$pkgname/ 

  # Clone the master branch of the Godot repository
  git clone https://github.com/godotengine/godot.git $srcdir/$pkgname
  
  # Add the master branch of Zylann's godot_voxel repository to the Godot repository
  git submodule add https://github.com/Zylann/godot_voxel.git $srcdir/$pkgname/modules/voxel
}

build() {
  cd $srcdir/$pkgname/
  
  # Build the project
  scons platform=linuxbsd colored=yes
}

package() {
  cd $srcdir
  
  # ?
  install -Dm644 $srcdir/$pkgname/godot-voxel.desktop $pkgdir/usr/share/applications/godot-voxel.desktop
  install -Dm644 $srcdir/godot-voxel/icon.svg $pkgdir/usr/share/pixmaps/godot-voxel.svg

  cd $srcdir/$pkgname
  
  # ?
  install -D -m755 $srcdir/bin/godot.linuxbsd.editor.x86_64 $pkgdir/usr/bin/godot-voxel
  install -D -m644 $srcdir/$pkgname/LICENSE.txt $pkgdir/usr/share/licenses/godot-voxel/LICENSE
  install -D -m644 $srcdir/$pkgname/misc/dist/linux/godot.6 $pkgdir/usr/share/man/man6/godot-voxel.6
}

