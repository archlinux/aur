# Maintainer: illusory <becomeillusory@gmail.com>

pkgname=honk-bin
pkgver=0.1.0beta.3
pkgrel=1
pkgdesc='Experimental Linux eBPF transparent proxy engine (prebuilt musl static full build)'
arch=('x86_64' 'aarch64')
url='https://github.com/daeuniverse/honk'
license=('GPL-3.0-only')
# The shipped binary is a static musl executable with no dynamic library
# dependencies. systemd provides the unit, kmod and procps-ng are used by the
# install script (modprobe to load NFQUEUE modules, sysctl to restore values on
# removal), and iproute2 by honk-check.
depends=('systemd' 'kmod' 'procps-ng' 'iproute2')
optdepends=(
  'nftables: honk-check NFQUEUE leftovers, and manual rule inspection'
  'bpftool: inspect loaded eBPF programs and pinned maps'
  'v2ray-geoip: geoip.dat for geoip: routing rules'
  'v2ray-domain-list-community: geosite.dat for geosite: routing rules'
)
provides=('honk-core')
conflicts=('honk-core' 'honk-core-bin')
backup=('etc/honk/config.dae')
install="${pkgname}.install"
options=('!strip' '!debug')

_upver='0.1.0-beta.3'
# Literal directory names keep .SRCINFO architecture-correct regardless of which
# host generated it (${CARCH} inside source= would resolve at build time only).
_dir_x86_64="honk-core-v${_upver}-x86_64-unknown-linux-musl-full"
_dir_aarch64="honk-core-v${_upver}-aarch64-unknown-linux-musl-full"

# Release assets cannot go through jsDelivr/Fastly: those CDNs only serve files
# committed inside a repository, so the tarball path returns 404 there (verified
# for both fastly.jsdelivr.net and cdn.jsdelivr.net). Measured from a CN ISP:
#
#   github.com direct   ~2.9 MB/s   (fastest here)
#   gh-proxy.com        ~40 KB/s
#   ghproxy.net         ~130 KB/s
#
# So the default is the upstream URL; override it when github.com is blocked or
# slow on your route:
#
#   makepkg GITHUB_MIRROR=https://gh-proxy.com
#   makepkg GITHUB_MIRROR=https://ghproxy.net
#
# A trailing slash is optional. The sha256s below pin the exact upstream bytes,
# so a broken or hostile mirror fails the build instead of shipping a different
# binary.
_github_mirror="${GITHUB_MIRROR:-}"
[[ -n "$_github_mirror" ]] && _github_mirror="${_github_mirror%/}/"
_dl_base="${_github_mirror}${url}/releases/download/v${_upver}"

source=(
  'honk-core.service'
  'config.dae'
  'honk-check'
  'honk-modules.conf'
  # jsDelivr serves the exact blob of the GitHub tag. raw.githubusercontent.com
  # resets the connection from some ISPs; fastly.jsdelivr.net is reachable.
  "config.example.dae::https://fastly.jsdelivr.net/gh/daeuniverse/honk@v${_upver}/example.dae"
)
source_x86_64=("${_dir_x86_64}.tar.gz::${_dl_base}/${_dir_x86_64}.tar.gz")
source_aarch64=("${_dir_aarch64}.tar.gz::${_dl_base}/${_dir_aarch64}.tar.gz")

sha256sums=('ce16fa1bb208e289fc456945c8eee56df7590e5d2abbffdf405fdee9ed664398'
            'b6c68fe82d768be60ba00f7d3f00d5a4c47fa65a0921d19f0c29a8e22fb940bc'
            '95ef7759d5883f4b0ed43815eed6d1248ab636baad7b46470e0e5abacca5453a'
            'cba5c54fdc2ad776e8df3ac6094af3b6010554508925172b6e240a645630be13'
            '50d1ddbcc901d4e477f5e67ea2092ba364667dea24588929fbf9b2583035679b')
sha256sums_x86_64=('101b1f9bed80eff0a9287fbb7a6d9b933f30e8d9b511fad738d48c501cb8e55c')
sha256sums_aarch64=('9b782c6fcf2594a78aeac309371ec8026dcf3d460e457559e992d6bd91431c50')

prepare() {
  # Upstream's example still points at the pre-0.1 legacy data root and at an
  # eth0 LAN bridge; both would silently misbehave on a desktop.
  sed -e 's|/var/share/honk|/var/lib/honk|g' \
      -e 's|^    lan_interface: eth0$|    # lan_interface: br0  # uncomment and set to your LAN bridge to proxy LAN clients|' \
      "${srcdir}/config.example.dae" > "${srcdir}/config.example.patched.dae"
}

package() {
  local dir
  case "$CARCH" in
    x86_64)  dir="$_dir_x86_64" ;;
    aarch64) dir="$_dir_aarch64" ;;
    *) error "unsupported architecture: $CARCH" ;;
  esac
  cd "$dir"

  install -Dm755 honk-core "${pkgdir}/usr/bin/honk-core"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/doona"
  cp -a doona/. "${pkgdir}/usr/share/licenses/${pkgname}/doona/"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "${srcdir}/honk-core.service" \
    "${pkgdir}/usr/lib/systemd/system/honk-core.service"
  install -Dm755 "${srcdir}/honk-check" "${pkgdir}/usr/bin/honk-check"

  # backup=() needs the parent directory to exist inside the package, otherwise
  # pacman cannot place the file on a fresh install.
  install -d -m 0755 "${pkgdir}/etc/honk"
  install -Dm644 "${srcdir}/config.dae" "${pkgdir}/etc/honk/config.dae"
  install -Dm644 "${srcdir}/config.example.patched.dae" \
    "${pkgdir}/etc/honk/config.dae.example"

  # /usr/lib, not /etc: these are fixed kernel requirements of the package, not
  # administrator configuration.
  install -Dm644 "${srcdir}/honk-modules.conf" \
    "${pkgdir}/usr/lib/modules-load.d/honk.conf"
}
