# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

# The source is over 8 GiB, with an extra 3 GiB of dependencies downloaded in build(), and may take several hours to compile.

pkgname='unreal-engine'
pkgver=4.16.2
pkgrel=2
pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
arch=('x86_64')
url='https://www.unrealengine.com/'
makedepends=('clang' 'mono' 'dos2unix' 'cmake' 'git')
depends=('icu' 'xdg-user-dirs' 'sdl2' 'qt4' 'python')
license=('custom:UnrealEngine')

source=(
  "git+ssh://git@github.com/EpicGames/UnrealEngine.git#tag=$pkgver-release"
  'UE4Editor.desktop'
  'ignore-return-value-error.patch'
  'LMStats.patch'
  'disable-pie.patch'
)

sha256sums=(
  'SKIP'
  '46871ed662a3c97698be609d27da280d9000ec97183f1fa6592986f9910a2118'
  'd0a43ec1958790be11c3260d6b93c8fd29d9c7fd3c3f57574d5807b9390a95fa'
  '84730f07cc501b65e015b1ff5d860e596b40c43ad37101aeacb681cc95205a9c'
  '32ab20e37f5595eff73fb7ee7916ecae19a47f72875f448663941621d166c13b'
)

# Package is 3 Gib smaller without "strip" but it's skipped because it takes a long time and generates many warnings
options=(!strip)

prepare() {
  patch "$srcdir/UnrealEngine/Engine/Source/Programs/UnrealBuildTool/Linux/LinuxToolChain.cs" ignore-return-value-error.patch
  patch "$srcdir/UnrealEngine/Engine/Source/Programs/UnrealLightmass/Private/LightmassCore/Misc/LMStats.h" LMStats.patch
  patch "$srcdir/UnrealEngine/Engine/Source/Programs/UnrealBuildTool/Linux/LinuxToolChain.cs" disable-pie.patch

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

  # -j1 to force one  make job; the first time fails if there are multiple jobs
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
