# Maintainer: Firstpick <firstpick1992@proton.me>

pkgname=captureage-bin
pkgver=1.26.0
pkgrel=5
pkgdesc='Advanced spectating for Age of Empires II: Definitive Edition (Windows binary via Proton)'
arch=('x86_64')
url='https://captureage.com/cade'
license=('LicenseRef-CaptureAge')
depends=('bash' 'python' 'protontricks' 'steam')
makedepends=('libarchive')
options=('!strip' '!debug')
provides=("captureage=$pkgver")
conflicts=('captureage')

_archive="CaptureAge-${pkgver}-x64.nsis.7z"
# The API supplies a fresh signed CDN redirect for this exact release.
# Do not replace this with /latest or persist the expiring CDN URL.
source=(
  "${_archive}::https://captureage.com/api/cade/download/prod/${_archive}"
  'captureage'
  'configure_game.py'
  'captureage.desktop'
  'captureage.png'
  'captureage.reg'
  'LICENSE'
  'README.md'
)
noextract=("$_archive")
sha256sums=('5b3b4765f4d9df06dd5cb614f0467a0212efd8b47f5dc60919fd8716745e3510'
            'ae494feccf07742fca18f174e4bf32c07b44ced812e0f408bf2d139583b22acb'
            '001b62f8af99bb64c11002b011842cdbd46beddf56019730a7c3f3ce479d7c9a'
            '6ecc0cf6936dca8552492114051bfe173df3bcf86b98d111ed1eda8c474b2f91'
            'bcf898c2e3f7949ac72ca04706b3941db4532167ff3bd27363baa8e675c99c8e'
            '3c17f11425e8e62166a9a278622173f5f2479c2f7ef9f732a4b9d4acbd22814e'
            '35599267d69f141d105a99e22a11d9cd65a0ea263a97fefe092366987071c25f'
            '80aecfba16323edc148b7e27bd96db4b7a82e87563d1b992c29cd69f327f03e1')

prepare() {
  mkdir -p "$srcdir/captureage-app"
  bsdtar -xf "$srcdir/$_archive" -C "$srcdir/captureage-app"
  # Confirm the downloaded payload agrees with the package version.
  grep -Fq "\"version\": \"$pkgver\"" \
    "$srcdir/captureage-app/resources/app/package.json"
}

package() {
  install -d "$pkgdir/opt/captureage"
  cp -a "$srcdir/captureage-app/." "$pkgdir/opt/captureage/"
  install -Dm755 "$srcdir/captureage" "$pkgdir/usr/bin/captureage"
  install -Dm644 "$srcdir/configure_game.py" \
    "$pkgdir/usr/share/captureage/configure_game.py"
  install -Dm644 "$srcdir/captureage.desktop" \
    "$pkgdir/usr/share/applications/captureage.desktop"
  install -Dm644 "$srcdir/captureage.png" \
    "$pkgdir/usr/share/pixmaps/captureage.png"
  install -Dm644 "$srcdir/captureage.reg" \
    "$pkgdir/usr/share/captureage/captureage.reg"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
