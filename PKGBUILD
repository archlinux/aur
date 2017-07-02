# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

# The source is over 8 GiB, with an extra 3 GiB of dependencies downloaded in build(), and may take several hours to compile.

pkgname='unreal-engine'
pkgver=4.16.2
pkgrel=1
pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
arch=('x86_64')
url='https://www.unrealengine.com/'
makedepends=('clang' 'mono' 'dos2unix' 'cmake' 'git')
depends=('icu' 'xdg-user-dirs' 'sdl2' 'qt4' 'python')
conflicts=('hardening-wrapper')
license=('custom:UnrealEngine')

source=(
  "git+ssh://git@github.com/EpicGames/UnrealEngine.git#tag=$pkgver-release"
  'UE4Editor.desktop'
  'ignore-return-value-error.patch'
  'LMStats.patch'
)

md5sums=(
  'SKIP'
  'c7fc35a7eb9e23c0a9b7c593f7f9878d'
  'f1a95777bea1abc3f4731d9f0f68b610'
  'abe70f602445e9465c1eff2769bc7d61'
)

prepare() {
  patch "$srcdir/UnrealEngine/Engine/Source/Programs/UnrealBuildTool/Linux/LinuxToolChain.cs" ignore-return-value-error.patch
  patch "$srcdir/UnrealEngine/Engine/Source/Programs/UnrealLightmass/Private/LightmassCore/Misc/LMStats.h" LMStats.patch

  cd $srcdir/UnrealEngine

  # clean up old builds before building a new version
  #git clean -xdf

  ./Setup.sh
  ./GenerateProjectFiles.sh
}

build() {

  cd $srcdir/UnrealEngine

  # this should work instead of "git clean", but something leftover causes crashes
  #make ARGS=-clean

  # first build fails with more than one process
  make -j1

}

package() {
  install -Dm644 UE4Editor.desktop "$pkgdir/usr/share/applications/UE4Editor.desktop"

  cd $srcdir/UnrealEngine

  # license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/UnrealEngine/LICENSE.md"

  # engine
  install -d "$pkgdir/opt/$pkgname/Engine"
  cp -r Engine/Binaries "$pkgdir/opt/$pkgname/Engine/Binaries"
  cp -r Engine/Build "$pkgdir/opt/$pkgname/Engine/Build"
  cp -r Engine/Config "$pkgdir/opt/$pkgname/Engine/Config"
  cp -r Engine/Content "$pkgdir/opt/$pkgname/Engine/Content"
  install -d "$pkgdir/opt/$pkgname/Engine/DerivedDataCache" # editor needs this
  cp -r Engine/Documentation "$pkgdir/opt/$pkgname/Engine/Documentation"
  cp -r Engine/Extras "$pkgdir/opt/$pkgname/Engine/Extras"
  install -d "$pkgdir/opt/$pkgname/Engine/Intermediate" # editor needs this, but not the contents
  cp -r Engine/Plugins "$pkgdir/opt/$pkgname/Engine/Plugins"
  cp -r Engine/Programs "$pkgdir/opt/$pkgname/Engine/Programs"
  cp -r Engine/Saved "$pkgdir/opt/$pkgname/Engine/Saved"
  cp -r Engine/Shaders "$pkgdir/opt/$pkgname/Engine/Shaders"
  cp -r Engine/Source "$pkgdir/opt/$pkgname/Engine/Source" # the source cannot be redistributed, but seems to be needed to compile c++ projects

  # these folders needs to be writable, otherwise there is a segmentation fault when starting the editor
  chmod -R a+rwX "$pkgdir/opt/$pkgname/Engine"

  # fix "could not chmod +x" warning when compiling c++ project
  chmod a+x Engine/Binaries/DotNET/IOS/IPhonePackager.exe

  # content
  cp -r FeaturePacks "$pkgdir/opt/$pkgname/FeaturePacks"
  cp -r Samples "$pkgdir/opt/$pkgname/Samples"
  cp -r Templates "$pkgdir/opt/$pkgname/Templates"

  # build scripts, used by some plugins (CLion)
  install -Dm755 GenerateProjectFiles.sh "$pkgdir/opt/$pkgname/GenerateProjectFiles.sh"
  install -Dm755 Setup.sh "$pkgdir/opt/$pkgname/Setup.sh"
  install -Dm644 .ue4dependencies "$pkgdir/opt/$pkgname/.ue4dependencies"

  # icon for .desktop file
  install -Dm644 Engine/Source/Programs/UnrealVS/Resources/Preview.png "$pkgdir/usr/share/pixmaps/UE4Editor.png"
}

# vim:set ts=2 sw=2 et:
