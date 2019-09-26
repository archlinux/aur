# Maintainer: C. Dominik Bódi <packaging at technologicalwizardry dot com>
# Maintainer: jtmb <packaging at technologicalwizardry dot com>
_pkgname=PKHeX
pkgname=pkhex
pkgver=19.09.19
pkgrel=1
pkgdesc="Pokémon core series save editor, programmed in C#."
arch=(any)
url="https://github.com/kwsch/PKHeX"
license=('GPL')
depends=(mono)
makedepends=(git msbuild)
provides=(pkhex)
conflicts=(pkhex-bin pkhex-git)
options=('!strip')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/kwsch/PKHeX/archive/${pkgver}.tar.gz"
		"PKHeX.sh"
		"PKHeX.desktop"
		"PKHeX.png")
# "git+https://github.com/kwsch/PKHeX#tag=${pkgver}"
		
md5sums=('7907f0f7cb989f1cbc709367e5694b94'
         '20361d8321bf7f2ff35d6f29dea4764d'
         'dc5fb6d9abadcaf7759ecb5b02850e4b'
         'ceb97fc5efcf4548ca4572b5116f5875')
backup=("opt/${_pkgname}/PKHeX.exe.config"
        "opt/${_pkgname}/PKHeX.Core.dll.config")

build() {
  cd "${_pkgname}-${pkgver}"

  msbuild PKHeX.sln -t:restore -t:build -p:Configuration=Mono-Release
  
}

package() {

  install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
  install -Dm755 -- PKHeX.sh "$pkgdir/usr/bin/${_pkgname}"
  cd "${_pkgname}-${pkgver}"

  install -Dm755 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.exe "$pkgdir/opt/${_pkgname}/PKHeX.exe"
  install -Dm644 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.exe.config "$pkgdir/opt/${_pkgname}/PKHeX.exe.config"
  install -Dm755 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.Core.dll "$pkgdir/opt/${_pkgname}/PKHeX.Core.dll"
  install -Dm644 -- PKHeX.WinForms/bin/Mono-Release/PKHeX.Core.dll.config "$pkgdir/opt/${_pkgname}/PKHeX.Core.dll.config"
  mkdir -p -- "$pkgdir/opt/${_pkgname}/bak"
  mkdir -p -- "$pkgdir/opt/${_pkgname}/pkmdb"
  chmod 777 -- "$pkgdir/opt/${_pkgname}/bak"
  chmod 777 -- "$pkgdir/opt/${_pkgname}/pkmdb"
  
}

