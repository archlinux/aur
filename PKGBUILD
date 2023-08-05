# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=fleet-orbit
pkgver=1.14.0
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
  'https://github.com/fleetdm/fleet/archive/refs/tags/orbit-v1.14.0.tar.gz'
  'fleet-orbit'
  'fleet-orbit-cleanup.hook'
  'fleet-orbit-config'
  'fleet-orbit.service'
)
sha512sums=(
  '07da738c5815243718fca4182bdee9de9e0bc7f2c2aff81f889cd6e61013d9cebe4f74aaf1b6e254c68d1670921eb7ca4a019159b65d0879cba55c1220a672f9'
  'd94ab30cc3543e2cb0abcc520ad2b4a297a22f29798dde7e188caf91e8669d99b60dbde7c513afec908cfd47c74a11537267046f0c8c0ccbcaacb8d1b75dd21d'
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
  commitsha='f7296de183a1a2f9f29bf1d3047983fc9b976cc3'

  ldflags="-s -w"
  ldflags="${ldflags} -X ${importpath}.Version=v${pkgver}"
  ldflags="${ldflags} -X ${importpath}.Commit=${commitsha}"
  ldflags="${ldflags} -X ${importpath}.Date=${isodate}"

  CGO_ENABLED=1 go build \
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