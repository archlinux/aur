# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=fleet-desktop
pkgver=1.48.1
pkgrel=1
pkgdesc='Menu bar icon that gives visibility into the security posture of your machine.'
arch=(x86_64)
url='https://github.com/fleetdm/fleet/tree/main/orbit'
license=(MIT)
depends=()
makedepends=(go)
backup=()
optdepends=(
  'fleet-orbit: integration with Fleet Orbit OSQuery'
)
source=(
  'https://github.com/fleetdm/fleet/archive/refs/tags/orbit-v1.48.1.tar.gz'
  'fleet-desktop-orbit-link.hook'
  'fleet-desktop-orbit-link.sh'
  'fleet-desktop-orbit-link-cleanup.hook'
  'fleet-desktop-orbit-link-cleanup.sh'
)
sha512sums=(
  'cf82e513465161b631617c6e340aa2e2c8a7f95eee0c30630e1f326254711bfd6cb78a3fcae303e041867205c0612c35e9bf321f014fc7d281f46610074a13ec'
  '5d3257fee65c6613f45e0b78eb6af68697a8096dfdd37a0f9ea32fd32b21545ae3095f1e47e88c49128f32336aefa744f7670ca4ba9b477f0fa76492ed97ab98'
  '2b17ea1dedc1410ab5e96f84f1d8465b5dbff8508adf8e873691587252a934f8526162dd2dc1a4db5d7fa747b3db51bfd010a347f33c5f52abfaeaa9b95ed0d4'
  '74ab0fd342d9e4a6457862b23eb12d04a63854beff1e2b429c55695a88f68b2d70d0f5853f96903afa5e59823a266ffc70a2ad83845f7349c9ec349bc90e7e79'
  '95f35d37900d835bae36c51dc41c991039aa8e48eb730ef7aff43f6aff11dee7e42133f4dd3a95969494c1c9dcd5f6caf0f7e263a0f5affeebd2e6a18367d731'
)

build() {
  cd "fleet-orbit-v${pkgver}"

  mkdir -p build
  go mod download

  isodate="$(TZ=UTC date +'%Y-%m-%dT%H:%M:%SZ')"
  importpath='github.com/fleetdm/fleet/v4/orbit/pkg/build'
  commitsha='863ce8b321b199d1b766123d1228bb05cfe91b41'

  ldflags="-s -w"
  ldflags="${ldflags} -X ${importpath}.Version=v${pkgver}"
  ldflags="${ldflags} -X ${importpath}.Commit=${commitsha}"
  ldflags="${ldflags} -X ${importpath}.Date=${isodate}"

  CGO_ENABLED=1 go build \
    -o build/ \
    -trimpath \
    -buildvcs=false \
    -ldflags="-X=main.version=${pkgver}-${pkgrel}" \
    ./orbit/cmd/desktop/
}

package() {
  install -Dm644 "fleet-orbit-v${pkgver}/orbit/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "fleet-orbit-v${pkgver}/build/desktop" "${pkgdir}/usr/bin/fleet-desktop"

  install -Dm644 \
    'fleet-desktop-orbit-link.hook' \
    "${pkgdir}/usr/share/libalpm/hooks/fleet-desktop-orbit-link.hook"
  install -Dm755 \
    "fleet-desktop-orbit-link.sh" \
    "$pkgdir/usr/lib/fleet-desktop/fleet-desktop-orbit-link.sh"

  install -Dm644 \
    'fleet-desktop-orbit-link-cleanup.hook' \
    "${pkgdir}/usr/share/libalpm/hooks/fleet-desktop-orbit-link-cleanup.hook"
  install -Dm755 \
    "fleet-desktop-orbit-link-cleanup.sh" \
    "$pkgdir/usr/lib/fleet-desktop/fleet-desktop-orbit-link-cleanup.sh"
}