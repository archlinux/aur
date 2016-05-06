# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# For more info, see: https://wiki.archlinux.org/index.php/Unreal_Engine_4

pkgname='unreal-tournament-4'
pkgver=2532759
pkgrel=1
pkgdesc='A first-person shooter by Epic Games based on Unreal Engine 4.'
arch=('x86_64')
url='https://www.epicgames.com/unrealtournament/'
makedepends=('clang35' 'mono' 'dos2unix' 'cmake' 'lsb-release')
depends=('icu53' 'xdg-user-dirs')
license=('custom:UnrealTournament')
source=(
  git+ssh://github.com/EpicGames/UnrealTournament.git#tag=$pkgver
  UnrealTournament.desktop
)
md5sums=(
  SKIP
  '24b13aa960b3d5ae1275c847edc8455a'
)
options=(!strip staticlibs)

build() {
  cd $srcdir/UnrealTournament

  ./Setup.sh

  # Seems the Linux Setup.sh is missing from the main Setup.sh
  # This is from UnrealEngine's but causes build() to fail for some reason, although it works when running manually
  pushd Engine/Build/BatchFiles/Linux > /dev/null
  #./Setup.sh "$@"
  popd > /dev/null

  ./GenerateProjectFiles.sh

  make UE4Game-Linux-Shipping UnrealPak CrashReportClient ShaderCompileWorker UnrealLightmass
  make -j1 ShaderCompileWorker
}

package() {
  install -Dm644 UnrealTournament.desktop "$pkgdir/usr/share/applications/UnrealTournament.desktop"

  cd $srcdir/UnrealTournament

  install -Dm644 LICENSE.pdf "$pkgdir/usr/share/licenses/UnrealTournament/LICENSE.pdf"

  install -d "$pkgdir/opt/$pkgname"

  # copy the entire build dir
  # @todo only copy what is needed
  cp -r * "$pkgdir/opt/$pkgname/"

  # make the whole thing world writable, otherwise there is a segmentation fault when starting the editor
  # @todo find out what specifically needs to writable
  chmod -R a+w "$pkgdir/opt/$pkgname/"

  # @todo refer to install info here: https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=ut4

  install -Dm644 Engine/Content/Editor/Slate/About/UE4Icon.png "$pkgdir/usr/share/pixmaps/UnrealTournament.png"
}

# vim:set ts=2 sw=2 et:
