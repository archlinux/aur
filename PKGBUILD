# Maintainer: Dylan Ferris <dylan@psilly.com>
# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>
# Maintainer: Shatur95 <genaloner@gmail.com>

# The source is about 200 MiB, with an extra ~11 GiB of dependencies downloaded in Setup.sh, and may take several hours to compile.
pkgname='unreal-engine'
pkgver=4.24.1
pkgrel=4
pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
arch=('x86_64')
url='https://www.unrealengine.com/'
makedepends=('mono' 'dos2unix' 'git')
depends=('icu' 'sdl2' 'python' 'lld' 'xdg-user-dirs')
optdepends=('qt5-base: qmake build system for projects'
            'cmake: build system for projects'
            'qtcreator: IDE for projects'
            'codelite: IDE for projects'
            'kdevelop: IDE for projects'
            'clion: IDE for projects')
license=('custom:UnrealEngine')
source=('com.unrealengine.UE4Editor.desktop'
        'use-arch-mono.patch')
sha256sums=('fa4bd19ab53e91cc8b4ae6208452a7fe986a08047617213d6250b43e7a140bf3'
            '90a112f72a498f50dafad4feeaf7c551fe4e19830610bcef634f8e23d3d283b3')
options=(strip staticlibs) # Package is 3 Gib smaller with "strip" but it takes a long time and generates many warnings

prepare() {
  # Check access to the repository
  if ! git ls-remote git@github.com:EpicGames/UnrealEngine &>-
  then
    error "You must register at unrealengine.com and link your github account to access this private repo. See the wiki for more info: https://wiki.archlinux.org/index.php/Unreal_Engine_4"
    exit 1
  fi

  # Download Unreal Engine source or update if the folder exists
  if [ ! -d $pkgname ]
  then
    git clone --depth=1 --branch=$pkgver-release git@github.com:EpicGames/UnrealEngine $pkgname
    cd $pkgname
  else
    cd $pkgname
    rm -f .git/index.lock
    git fetch --depth=1 origin tag $pkgver-release
    git reset --hard $pkgver-release
  fi
  
  patch Engine/Build/BatchFiles/Linux/SetupMono.sh $srcdir/use-arch-mono.patch # Use system mono
  
  # Qt Creator source code access
  if [ ! -d Engine/Plugins/Developer/QtCreatorSourceCodeAccess ]
  then
    git -C Engine/Plugins/Developer clone --depth=1 git@github.com:fire/QtCreatorSourceCodeAccess
  fi

  export TERM=xterm
  ./Setup.sh
  ./GenerateProjectFiles.sh -makefile
}

build() {
  cd $pkgname
  
  # Build all targets from the "all" rule separately, because building multiple targets in parallel results in an error (but building one target with multiple threads is possible)
  make CrashReportClient-Linux-Shipping
  make CrashReportClientEditor-Linux-Shipping
  make ShaderCompileWorker
  make UnrealLightmass
  make UnrealFrontend
  make UE4Editor
  make UnrealInsights
}

package() {
  # Install dir
  dir="opt/$pkgname"

  # Desktop entry
  if [ "$dir" != "opt/$pkgname" ] # Set new path if dir changed
  then
    sed -i "5c\Path=/$dir/Engine/Binaries/Linux/" com.unrealengine.UE4Editor.desktop
  fi
  install -Dm644 com.unrealengine.UE4Editor.desktop $pkgdir/usr/share/applications/com.unrealengine.UE4Editor.desktop
  
  cd $pkgname
  
  # Icon for Desktop entry
  install -Dm644 Engine/Source/Programs/UnrealVS/Resources/Preview.png $pkgdir/usr/share/pixmaps/ue4editor.png

  # License
  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/UnrealEngine/LICENSE.md
  
  # Engine
  install -d "$pkgdir/$dir/Engine"
  mv Engine/Binaries "$pkgdir/$dir/Engine/Binaries"
  mv Engine/Build "$pkgdir/$dir/Engine/Build"
  mv Engine/Config "$pkgdir/$dir/Engine/Config"
  mv Engine/Content "$pkgdir/$dir/Engine/Content"
  mv Engine/Documentation "$pkgdir/$dir/Engine/Documentation"
  mv Engine/Extras "$pkgdir/$dir/Engine/Extras"
  mv Engine/Plugins "$pkgdir/$dir/Engine/Plugins"
  mv Engine/Programs "$pkgdir/$dir/Engine/Programs"
  mv Engine/Shaders "$pkgdir/$dir/Engine/Shaders"
  mv Engine/Source "$pkgdir/$dir/Engine/Source"
  
  # Required folders
  install -d "$pkgdir/$dir/Engine/DerivedDataCache"
  install -d "$pkgdir/$dir/Engine/Intermediate"
  install -d "$pkgdir/$dir/Engine/Saved"
  
  # Content
  mv FeaturePacks "$pkgdir/$dir/FeaturePacks"
  mv Samples "$pkgdir/$dir/Samples"
  mv Templates "$pkgdir/$dir/Templates"

  # Build scripts, used by some plugins (CLion)
  install -Dm755 GenerateProjectFiles.sh "$pkgdir/$dir/GenerateProjectFiles.sh"
  install -Dm755 Setup.sh "$pkgdir/$dir/Setup.sh"
  install -Dm644 .ue4dependencies "$pkgdir/$dir/.ue4dependencies"
}
