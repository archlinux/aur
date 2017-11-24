# Maintainer: Dylan Ferris <dylan@psilly.com>

# You must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

pkgname='unreal-tournament-4'
pkgver=r24883.3bf4b43c32
pkgrel=1
pkgdesc='A first-person shooter by Epic Games based on Unreal Engine 4.'
arch=('x86_64')
url='https://www.epicgames.com/unrealtournament/'
makedepends=('clang' 'mono' 'dos2unix' 'cmake' 'git')
depends=('icu' 'xdg-user-dirs' 'sdl2' 'qt4' 'python')
license=('custom:UnrealTournament')
source=(
  "git+ssh://git@github.com/EpicGames/UnrealTournament.git#tag=$pkgver"
  'UnrealTournament.desktop'
  'fix-clang-package-name.patch'
)
sha256sums=(
  'SKIP'
  'd0f041443a6c60ad9d1a7c1381b270df4b0576009f13328a4b024868b5387d7b'
  '255dc9e83d9e20d56ec44f8b7e9b587bdaa8a8c68a657952818aed1e808a29b3'
)
options=(!strip)

pkgver() {
  cd "$srcdir/UnrealTournament"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch "$srcdir/UnrealTournament/Engine/Build/BatchFiles/Linux/Setup.sh" fix-clang-package-name.patch

  cd "$srcdir/UnrealTournament"

  # clean up old builds before building a new version
  #git clean -xdf

  ./Setup.sh
  ./GenerateProjectFiles.sh
}

build() {
  cd "$srcdir/UnrealTournament"

  make -j1
}

package() {
  install -Dm644 UnrealTournament.desktop "$pkgdir/usr/share/applications/UnrealTournament.desktop"

  cd "$srcdir/UnrealTournament"

  # license
  install -Dm644 LICENSE.pdf "$pkgdir/usr/share/licenses/UnrealTournament/LICENSE.pdf"

  # copy the entire build dir
  # @todo only copy what is needed
  cp -r * "$pkgdir/opt/$pkgname/"

  # make the whole thing world writable
  # @todo find out what actually needs to writable
  chmod -R a+w "$pkgdir/opt/$pkgname/"

  # @todo refer to install info here: https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=ut4

  install -Dm644 Engine/Content/Editor/Slate/About/UE4Icon.png "$pkgdir/usr/share/pixmaps/UnrealTournament.png"
}

# vim:set ts=2 sw=2 et:
