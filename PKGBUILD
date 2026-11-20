# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=convex-bin
pkgver=20261116.g80befbc
pkgrel=1
pkgdesc='Self-hosted Convex backend and dashboard (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/convex/convex-backend'
license=('LicenseRef-FSL-1.1-Apache-2.0')
depends=('bash' 'ca-certificates' 'caddy' 'gcc-libs' 'glibc>=2.35')
provides=("convex-self-hosted-bin=$pkgver")
conflicts=('convex-self-hosted-bin')
options=(!strip !debug)

_date=${pkgver%%.*}
_tag="precompiled-${_date:0:4}-${_date:4:2}-${_date:6:2}-${pkgver#*.g}"
_release="$url/releases/download/$_tag"
source=("convex-dashboard-$pkgver.zip::$_release/dashboard.zip"
        "convex-LICENSE-$pkgver.md::$_release/LICENSE.md"
        'convex-backend'
        'convex-backend.service'
        'convex-dashboard.service'
        'convex-dashboard.Caddyfile'
        'convex.target')
source_x86_64=("convex-backend-$pkgver-x86_64.zip::$_release/convex-local-backend-x86_64-unknown-linux-gnu.zip")
source_aarch64=("convex-backend-$pkgver-aarch64.zip::$_release/convex-local-backend-aarch64-unknown-linux-gnu.zip")
noextract=("convex-dashboard-$pkgver.zip")
sha256sums=('f8e67bad1b920c3af484c1c8adc6ff14d1165d4e1c0d429623aeddb7057b93ee'
            '563cea54ba1ad9d2a1b36f4a62b1ebdc3e1dcfb8776a7afee06c99aad5294588'
            '0b76474cc5dcd9bff93ad88102bfabbd681e144f19ba09e96f2ab81015e2db7a'
            '474264631a77817a3938753b3b27603a70adf8b3b2445c21c69ba168a3456824'
            '972179bbd6c21960f5e589ef7a6f040c9740321d2238a2d87783374601ce26cd'
            'b737ad0b86a68d10f97e50fdd68528054630a6fee0a05f152119524e84fe7fb3'
            'c7531e58abeed63b29b5147f4e5143107d23a5d1f1d0df81f99076a862b26827')
sha256sums_x86_64=('65230f5e8583c7c7f13cdf5854b140187c153c71bbc32276d60d75658214ab9e')
sha256sums_aarch64=('06c3a8b70d23f8915ce97be646a6de690c6cac8727089387cecb1a1e8bac5262')

package() {
  install -Dm755 "$srcdir/convex-local-backend" "$pkgdir/usr/bin/convex-local-backend"
  install -Dm755 "$srcdir/convex-backend" "$pkgdir/usr/lib/convex/convex-backend"
  install -Dm644 "$srcdir/convex-LICENSE-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 "$srcdir/convex-dashboard.Caddyfile" "$pkgdir/usr/lib/convex/dashboard.Caddyfile"
  install -Dm644 "$srcdir/"convex-{backend,dashboard}.service "$srcdir/convex.target" -t "$pkgdir/usr/lib/systemd/system/"

  install -dm755 "$pkgdir/usr/share/convex/dashboard"
  bsdtar -xf "$srcdir/convex-dashboard-$pkgver.zip" --no-same-owner -C "$pkgdir/usr/share/convex/dashboard"
}
