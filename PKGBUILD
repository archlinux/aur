# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

# The source is about 3.78 GiB, with an extra 3.24 GiB of dependencies downloaded in build(), and may take several hours to compile. (sizes as of 4.12.1)

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
#  ./Setup.sh
#  ./GenerateProjectFiles.sh
#  make
}

package() {
  install -Dm644 UE4Editor.desktop "$pkgdir/usr/share/applications/UE4Editor.desktop"

  cd $srcdir/UnrealEngine

  # license
  install -Dm644 LICENSE.pdf "$pkgdir/usr/share/licenses/UnrealEngine/LICENSE.pdf"

  # engine
  install -d "$pkgdir/opt/$pkgname/Engine"
  # these folders needs to be writable, otherwise there is a segmentation fault when starting the editor
  # @todo probably not all these folders need to be writable and/or installed, and maybe some should be moved to user's home
  cp -r Engine/Binaries "$pkgdir/opt/$pkgname/Engine/Binaries"
  cp -r Engine/Build "$pkgdir/opt/$pkgname/Engine/Build"
  cp -r Engine/Config "$pkgdir/opt/$pkgname/Engine/Config"
  cp -r Engine/Content "$pkgdir/opt/$pkgname/Engine/Content"
  install -d "$pkgdir/opt/$pkgname/Engine/DerivedDataCache" # created when UE4Editor is run
  cp -r Engine/Documentation "$pkgdir/opt/$pkgname/Engine/Documentation"
  cp -r Engine/Extras "$pkgdir/opt/$pkgname/Engine/Extras"
  install -d "$pkgdir/opt/$pkgname/Engine/Intermediate" # create without contents
  cp -r Engine/Plugins "$pkgdir/opt/$pkgname/Engine/Plugins"
  cp -r Engine/Programs "$pkgdir/opt/$pkgname/Engine/Programs"
  cp -r Engine/Saved "$pkgdir/opt/$pkgname/Engine/Saved"
  cp -r Engine/Shaders "$pkgdir/opt/$pkgname/Engine/Shaders"
  install -d "$pkgdir/opt/$pkgname/Engine/Source" # create without contents
  chmod -R a+rwX "$pkgdir/opt/$pkgname/Engine"

  # content
  cp -r FeaturePacks "$pkgdir/opt/$pkgname/FeaturePacks"
  cp -r Samples "$pkgdir/opt/$pkgname/Samples"
  cp -r Templates "$pkgdir/opt/$pkgname/Templates"

  # icon for .desktop file
  install -Dm644 Engine/Source/Programs/UnrealVS/Resources/Preview.png "$pkgdir/usr/share/pixmaps/UE4Editor.png"
}

# vim:set ts=2 sw=2 et:
