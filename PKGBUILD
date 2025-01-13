# Maintainer: envolution
# Contributor: Ralph Torres <mail@ralphptorr.es>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: White-Oak <lpzhelud@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=servo-nightly-bin
_pkgname=servo
pkgver=20250113
pkgrel=1
pkgdesc='embeddable, independent, memory-safe, modular, parallel web rendering engine'
arch=(x86_64)
url=https://servo.org
license=(MPL-2.0)

_url=https://github.com/servo/servo-nightly-builds/releases/latest
provides=($_pkgname)
conflicts=($_pkgname)
depends=(gst-plugins-bad libunwind)
source=(
  $_pkgname-$pkgver.tar.gz::$_url/download/$_pkgname-latest.tar.gz
  $_pkgname-$pkgver.tar.gz.sha256::$_url/download/$_pkgname-latest.tar.gz.sha256
  https://raw.githubusercontent.com/servo/servo/main/LICENSE
  servo.desktop
)
sha256sums=('19550975fc87bae8ff21dce6cd3080ccef58041504de5356562b1a7479ef219c'
            'f48d2e9a33c62638e4e98931a5a8b360132ca31a00273b988055c801cac98318'
            '1af2d2b02d9c86030d29ed77117ca7a1b0e4b6ff35bcf8eeb124867d0f5cb59e'
            '7a6cd816c35b9b42a27d83efbe72b3ac6bc79f2044153410fa434d7625f442ad')

pkgver() {
  curl -sLI -o /dev/null -w %{url_effective} $_url |
    rev | cut -d/ -f1 | rev | tr -d -
}

prepare() {
  sha256sum $_pkgname-$pkgver.tar.gz | sha256sum -c
}

package() {
  install -Dm644 -t "$pkgdir"/usr/share/applications $_pkgname.desktop
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
#!/bin/sh
exec /usr/lib/servo/servo "\$@"
END

  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname"
  cp -r "$_pkgname/resources" "$pkgdir/usr/lib/$_pkgname"
  find "$pkgdir/usr/lib/$_pkgname/resources" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/lib/$_pkgname/resources" -type f -exec chmod 644 {} +
}
# vim:set ts=2 sw=2 et:
