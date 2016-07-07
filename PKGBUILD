# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

# The source is about 3.78 GiB, with an extra 3.24 GiB of dependencies downloaded in build(), and may take several hours to compile. (sizes as of 4.12)

pkgname='unreal-engine'
pkgver=4.12.5
pkgrel=2
pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
arch=('x86_64')
url='https://www.unrealengine.com/'
makedepends=('clang' 'mono' 'dos2unix' 'cmake')
depends=('icu' 'xdg-user-dirs' 'sdl2' 'qt4' 'python')
license=('custom:UnrealEngine')
source=(
  "git+ssh://github.com/EpicGames/UnrealEngine.git#tag=$pkgver-release"
  'UE4Editor.desktop'
  '0001-ignore-return-value-error.patch'
)
md5sums=(
  'SKIP'
  'c7fc35a7eb9e23c0a9b7c593f7f9878d'
  '08e0e6b8e6c9b186191a8419cc7bd435'
)
options=(!strip staticlibs)

build() {
  patch "$srcdir/UnrealEngine/Engine/Source/Programs/UnrealBuildTool/Linux/LinuxToolChain.cs" 0001-ignore-return-value-error.patch

  cd $srcdir/UnrealEngine
  
  # help to clean up old builds when there is a new version
  # git clean -xdf

  ./Setup.sh
  ./GenerateProjectFiles.sh

  # this should work instead of "git clean", but something leftover causes crashes
  #make ARGS=-clean

  make
}

package() {
  install -Dm644 UE4Editor.desktop "$pkgdir/usr/share/applications/UE4Editor.desktop"

  cd $srcdir/UnrealEngine

  # license
  install -Dm644 LICENSE.pdf "$pkgdir/usr/share/licenses/UnrealEngine/LICENSE.pdf"

  # engine
  install -d "$pkgdir/opt/$pkgname/Engine"
  # these folders needs to be writable, otherwise there is a segmentation fault when starting the editor
  cp -r Engine/Binaries "$pkgdir/opt/$pkgname/Engine/Binaries"
  cp -r Engine/Build "$pkgdir/opt/$pkgname/Engine/Build"
  cp -r Engine/Config "$pkgdir/opt/$pkgname/Engine/Config"
  cp -r Engine/Content "$pkgdir/opt/$pkgname/Engine/Content"
  install -d "$pkgdir/opt/$pkgname/Engine/DerivedDataCache" # editor needs this
  cp -r Engine/Documentation "$pkgdir/opt/$pkgname/Engine/Documentation"
  cp -r Engine/Extras "$pkgdir/opt/$pkgname/Engine/Extras"
  install -d "$pkgdir/opt/$pkgname/Engine/Intermediate" # editor needs this, but not the files from the build
  cp -r Engine/Intermediate "$pkgdir/opt/$pkgname/Engine/Intermediate"
  cp -r Engine/Plugins "$pkgdir/opt/$pkgname/Engine/Plugins"
  cp -r Engine/Programs "$pkgdir/opt/$pkgname/Engine/Programs"
  cp -r Engine/Saved "$pkgdir/opt/$pkgname/Engine/Saved"
  cp -r Engine/Shaders "$pkgdir/opt/$pkgname/Engine/Shaders"
  cp -r Engine/Source "$pkgdir/opt/$pkgname/Engine/Source" # the source cannot be redistributed, but seems to be needed to compile c++ projects
  chmod -R a+rwX "$pkgdir/opt/$pkgname/Engine"

  # content
  cp -r FeaturePacks "$pkgdir/opt/$pkgname/FeaturePacks"
  cp -r Samples "$pkgdir/opt/$pkgname/Samples"
  cp -r Templates "$pkgdir/opt/$pkgname/Templates"

  # icon for .desktop file
  install -Dm644 Engine/Source/Programs/UnrealVS/Resources/Preview.png "$pkgdir/usr/share/pixmaps/UE4Editor.png"
}

# vim:set ts=2 sw=2 et:
