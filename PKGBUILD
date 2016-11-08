# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

pkgname='ut4-git'
pkgver=r19168.c09ae43
pkgrel=1
pkgdesc='A first-person shooter by Epic Games based on Unreal Engine 4. (git latest)'
arch=('x86_64')
url='https://www.epicgames.com/unrealtournament/'
makedepends=('clang' 'mono' 'dos2unix' 'cmake')
depends=('icu' 'xdg-user-dirs' 'sdl2' 'qt4' 'python')
license=('custom:UnrealTournament')
source=(
  'ut4-git::git+https://github.com/EpicGames/UnrealTournament.git'
  'UnrealTournament.desktop'
)
md5sums=(
  'SKIP'
  '3789cf2924c76c6cfc583c9244f15289'
)
options=(!strip staticlibs)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  ./Setup.sh
  ./GenerateProjectFiles.sh
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
