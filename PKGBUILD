# Maintainer: Dylan Ferris <dylan@psilly.com>
# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>
# Maintainer: Shatur95 <genaloner@gmail.com>

# The source is about 200 MiB, with an extra ~11 GiB of dependencies downloaded in Setup.sh, and may take several hours to compile.
# If you want to turn on additional patches there are switches below.
pkgname=unreal-engine
pkgver=4.26.2
pkgrel=5
pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
arch=(x86_64)
url=https://www.unrealengine.com/
makedepends=(git openssh)
depends=(icu sdl2 python lld xdg-user-dirs dos2unix)
optdepends=('qt5-base: qmake build system for projects'
            'cmake: build system for projects'
            'qtcreator: IDE for projects'
            'codelite: IDE for projects'
            'kdevelop: IDE for projects'
            'clion: IDE for projects')
license=(custom:UnrealEngine)
source=(com.unrealengine.UE4Editor.desktop
	ccache_executor.patch
	stop_mono_clone.patch)
sha256sums=('15e9f9d8dc8bd8513f6a5eca990e2aab21fd38724ad57d213b06a6610a951d58'
            '33982486f7fafac35a33dfa37c85cfba8543aa78b5fe13c395d9cccf691ef4b3'
            'aa9eb83c9f58c539d3cd43e919a4ebd6714c0aa2d32eb9b320049cf04dd01587')
options=(!strip staticlibs) # Package is 3 Gib smaller with "strip" but it takes a long time and generates many warnings

_ccache_support=false # Patches for ccache. More optimizations might be needed.
_system_mono=false # Uses System mono for unreal. Must set UE_USE_SYSTEM_MONO in your environment for it to work after install.

if [[ $_ccache_support == true ]]
then
  depends+=(ccache)
fi

if [[ $_system_mono == true ]]
then
  depends+=(mono mono-msbuild)
fi

prepare() {
  # Check access to the repository
  if ! git ls-remote git@github.com:EpicGames/UnrealEngine &>-
  then
    error 'You must register at unrealengine.com and link your github account to access this private repo. See the wiki for more info: https://wiki.archlinux.org/index.php/Unreal_Engine_4'
    exit 1
  fi

  # Download Unreal Engine source or update if the folder exists
  if [[ ! -d $pkgname ]]
  then
    git clone --depth=1 --branch=$pkgver-release git@github.com:EpicGames/UnrealEngine $pkgname
    cd $pkgname
  else
    cd $pkgname
    rm -f .git/index.lock
    git fetch --depth=1 origin tag $pkgver-release
    git reset --hard $pkgver-release
  fi

  # Apply custom patches
  if [[ $_system_mono == true ]]
  then
    export UE_USE_SYSTEM_MONO=1
    patch -p1 -i "$srcdir/stop_mono_clone.patch"
  fi
  if [[ $_ccache_support == true ]]
  then
    patch -p1 -i "$srcdir/ccache_executor.patch"
  fi

  # Qt Creator source code access
  if [[ ! -d Engine/Plugins/Developer/QtCreatorSourceCodeAccess ]]
  then
    git -C Engine/Plugins/Developer clone --depth=1 git@github.com:fire/QtCreatorSourceCodeAccess
  fi

  ./Setup.sh
}

build() {
  cd $pkgname
  Engine/Build/BatchFiles/RunUAT.sh BuildGraph -target="Make Installed Build Linux" -script=Engine/Build/InstalledEngineBuild.xml -set:WithDDC=false -set:HostPlatformOnly=true
}

package() {
  # Install dir
  dir="opt/$pkgname"

  # Desktop entry
  if [[ "$dir" != "opt/$pkgname" ]] # Set new path if dir changed
  then
    sed -i "5c\Path=/$dir/Engine/Binaries/Linux/" com.unrealengine.UE4Editor.desktop
    sed -i "6c\Exec=/$dir/Engine/Binaries/Linux/UE4Editor %F" com.unrealengine.UE4Editor.desktop
  fi
  install -Dm775 com.unrealengine.UE4Editor.desktop $pkgdir/usr/share/applications/com.unrealengine.UE4Editor.desktop
  
  cd $pkgname
  
  # Icon for Desktop entry
  install -Dm770 Engine/Source/Programs/UnrealVS/Resources/Preview.png $pkgdir/usr/share/pixmaps/ue4editor.png

  # License
  install -Dm770 LICENSE.md $pkgdir/usr/share/licenses/UnrealEngine/LICENSE.md
  
  # Engine
  install -dm770 "$pkgdir/$dir/Engine"
  mv LocalBuilds/Engine/Linux/* "$pkgdir/$dir"
}
