# Maintainer: Alexander Pohl <alex@ahpohl.com>

pkgname=evebox-bin
_pkgname=evebox
pkgver=0.31.0
pkgrel=1
pkgdesc="Web based Suricata EVE event viewer and alert management (static upstream binary)"
arch=('x86_64' 'aarch64')
url="https://evebox.org"
license=('MIT')
depends=()                       # static musl binary, web UI is embedded
optdepends=(
  'suricata: produce EVE logs on this host (server with local input, or agent)'
  'suricata-nfqueue: same, Suricata built with NFQUEUE inline IPS support'
  'geoip-database: GeoLite2 City database in /usr/share/GeoIP for GeoIP enrichment'
  'elasticsearch: alternative event store instead of the built-in SQLite'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=(
  'etc/evebox/evebox.yaml'
  'etc/evebox/agent.yaml'
)
options=('!strip' '!debug')
install=evebox.install

source=(
  "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/jasonish/evebox/${pkgver}/LICENSE.txt"
  'evebox.service'
  'evebox-agent.service'
  'evebox.sysusers'
  'evebox.tmpfiles'
  'evebox.yaml'
  'agent.yaml'
)
source_x86_64=("https://evebox.org/files/release/${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source_aarch64=("https://evebox.org/files/release/${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")

# Run `updpkgsums` before the first build: upstream publishes no checksum
# for the zip archives, so the arch-specific SKIP entries are placeholders.
sha256sums=('cc40a3ad6421ffc194b8cede0bfc34f1354f4345b700c2362f2e96625608f97a'
            'eb0ff43a308d900f19c7317fcea5c58dd6cbbe0639a4f117d28489f259c30836'
            '6eb35fbedd62343666fb38536975c235770482270d1853e786fedfab5fe61e45'
            'ebf1a86bf867286e1fcbbcf66ae80021bcb9aaafb3b70ff22f7c51da83f9a44b'
            'c5ec1f6e991ee4f3bedc3b4cfcdafe5b42a331da5eca515cb8506e513dd4c889'
            'f4e4b161f15627d02fe0fd4c2f28b75fb0e151bc27e9c430b28482d5ed8ae043'
            '9ef5635c9c79f3b371c87af9825343f3d94960241cae81ced0dbed15de9cc47d')
sha256sums_x86_64=('bccdf368a8246a34902565785eab5e9e7b44a67d079c1f08ac096e1b68a1b6c9')
sha256sums_aarch64=('606027ef6517009a32e84a749b7bff7afe02fa94c01194dcbb6b189bf63b5803')

_distdir() {
  case "${CARCH}" in
    x86_64)  echo "${_pkgname}-${pkgver}-linux-x64" ;;
    aarch64) echo "${_pkgname}-${pkgver}-linux-arm64" ;;
  esac
}

package() {
  local _dist
  _dist="$(_distdir)"

  install -Dm755 "${_dist}/evebox" "${pkgdir}/usr/bin/evebox"

  # Configuration (permissions on these are fixed up by tmpfiles, since the
  # evebox group does not exist at build time)
  install -Dm644 evebox.yaml "${pkgdir}/etc/evebox/evebox.yaml"
  install -Dm644 agent.yaml  "${pkgdir}/etc/evebox/agent.yaml"

  # systemd integration
  install -Dm644 evebox.service       "${pkgdir}/usr/lib/systemd/system/evebox.service"
  install -Dm644 evebox-agent.service "${pkgdir}/usr/lib/systemd/system/evebox-agent.service"
  install -Dm644 evebox.sysusers      "${pkgdir}/usr/lib/sysusers.d/evebox.conf"
  install -Dm644 evebox.tmpfiles      "${pkgdir}/usr/lib/tmpfiles.d/evebox.conf"

  # Upstream example configurations shipped in the zip
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/examples" \
    "${_dist}/examples/evebox.yaml" "${_dist}/examples/agent.yaml"

  install -Dm644 "LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
