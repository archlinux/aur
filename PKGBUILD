# Maintainer: jtmb <packaging at technologicalwizardry dot com>
_pkgname=pkhex
pkgname=${_pkgname}-git
pkgver=r3745.69cf1eaa
pkgrel=1
pkgdesc="Pokémon core series save editor, programmed in C#."
arch=(any)
url="https://github.com/kwsch/PKHeX"
license=('GPL')
depends=(mono)
makedepends=(monodevelop-stable msbuild-15-bin)
options=('!strip')
source=("${pkgname}::git+https://github.com/kwsch/PKHeX#branch=master"
		"PKHeX.sh")
md5sums=('SKIP'
         'SKIP')



pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  msbuild PKHeX.sln /t:restore /t:build /p:Configuration=Mono-Release
  
}

package() {

  install -Dm755 -- PKHeX.sh "$pkgdir/usr/bin/PKHeX"
  cd "$pkgname"

  install -Dm755 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.exe "$pkgdir/opt/${_pkgname}/PKHeX.exe"
  install -Dm644 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.exe.config "$pkgdir/opt/${_pkgname}/PKHeX.exe.config"
  install -Dm755 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.Core.dll "$pkgdir/opt/${_pkgname}/PKHeX.Core.dll"
  install -Dm644 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.Core.dll.config "$pkgdir/opt/${_pkgname}/PKHeX.Core.dll.config"
  mkdir -p -- "$pkgdir/opt/${_pkgname}/bak"
  mkdir -p -- "$pkgdir/opt/${_pkgname}/pkmdb"
  chmod 757 -- "$pkgdir/opt/${_pkgname}/bak"
  chmod 757 -- "$pkgdir/opt/${_pkgname}/pkmdb"
  
}

