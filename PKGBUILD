# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=fleet-orbit
pkgver=0.0.11
pkgrel=1
pkgdesc='Eases the deployment of osquery connected with a Fleet server.'
arch=(x86_64)
url='https://github.com/fleetdm/fleet/tree/main/orbit'
license=(MIT)
depends=(osquery)
makedepends=(go)
backup=(etc/default/orbit)
optdepends=()
source=(
  "https://github.com/fleetdm/fleet/archive/refs/tags/orbit-v$pkgver.tar.gz"
  'fleet-orbit'
  'fleet-orbit-cleanup.hook'
  'fleet-orbit-config'
  'fleet-orbit.service'
)
sha512sums=(
  '84116aad0739384081997401c91a4d4bbe96ec6e25d6ec9b04a0abdf875d2e8bf9ec990b607d84c5741dd0dcfd26942ccac72df17a1de469b402c8e81608435c'
  '449f29d82564b3a0e56d529e0550bf83b22cfd672b960e20441015ef5c106f4d7508f4f0bb47631fe399e477e31b05c4a223549a36d23dc89ba9571d6468a75e'
  'c4d4fdf980a891f5e56ca82173c57b60d0e157ef4af769fc5d9ecd7b9c70124402d694f35d48101e6633d0134ade9ab33cff3c129e2f603a6b7df1ee560eab5a'
  '781ba7743f8f176aeeef702cce67478af70981596029677e1e50f1a57b479c66832436e39d66b5e7f879477733b661326d306064050968acfb246adddfddf30a'
  '87aca00b0c053c194a36d583f474f34f22207c4e1e5319ed3722769f796599e8f69b920063daca95644f9ea11454cefdb4109011370c70ce27db90720d5f12e8'
)

build() {
  cd "$pkgname-v$pkgver"

  mkdir -p build
  go mod download
  isodate=$(TZ=GMT date +"%Y-%m-%dT%H:%M:%SZ")
  CGO_ENABLED=0 go build \
    -o build/ \
    -trimpath \
    -buildvcs=false \
    -ldflags "-s -w -X github.com/fleetdm/fleet/v4/orbit/pkg/build.Version=v$pkgver -X github.com/fleetdm/fleet/v4/orbit/pkg/build.Commit=716e06a7d388289f36a6b06b648a1594d9df1689 -X github.com/fleetdm/fleet/v4/orbit/pkg/build.Date=$isodate" \
    ./orbit/cmd/orbit/
}

package() {
  install -Dm644 'fleet-orbit-config' "$pkgdir/etc/default/fleet-orbit"
  install -Dm644 'fleet-orbit.service' "$pkgdir/usr/lib/systemd/system/fleet-orbit.service"
  install -Dm644 'fleet-orbit-cleanup.hook' "$pkgdir/usr/share/libalpm/hooks/fleet-orbit-cleanup.hook"
  
  install -Dm644 "$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 "$pkgname-v$pkgver/build/orbit" "$pkgdir/opt/fleet-orbit/bin/orbit/linux/stable/orbit"
  ln -s "./linux/stable/orbit" "$pkgdir/opt/fleet-orbit/bin/orbit/orbit"

  install -Dm755 "fleet-orbit" "$pkgdir/usr/bin/fleet-orbit"

  mkdir -p "$pkgdir/opt/fleet-orbit/bin/osqueryd/linux/stable/"
  ln -s /usr/bin/osqueryd "$pkgdir/opt/fleet-orbit/bin/osqueryd/linux/stable/osqueryd"
}