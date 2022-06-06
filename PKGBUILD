# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=fleet-orbit
pkgver=0.0.12
pkgrel=1
pkgdesc='Eases the deployment of osquery connected with a Fleet server.'
arch=(x86_64)
url='https://github.com/fleetdm/fleet/tree/main/orbit'
license=(MIT)
depends=(osquery)
makedepends=(go)
backup=(etc/default/fleet-orbit)
optdepends=()
source=(
  'https://github.com/fleetdm/fleet/archive/refs/tags/orbit-v0.0.12.tar.gz'
  'fleet-orbit'
  'fleet-orbit-cleanup.hook'
  'fleet-orbit-config'
  'fleet-orbit.service'
)
sha512sums=(
  '06850cecdb973b0c993e8761248b8f724313195ea97a5a44f70afa3d78e4d9555053d2acfd7c728020566b7a2eb619d8dfb3b001eef4ea32431202300d039663'
  '449f29d82564b3a0e56d529e0550bf83b22cfd672b960e20441015ef5c106f4d7508f4f0bb47631fe399e477e31b05c4a223549a36d23dc89ba9571d6468a75e'
  'c4d4fdf980a891f5e56ca82173c57b60d0e157ef4af769fc5d9ecd7b9c70124402d694f35d48101e6633d0134ade9ab33cff3c129e2f603a6b7df1ee560eab5a'
  '781ba7743f8f176aeeef702cce67478af70981596029677e1e50f1a57b479c66832436e39d66b5e7f879477733b661326d306064050968acfb246adddfddf30a'
  '87aca00b0c053c194a36d583f474f34f22207c4e1e5319ed3722769f796599e8f69b920063daca95644f9ea11454cefdb4109011370c70ce27db90720d5f12e8'
)

build() {
  cd "${pkgname}-v${pkgver}"

  mkdir -p build
  go mod download

  isodate="$(TZ=UTC date +'%Y-%m-%dT%H:%M:%SZ')"
  importpath='github.com/fleetdm/fleet/v4/orbit/pkg/build'
  commitsha='b9161d008f1f9eec27025475c54c0cf6c7c6f256'

  ldflags="-s -w"
  ldflags="${ldflags} -X ${importpath}.Version=v${pkgver}"
  ldflags="${ldflags} -X ${importpath}.Commit=${commitsha}"
  ldflags="${ldflags} -X ${importpath}.Date=${isodate}"

  CGO_ENABLED=0 go build \
    -o build/ \
    -trimpath \
    -buildvcs=false \
    -ldflags="${ldflags}" \
    ./orbit/cmd/orbit/
}

package() {
  install -Dm644 'fleet-orbit-config' "${pkgdir}/etc/default/fleet-orbit"
  install -Dm644 'fleet-orbit.service' "${pkgdir}/usr/lib/systemd/system/fleet-orbit.service"
  install -Dm644 'fleet-orbit-cleanup.hook' "${pkgdir}/usr/share/libalpm/hooks/fleet-orbit-cleanup.hook"

  install -Dm644 "${pkgname}-v${pkgver}/orbit/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${pkgname}-v${pkgver}/build/orbit" "${pkgdir}/opt/fleet-orbit/bin/orbit/linux/stable/orbit"
  ln -s "./linux/stable/orbit" "${pkgdir}/opt/fleet-orbit/bin/orbit/orbit"

  install -Dm755 "fleet-orbit" "${pkgdir}/usr/bin/fleet-orbit"

  mkdir -p "${pkgdir}/opt/fleet-orbit/bin/osqueryd/linux/stable/"
  ln -s /usr/bin/osqueryd "${pkgdir}/opt/fleet-orbit/bin/osqueryd/linux/stable/osqueryd"
}