# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Contributor: edu4rdshl <edu4rdshl@protonmail.com>
_pkgname=PD2MM
pkgname=pd2mm
pkgdesc="A desktop application for installing and managing PAYDAY 2 mods with a fast, modern workflow."
pkgver=1.8.1
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/CloodDev/PD2MM"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'nss' hicolor-icon-theme)
makedepends=('npm' 'nodejs>=23')
optdepends=(
  'xdg-utils: Open links, files, etc'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/CloodDev/PD2MM/archive/v${pkgver}.tar.gz"\
        "pd2mm.desktop"
        "pd2mm.sh"
        0001-export-dir.patch)
sha256sums=('9166ed5ad48b266a00ea033848a7f2dedd8821079cecf830502bb5875ba7cbd4'
            'c50e7bba55b94f177118250d20acb5b185b5b70c5b93b61a35a215e15a35ac68'
            '42645db318289b1db1c2fae07b0dbd5c8416259b7bc97202aec73ef235ad5152'
            '3bba3d88bdc151a68937b9f4b2173bb29c07cbfbe5f29b984471eb2899f1455a')
prepare(){
  cd "$srcdir/$_pkgname-$pkgver"
  patch -tp1 <"$srcdir/0001-export-dir.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  npm ci --ignore-scripts
  npm run build
  npx electron-builder build --linux --publish never --config electron-builder.mjs
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgname"
  install -d "$pkgdir/usr/bin"
  # change folder to copy per arch
  case "${CARCH}" in
    "aarch64") folder="linux-arm64-unpacked" ;;
    *) folder="linux-unpacked" ;;
  esac
  cp -R "dist/${folder}/." "$pkgdir/usr/lib/$pkgname"
  install -Dm644 "../pd2mm.desktop" "$pkgdir/usr/share/applications/pd2mm.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for res in 64x64 128x128 256x256 512x512; do
    install -Dm644 "buildResources/icons/${res}.png" "$pkgdir/usr/share/icons/hicolor/${res}/apps/$pkgname.png"
  done
  install -Dm755 "../pd2mm.sh" "$pkgdir/usr/bin/$pkgname"
}
