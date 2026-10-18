# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=gtaiv-eflc-fusionfix-bin
pkgver=5.1.2
pkgrel=3
pkgdesc="Mod that fixes and improves Grand Theft Auto IV: The Complete Edition, for Proton and Wine (upstream binary)"
# Windows DLLs and game data, loaded by the game under Proton or Wine
arch=('any')
url="https://github.com/ThirteenAG/GTAIV.EFLC.FusionFix"
# FusionFix itself is GPL. The zip also carries two DLLs upstream does not
# build: dinput8.dll, the Ultimate ASI Loader (MIT), and vulkan.dll, the d3d9
# DLL of DXVK (Zlib). Their licence texts are fetched separately, because the
# zip has none.
license=('GPL-3.0-only' 'MIT' 'Zlib')
optdepends=("protontricks: installs d3dx9_43 into the game's Proton prefix, which upstream asks for")
provides=('gtaiv-eflc-fusionfix')
conflicts=('gtaiv-eflc-fusionfix')
options=('!strip')
install="$pkgname.install"
# The DXVK release upstream's workflow bundles, synced by pkg.sh. The ASI
# Loader comes from a rolling tag, so its licence is pinned to the commit
# that last changed it.
_dxvk="v3.1.1"
_ual="d124a3459a50fcccc0ab4a01bd0925825605e0c2"
source=("$pkgname-$pkgver.zip::https://github.com/ThirteenAG/GTAIV.EFLC.FusionFix/releases/download/v$pkgver/GTAIV.EFLC.FusionFix.zip"
        "$pkgname-$pkgver-license::https://raw.githubusercontent.com/ThirteenAG/GTAIV.EFLC.FusionFix/v$pkgver/license"
        "dxvk-${_dxvk#v}-LICENSE::https://raw.githubusercontent.com/doitsujin/dxvk/$_dxvk/LICENSE"
        "ultimate-asi-loader-${_ual:0:7}-license::https://raw.githubusercontent.com/ThirteenAG/Ultimate-ASI-Loader/$_ual/license")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('138f4067a2d2f09df2df80c4378407ad7c742be0e3b99f090633d50820bb2450' '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' 'a5cb1a6ded7d2d7e92d550ba28edd21be2d1d4044662b399887351023e30ce64' 'ceca73c504e39084b0b80d2a437aea9988313d1915418d3c629c3e4a8313f5a1')

package() {
  local share="$pkgdir/usr/share/gtaiv-eflc-fusionfix"

  # The game only loads the mod from its own folder, so the files are kept
  # here and the install hooks copy them into each Steam copy of the game.
  # Upstream's install guide is the same: unpack the zip next to GTAIV.exe.
  install -d "$share"
  bsdtar -xf "$srcdir/$pkgname-$pkgver.zip" -C "$share"
  find "$share" -type d -exec chmod 755 {} +
  find "$share" -type f -exec chmod 644 {} +

  install -Dm644 "$srcdir/$pkgname-$pkgver-license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/dxvk-${_dxvk#v}-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.dxvk"
  install -Dm644 "$srcdir/ultimate-asi-loader-${_ual:0:7}-license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ultimate-asi-loader"
}
