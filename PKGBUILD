# Maintainer: Firstpick <firstpick1992@proton.me>

pkgname=captureage-bin
pkgver=1.26.0
pkgrel=1
pkgdesc='Advanced spectating for Age of Empires II: Definitive Edition (Windows binary via Proton)'
arch=('x86_64')
url='https://captureage.com/cade'
license=('LicenseRef-CaptureAge')
depends=('bash' 'protontricks' 'steam')
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
  'captureage.desktop'
  'captureage.reg'
  'LICENSE'
  'README.md'
)
noextract=("$_archive")
sha256sums=('5b3b4765f4d9df06dd5cb614f0467a0212efd8b47f5dc60919fd8716745e3510'
            '7a60cfba11c9e9c0e8709f42ff11b82cb15ab000f0b5af03e752859477219218'
            '0fbfb4694cd1d20f1bcd37581a59b425b6dcf5ef58d23e1bbc6cea4f6d67d93a'
            '3c17f11425e8e62166a9a278622173f5f2479c2f7ef9f732a4b9d4acbd22814e'
            '35599267d69f141d105a99e22a11d9cd65a0ea263a97fefe092366987071c25f'
            'dd6336332273a898a3c81aef787d447b269d3f2ff20b9384b5711777d0c70ade')

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
  install -Dm644 "$srcdir/captureage.desktop" \
    "$pkgdir/usr/share/applications/captureage.desktop"
  install -Dm644 "$srcdir/captureage.reg" \
    "$pkgdir/usr/share/captureage/captureage.reg"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
