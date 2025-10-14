# Maintainer: envolution
# Contributor: Ralph Torres <mail@ralphptorr.es>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: White-Oak <lpzhelud@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=servo-nightly-bin
_pkgname=servo
pkgver=20251014
pkgrel=1
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
sha256sums=('07e8cca8f64342333b41f8bd101e31fad36be70ab5c8ab7e11839da93c3f31e5'
            '1c66890f3d5bee5e0deaea231eb0b9d87c476f6cda8e561e60e9a08a98810545'
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
