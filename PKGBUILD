# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

# The source is over 8 GiB, with an extra 3 GiB of dependencies downloaded in build(), and may take several hours to compile.

pkgname='unreal-engine'
pkgver=4.17.1
pkgrel=1
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
  'disable-pie.patch'
)

sha256sums=(
  'SKIP'
  '46871ed662a3c97698be609d27da280d9000ec97183f1fa6592986f9910a2118'
  'd0a43ec1958790be11c3260d6b93c8fd29d9c7fd3c3f57574d5807b9390a95fa'
  '32ab20e37f5595eff73fb7ee7916ecae19a47f72875f448663941621d166c13b'
)

# Package is 3 Gib smaller with "strip" but it's skipped because it takes a long time and generates many warnings
options=(!strip)

prepare() {
  patch "$srcdir/UnrealEngine/Engine/Source/Programs/UnrealBuildTool/Linux/LinuxToolChain.cs" ignore-return-value-error.patch
  patch "$srcdir/UnrealEngine/Engine/Source/Programs/UnrealBuildTool/Linux/LinuxToolChain.cs" disable-pie.patch

  # Source Code Accessors

  # CodeLite (Fully integrated)
  # cd $srcdir/UnrealEngine/Engine/Config/Linux && sed -i '10c\PreferredAccessor=CodeLiteSourceCodeAccessor' LinuxEngine.ini

  # Qt Creator
  # cd $srcdir/UnrealEngine/Engine/Plugins/Developer && git clone https://github.com/fire/QtCreatorSourceCodeAccess
  # cd $srcdir/UnrealEngine/Engine/Config/Linux && sed -i '10c\PreferredAccessor=QtCreatorSourceCodeAccessor' LinuxEngine.ini

  # VIM or EMACS
  # cd $srcdir/UnrealEngine/Engine/Plugins/Developer && git clone https://github.com/fire/SensibleEditorSourceCodeAccess
  # cd $srcdir/UnrealEngine/Engine/Config/Linux && sed -i '10c\PreferredAccessor=SensibleEditorSourceCodeAccessor' LinuxEngine.ini

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
  # install dir
  dir='opt/$pkgname'

  # install .desktop
  if [ "$dir" != 'opt/$pkgname' ] # set new path if dir changed
  then
    sed -i "5c\Path=/$dir/Engine/Binaries/Linux/" UE4Editor.desktop
    sed -i "6c\Exec=\'/$dir/Engine/Binaries/Linux/UE4Editor\' %F" UE4Editor.desktop
  fi
  install -Dm644 UE4Editor.desktop "$pkgdir/usr/share/applications/UE4Editor.desktop"

  cd $srcdir/UnrealEngine

  # license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/UnrealEngine/LICENSE.md"

  # fix "could not chmod +x" warning when compiling c++ project
  chmod a+x Engine/Binaries/DotNET/IOS/IPhonePackager.exe

  # icon for .desktop file
  install -Dm644 Engine/Source/Programs/UnrealVS/Resources/Preview.png "$pkgdir/usr/share/pixmaps/UE4Editor.png"

  # engine
  install -d "$pkgdir/$dir/Engine"
  mv Engine/Binaries "$pkgdir/$dir/Engine/Binaries"
  mv Engine/Build "$pkgdir/$dir/Engine/Build"
  mv Engine/Config "$pkgdir/$dir/Engine/Config"
  mv Engine/Content "$pkgdir/$dir/Engine/Content"
  install -d "$pkgdir/$dir/Engine/DerivedDataCache" # editor needs this
  mv Engine/Documentation "$pkgdir/$dir/Engine/Documentation"
  mv Engine/Extras "$pkgdir/$dir/Engine/Extras"
  install -d "$pkgdir/$dir/Engine/Intermediate" # editor needs this, but not the contents
  mv Engine/Plugins "$pkgdir/$dir/Engine/Plugins"
  mv Engine/Programs "$pkgdir/$dir/Engine/Programs"
  mv Engine/Saved "$pkgdir/$dir/Engine/Saved"
  mv Engine/Shaders "$pkgdir/$dir/Engine/Shaders"
  mv Engine/Source "$pkgdir/$dir/Engine/Source" # the source cannot be redistributed, but seems to be needed to compile c++ projects

  # these folders needs to be writable, otherwise there is a segmentation fault when starting the editor
  chmod -R a+rwX "$pkgdir/$dir/Engine"

  # content
  mv FeaturePacks "$pkgdir/$dir/FeaturePacks"
  mv Samples "$pkgdir/$dir/Samples"
  mv Templates "$pkgdir/$dir/Templates"

  # build scripts, used by some plugins (CLion)
  install -Dm755 GenerateProjectFiles.sh "$pkgdir/$dir/GenerateProjectFiles.sh"
  install -Dm755 Setup.sh "$pkgdir/$dir/Setup.sh"
  install -Dm644 .ue4dependencies "$pkgdir/$dir/.ue4dependencies"
}

# vim:set ts=2 sw=2 et:
