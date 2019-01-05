# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

# The source is over 8 GiB, with an extra 3 GiB of dependencies downloaded in build(), and may take several hours to compile.

# Allows enlargement of /tmp to fit Unreal.
# set enlargetmp to any value.

pkgname='unreal-engine'
install="$pkgname.install"
pkgver=4.21.1
# shellcheck disable=SC2034
{
  pkgrel=1
  pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
  arch=('x86_64')
  url='https://www.unrealengine.com/'
  makedepends=('clang' 'mono' 'dos2unix' 'cmake' 'git')
  depends=('icu' 'sdl2' 'python' 'lld')
  optdepends=('xdg-user-dirs: manage user directories in non-english language')
  license=('custom:UnrealEngine')

  source=(
    "git+ssh://git@github.com/EpicGames/UnrealEngine.git#tag=$pkgver-release"
    'UE4Editor.desktop'
    'ignore-return-value-error.patch'
    'only-generate-makefile.patch'
    'html5-build.patch'
    'recompile-version-selector.patch'
    'Makefile'
    'ignore-clang50-install.patch'
    'use-arch-mono.patch'
    'clang-70-support.patch'
    'CodeGenerator-move.patch'
    'UnrealSourceFile-move.patch'
    'Platform-bitwise-or.patch' 
    'no-pie.patch'
    'SBlueprintPalette.patch'
    'Player-move.patch'
    'UnrealExporter-move.patch'
    'NiagaraScriptViewModel-self-assign-fix.patch'
    'Messages-move.patch'
  )

sha256sums=('SKIP'
            '46871ed662a3c97698be609d27da280d9000ec97183f1fa6592986f9910a2118'
            '918dff809a7e815343a8d233f704f52a910b8f01a9cb3d29de541a0334fecc7c'
            'ab3e7981da6da4473717aef0bce9d550aacad02f9260f98d5b7a0bb3374a959a'
            '9fd6d16d56fbe0489a2580b86359df84b83a6987b5760a9e57ae0898f51943ac'
            '1dd876fa48c6fb4fcd4ccbdb8ed4ceccfa294685911e91be58bbc5e95726c279'
            '9654226ef3318389aa8fe15f3d4d14e7ac2113520ee5ebf2899d42273a2a6fb0'
            'eab5ba97327de2b8b17aea73ffd797a882fe0d1923ed2a8dc1709a8b00da63e4'
            '006bfc6dc6c4258b55768cac34a3c42f033a2777332272d8c47c340282bf400f'
            '3cee7cf7cb8c7b8fc65a423b4e51ea00c8b025784b21838e5def7c14fec60a0c'
            'babf3d0def1ae135f68c194124c7ba04f57de0bbe98c53304fabd2e434d1e99e'
            '6b6dad7218e8700abbdc74692079b7e9d2295a656fb05a99330d170abf689c0a'
            'be679f8b3b3085bd328e786d84c044f9d9eaa6315ab60d75447dfef5b6f4bd0b'
            '6ba1e4df6c5750db42db8a9731087ae9de8adcf242594d32c9ae162d9ad5c76c'
            '97119e06e91af6dfd54df07bdaea3dc342eb15177ce5c53f3746a8dd09a30768'
            '2557758219e0e8718652e102579d26a67f88ec45e61cc3457b2ebf0710bb036a'
            '83df14d25b75321f80c9132e72d99e7feafd294a78210f284101a5a8298aa38d'
            'a0abe52f6ffe9b85b934e85a7077121461fab56f615f1714bdbc12afce5b2e82'
            '2f872c76f998f4e04c1eb221d022848686537e087413bfc016028e1f406e2830')

  # Package is 3 Gib smaller with "strip" but it's skipped because it takes a long time and generates many warnings
  options=(strip staticlibs)
}

prepare() {
  export TERM=xterm
  # shellcheck disable=SC2154

  ue4src="$srcdir/UnrealEngine/Engine/Source"

  patch "$srcdir/UnrealEngine/Engine/Build/BatchFiles/Linux/Setup.sh" ignore-clang50-install.patch
  patch "$srcdir/UnrealEngine/Engine/Build/BatchFiles/Linux/SetupMono.sh" use-arch-mono.patch
  patch "$srcdir/UnrealEngine/Setup.sh" recompile-version-selector.patch

  patch "$ue4src/Runtime/Engine/Private/Player.cpp" Player-move.patch
  patch "$ue4src/Runtime/Engine/Private/UnrealExporter.cpp" UnrealExporter-move.patch

  plugins="$srcdir/UnrealEngine/Engine/Plugins"
  niagaraEditor="$plugins/FX/Niagara/Source/NiagaraEditor"
  patch "$niagaraEditor/Private/ViewModels/NiagaraScriptViewModel.cpp" NiagaraScriptViewModel-self-assign-fix.patch

  remoteSession="$plugins/Experimental/RemoteSession/Source/RemoteSession"
  patch "$remoteSession/Private/MessageHandler/Messages.h" Messages-move.patch


  kismet="$ue4src/Editor/Kismet/Private"
  patch "$kismet/SBlueprintPalette.cpp" SBlueprintPalette.patch

  uht="$ue4src/Programs/UnrealHeaderTool/Private"
  patch "$uht/CodeGenerator.cpp" CodeGenerator-move.patch
  patch "$uht/UnrealSourceFile.cpp" UnrealSourceFile-move.patch
  
  hal="$ue4src/Runtime/Core/Public/HAL"
  patch "$hal/Platform.h" Platform-bitwise-or.patch

  linuxToolChain="$ue4src/Programs/UnrealBuildTool/Platform/Linux/LinuxToolChain.cs"
  patch "$linuxToolChain" no-pie.patch
  patch "$linuxToolChain" ignore-return-value-error.patch
  patch "$linuxToolChain" clang-70-support.patch

  cp "$srcdir/Makefile" "$srcdir/UnrealEngine/Makefile"

  patch -p0 -i only-generate-makefile.patch
  # Source Code Accessors

  # CodeLite (Fully integrated)
  # cd $srcdir/UnrealEngine/Engine/Config/Linux && sed -i '10c\PreferredAccessor=CodeLiteSourceCodeAccessor' LinuxEngine.ini

  # Qt Creator
  # cd $srcdir/UnrealEngine/Engine/Plugins/Developer && git clone https://github.com/fire/QtCreatorSourceCodeAccess
  # cd $srcdir/UnrealEngine/Engine/Config/Linux && sed -i '10c\PreferredAccessor=QtCreatorSourceCodeAccessor' LinuxEngine.ini

  # VIM or EMACS
  # cd $srcdir/UnrealEngine/Engine/Plugins/Developer && git clone https://github.com/fire/SensibleEditorSourceCodeAccess
  # cd $srcdir/UnrealEngine/Engine/Config/Linux && sed -i '10c\PreferredAccessor=SensibleEditorSourceCodeAccessor' LinuxEngine.ini

  # shellcheck disable=SC2164
  cd "$srcdir/UnrealEngine"

  # clean up old builds before building a new version
  #git clean -xdf

  # TODO check if setup files already exist. Check if file edited recently
  echo "Running setup"
  ./Setup.sh

  patch "$ue4src/Programs/UnrealBuildTool/Platform/HTML5/HTML5SDKInfo.cs" "$srcdir/html5-build.patch"
  echo "generating project files"
  ./GenerateProjectFiles.sh
}

build() {
  # shellcheck disable=SC2164
  cd "$srcdir/UnrealEngine"

  # this should work instead of "git clean", but something leftover causes crashes
  #make ARGS=-clean

  # -j1 to force one  make job; the first time fails if there are multiple jobs
  make -j1
}

package() {
  # install dir
  dir="opt/$pkgname"

  # install .desktop
  if [ "$dir" != "opt/$pkgname" ] # set new path if dir changed
  then
    sed -i "5c\Path=/$dir/Engine/Binaries/Linux/" UE4Editor.desktop
    sed -i "6c\Exec=\'/$dir/Engine/Binaries/Linux/UE4Editor\' %F" UE4Editor.desktop
  fi
  # shellcheck disable=SC2154
  install -Dm644 UE4Editor.desktop "$pkgdir/usr/share/applications/UE4Editor.desktop"

  # shellcheck disable=SC2164
  cd "$srcdir/UnrealEngine"

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
