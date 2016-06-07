# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

# The source is about 3.8 GiB, with an extra 3.2 GiB of dependencies downloaded in build(), and may take several hours to compile.

pkgname='unreal-engine'
pkgver=4.12.1
pkgrel=1
pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
arch=('x86_64')
url='https://www.unrealengine.com/'
makedepends=('clang' 'mono' 'dos2unix' 'cmake')
depends=('icu' 'xdg-user-dirs' 'sdl2' 'qt4' 'python')
license=('custom:UnrealEngine')
source=(
  "git+ssh://github.com/EpicGames/UnrealEngine.git#tag=$pkgver-release"
  'UE4Editor.desktop'
)
md5sums=(
  'SKIP'
  '7a2db62e8d0e8e6f26424768c412d356'
)
options=(!strip staticlibs)

build() {
  cd $srcdir/UnrealEngine
  #./Setup.sh
  #./GenerateProjectFiles.sh
  #make
}

package() {
  install -Dm644 UE4Editor.desktop "$pkgdir/usr/share/applications/UE4Editor.desktop"

  cd $srcdir/UnrealEngine

  install -Dm644 LICENSE.pdf "$pkgdir/usr/share/licenses/UnrealEngine/LICENSE.pdf"

  install -d "$pkgdir/opt/$pkgname"
  
  install -d - "$pkgdir/opt/$pkgname"

  # copy the entire build dir, ~22 GiB
  # @todo only copy what is needed
  cp -r * "$pkgdir/opt/$pkgname/"

  # these folders needs to be writable, otherwise there is a segmentation fault when starting the editor
  chmod -R a+w "$pkgdir/opt/$pkgname/"

  install -Dm644 Engine/Source/Programs/UnrealVS/Resources/Preview.png "$pkgdir/usr/share/pixmaps/UE4Editor.png"
}

# vim:set ts=2 sw=2 et:
