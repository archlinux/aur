# Maintainer: envolution
# Contributor: Ralph Torres <mail@ralphptorr.es>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: White-Oak <lpzhelud@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=servo-nightly-bin
_pkgname=servo
pkgver=20250409
pkgrel=3
pkgdesc='embeddable, independent, memory-safe, modular, parallel web rendering engine'
arch=(x86_64)
url=https://servo.org
license=(MPL-2.0)

# prepare download URL from stored pkgver
_datecode=$(echo "$pkgver" | sed 's/\(....\)\(..\)\(..\)/\1-\2-\3/')
_url="https://github.com/servo/servo-nightly-builds/releases/download/$_datecode"

provides=($_pkgname)
conflicts=($_pkgname)
depends=(gst-plugins-bad libunwind)
source=(
  "$_pkgname-$pkgver.tar.gz"::"$_url/$_pkgname-latest.tar.gz"
  "$_pkgname-$pkgver.tar.gz.sha256"::"$_url/$_pkgname-latest.tar.gz.sha256"
  https://raw.githubusercontent.com/servo/servo/main/LICENSE
  org.servo.Servo.desktop
)
sha256sums=('84907fd2296d176084cf3b4d27d04e1ba24164c74a71b67b50d66539efbf4d2d'
            '90ebf7e3bf5d311d4cb057838f7883dc58a2d54244ae9335f5b4a0d5c8053e7d'
            '1af2d2b02d9c86030d29ed77117ca7a1b0e4b6ff35bcf8eeb124867d0f5cb59e'
            'cb5fe124efa3db92ed298cd67d597ef26e35afa448d4e9fdcb31bb67a961047d')

prepare() {
  sha256sum $_pkgname-$pkgver.tar.gz | sha256sum -c
}

package() {
  install -Dm644 -t "$pkgdir"/usr/share/applications "org.servo.${_pkgname^}.desktop"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
#!/bin/sh
exec /usr/lib/servo/servo "\$@"
END

  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname"
  cp -r "$_pkgname/resources" "$pkgdir/usr/lib/$_pkgname"
  install -Dm644 "$_pkgname/resources/servo_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/org.servo.${_pkgname^}.png"
  find "$pkgdir/usr/lib/$_pkgname/resources" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/lib/$_pkgname/resources" -type f -exec chmod 644 {} +
}
# vim:set ts=2 sw=2 et:
