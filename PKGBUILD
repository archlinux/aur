# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

# The source is over 8 GiB, with an extra 3 GiB of dependencies downloaded in build(), and may take several hours to compile.

# Allows enlargement of /tmp to fit Unreal.
# set enlargetmp to any value.

pkgname='unreal-engine'
install="$pkgname.install"
pkgver=4.21.2
# shellcheck disable=SC2034
{
  pkgrel=1
  pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
  arch=('x86_64')
  url='https://www.unrealengine.com/'
  makedepends=('clang' 'mono' 'dos2unix' 'cmake' 'git')
  depends=('icu' 'sdl2' 'python' 'lld' 'xdg-user-dirs')
  license=('custom:UnrealEngine')

  source=(
    "git+ssh://git@github.com/EpicGames/UnrealEngine.git#tag=$pkgver-release"
    'UE4Editor.desktop'
    'html5-build.patch'
    'recompile-version-selector.patch'
    'Makefile'
    'ignore-clang50-install.patch'
    'use-arch-mono.patch'
    'clang-70-support.patch'
  )

sha256sums=('SKIP'
            '46871ed662a3c97698be609d27da280d9000ec97183f1fa6592986f9910a2118'
            '9fd6d16d56fbe0489a2580b86359df84b83a6987b5760a9e57ae0898f51943ac'
            '1dd876fa48c6fb4fcd4ccbdb8ed4ceccfa294685911e91be58bbc5e95726c279'
            '9654226ef3318389aa8fe15f3d4d14e7ac2113520ee5ebf2899d42273a2a6fb0'
            '71a7304deebb00234c323eed9a73cdbd022099ba65f62fc90e78069eceed1f5d'
            '006bfc6dc6c4258b55768cac34a3c42f033a2777332272d8c47c340282bf400f'
            'deb74af4561beb2eb62fdc3bee45347785b9bd07443939ad0bf0f1fd9f72a859')

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

  pushd "$srcdir/UnrealEngine" > /dev/null
  patch -p1 -i ../clang-70-support.patch 
  popd > /dev/null

  cp "$srcdir/Makefile" "$srcdir/UnrealEngine/Makefile"

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
  ./GenerateProjectFiles.sh -makefile
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
