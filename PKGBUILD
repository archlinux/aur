# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

pkgname='unreal-tournament-4'
pkgver=2532759
pkgrel=1
pkgdesc='A first-person shooter by Epic Games based on Unreal Engine 4.'
arch=('x86_64')
url='https://www.epicgames.com/unrealtournament/'
makedepends=('clang' 'mono' 'dos2unix' 'cmake')
depends=('icu' 'xdg-user-dirs' 'sdl2' 'qt4' 'python')
license=('custom:UnrealTournament')
source=(
  "git+ssh://github.com/EpicGames/UnrealTournament.git#tag=$pkgver"
  'UnrealTournament.desktop'
)
md5sums=(
  'SKIP'
  '4ab9fb5f8c4b6c6c3fdb8d2e79399b9e'
)
options=(!strip staticlibs)

build() {
  cd $srcdir/UnrealTournament

  ./Setup.sh
  ./GenerateProjectFiles.sh

  # Seems the Linux Setup.sh is missing from the main Setup.sh
  # This is from UnrealEngine's but causes build() to fail for some reason, although it works when running manually
  pushd Engine/Build/BatchFiles/Linux > /dev/null
  #./Setup.sh "$@"
  popd > /dev/null

  make
}

package() {
  install -Dm644 UnrealTournament.desktop "$pkgdir/usr/share/applications/UnrealTournament.desktop"

  cd $srcdir/UnrealTournament

  # license
  install -Dm644 LICENSE.pdf "$pkgdir/usr/share/licenses/UnrealTournament/LICENSE.pdf"

  # copy the entire build dir
  # @todo only copy what is needed
  cp -r * "$pkgdir/opt/$pkgname/"

  # make the whole thing world writable
  # @todo find out what specifically needs to writable
  chmod -R a+w "$pkgdir/opt/$pkgname/"

  # @todo refer to install info here: https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=ut4

  install -Dm644 Engine/Content/Editor/Slate/About/UE4Icon.png "$pkgdir/usr/share/pixmaps/UnrealTournament.png"
}

# vim:set ts=2 sw=2 et:
