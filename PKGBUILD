# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=fleet-desktop
pkgver=1.45.1
pkgrel=1
pkgdesc='Eases the deployment of osquery connected with a Fleet server.'
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
  'https://github.com/fleetdm/fleet/archive/refs/tags/orbit-v1.45.1.tar.gz'
  'fleet-desktop-orbit-link.hook'
  'fleet-desktop-orbit-link.sh'
  'fleet-desktop-orbit-link-cleanup.hook'
  'fleet-desktop-orbit-link-cleanup.sh'
)
sha512sums=(
  '81aecb32952005a8bd5bc39e9500cf4148f7f0031558d29c8945124349d11432aa3ff10918e2165de985220ac9d3bd3607d1649c6a29e0079f75d163c54111d8'
  '0ecacd63529c007405d9404afa46741a89f5510be0e69c68b9e98a8945339a341d2ca0413f3682cb319411aefea1a89788a5879f1f27a820f8c0ae554103bbbd'
  'd2d36bc1dcb74b9bd21477730fddc05fbced7b0005e65b48bc90f7fb6dc9e5675066c39b7ada017cdc27c30ad4eb9ac38eeaa83958acdcebb44875eca9ebb613'
  '2142db86864306f3a4b007476875a52d0c4a24372f86138b361a6215dfa0a26c65a486ca896bb8da9cb41fa18f8b02433b20cc504828c7e5e2ab045cd06db2d2'
  '95f35d37900d835bae36c51dc41c991039aa8e48eb730ef7aff43f6aff11dee7e42133f4dd3a95969494c1c9dcd5f6caf0f7e263a0f5affeebd2e6a18367d731'
)

build() {
  cd "fleet-orbit-v${pkgver}"

  mkdir -p build
  go mod download

  isodate="$(TZ=UTC date +'%Y-%m-%dT%H:%M:%SZ')"
  importpath='github.com/fleetdm/fleet/v4/orbit/pkg/build'
  commitsha='f4389669e5181b7c92d85b4dad32fb38855fee72'

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