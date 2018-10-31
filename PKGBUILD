# Maintainer: jtmb <packaging at technologicalwizardry dot com>
_pkgname=pkhex
pkgname=${_pkgname}-git
pkgver=r5246.7a021781
pkgrel=1
pkgdesc="Pokémon core series save editor, programmed in C#."
arch=(any)
url="https://github.com/kwsch/PKHeX"
license=('GPL')
depends=(mono)
makedepends=(git msbuild-stable)
provides=(pkhex)
conflicts=(pkhex)
options=('!strip')
source=("${pkgname}::git+https://github.com/kwsch/PKHeX#branch=master"
		"PKHeX.sh"
		"pkhex.desktop"
		"pkhex.png")
md5sums=('SKIP'
         '8bd71d319e130750a39f15d56b5636e1'
         'bb570ade3acf94f25d43cfa69db17c2f'
         'ceb97fc5efcf4548ca4572b5116f5875')


pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  msbuild PKHeX.sln /t:restore /t:build /p:Configuration=Mono-Release
  
}

package() {

  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 -- PKHeX.sh "$pkgdir/usr/bin/PKHeX"
  cd "$pkgname"

  install -Dm755 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.exe "$pkgdir/opt/${_pkgname}/PKHeX.exe"
  install -Dm644 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.exe.config "$pkgdir/opt/${_pkgname}/PKHeX.exe.config"
  install -Dm755 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.Core.dll "$pkgdir/opt/${_pkgname}/PKHeX.Core.dll"
  install -Dm644 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.Core.dll.config "$pkgdir/opt/${_pkgname}/PKHeX.Core.dll.config"
  mkdir -p -- "$pkgdir/opt/${_pkgname}/bak"
  mkdir -p -- "$pkgdir/opt/${_pkgname}/pkmdb"
  chmod 777 -- "$pkgdir/opt/${_pkgname}/bak"
  chmod 777 -- "$pkgdir/opt/${_pkgname}/pkmdb"
  
}

