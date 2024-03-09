# Maintainer: ccicnce113424 <ccicnce113424@gmail.com>
pkgname=llin-git
_pkgname=LLin
pkgver=2024.304.0.r0.64259af
pkgrel=1
pkgdesc="An in-game music player and download accelerator for osu! lazer."
arch=('x86_64')
url="https://github.com/MATRIX-feather/LLin"
license=('unknown')
depends=('osu-lazer' 'dotnet-runtime')
makedepends=('git' 'dotnet-sdk')
conflicts=('osu-lazer-bin')
source=("git+https://github.com/MATRIX-feather/LLin.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  DOTNET_CLI_TELEMETRY_OPTOUT="1" dotnet publish osu.Game.Rulesets.IGPlayer \
    --framework net8.0 \
    --configuration Release \
    --use-current-runtime \
    --no-self-contained \
    --output output
}

package() {
  cd "$srcdir/$_pkgname/output"
  install -d "$pkgdir/opt/osu-lazer/zh"
  install -Dm644 zh/M.Resources.resources.dll "$pkgdir/opt/osu-lazer/zh"
  install -Dm644 M.DBus.dll "$pkgdir/opt/osu-lazer"
  install -Dm644 M.Resources.dll "$pkgdir/opt/osu-lazer"
  install -Dm644 NetCoreServer.dll "$pkgdir/opt/osu-lazer"
  install -Dm644 Tmds.DBus.dll "$pkgdir/opt/osu-lazer"
  install -Dm644 osu.Game.Rulesets.IGPlayer.dll "$pkgdir/opt/osu-lazer"
}
