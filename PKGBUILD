# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=convex-bin
pkgver=20261121.gcf39368
pkgrel=1
pkgdesc='Self-hosted Convex backend and dashboard (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/convex/convex-backend'
license=('LicenseRef-FSL-1.1-Apache-2.0')
depends=('bash' 'ca-certificates' 'caddy' 'gcc-libs' 'glibc>=2.35')
provides=("convex-self-hosted-bin=$pkgver")
conflicts=('convex-self-hosted-bin')
options=(!strip !debug)
install=convex-bin.install

_date=${pkgver%%.*}
_tag="precompiled-${_date:0:4}-${_date:4:2}-${_date:6:2}-${pkgver#*.g}"
_release="$url/releases/download/$_tag"
source=("convex-dashboard-$pkgver.zip::$_release/dashboard.zip"
        "convex-LICENSE-$pkgver.md::$_release/LICENSE.md"
        'convex-backend'
        'convex-backend.service'
        'convex-dashboard.service'
        'convex-dashboard.Caddyfile'
        'convex.target'
        'SETUP.md')
source_x86_64=("convex-backend-$pkgver-x86_64.zip::$_release/convex-local-backend-x86_64-unknown-linux-gnu.zip")
source_aarch64=("convex-backend-$pkgver-aarch64.zip::$_release/convex-local-backend-aarch64-unknown-linux-gnu.zip")
noextract=("convex-dashboard-$pkgver.zip")
sha256sums=('70113a035882b2223f88ca68d9b8fb6405960b920ff79e45b5cb87994bf5226c'
            '563cea54ba1ad9d2a1b36f4a62b1ebdc3e1dcfb8776a7afee06c99aad5294588'
            '0b76474cc5dcd9bff93ad88102bfabbd681e144f19ba09e96f2ab81015e2db7a'
            '474264631a77817a3938753b3b27603a70adf8b3b2445c21c69ba168a3456824'
            '972179bbd6c21960f5e589ef7a6f040c9740321d2238a2d87783374601ce26cd'
            'b737ad0b86a68d10f97e50fdd68528054630a6fee0a05f152119524e84fe7fb3'
            'c7531e58abeed63b29b5147f4e5143107d23a5d1f1d0df81f99076a862b26827'
            'f89744275d7eb26f33f272b2a01e319737a84edeccb50deb79de11fd490a3b88')
sha256sums_x86_64=('a7bf39daa91535b93a4c59943bcf5c963c3852b021f02be132145500904b5f1d')
sha256sums_aarch64=('309cab736b37e5af742cf002732d920d453681cc721934c31ff0962a0806a1d7')

package() {
  install -Dm755 "$srcdir/convex-local-backend" "$pkgdir/usr/bin/convex-local-backend"
  install -Dm755 "$srcdir/convex-backend" "$pkgdir/usr/lib/convex/convex-backend"
  install -Dm644 "$srcdir/convex-LICENSE-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 "$srcdir/SETUP.md" "$pkgdir/usr/share/doc/$pkgname/SETUP.md"
  install -Dm644 "$srcdir/convex-dashboard.Caddyfile" "$pkgdir/usr/lib/convex/dashboard.Caddyfile"
  install -Dm644 "$srcdir/"convex-{backend,dashboard}.service "$srcdir/convex.target" -t "$pkgdir/usr/lib/systemd/system/"

  install -dm755 "$pkgdir/usr/share/convex/dashboard"
  bsdtar -xf "$srcdir/convex-dashboard-$pkgver.zip" --no-same-owner -C "$pkgdir/usr/share/convex/dashboard"
}
