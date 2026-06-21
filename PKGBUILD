# Maintainer: Paulo Manrique <4464977+paulomanrique@users.noreply.github.com>

pkgname=latency-map-git
pkgver=0.0.6.r2.gb3c2c0e
pkgrel=1
pkgdesc='Desktop latency benchmarking app with Electron and native system network tools'
arch=('x86_64' 'aarch64')
url='https://github.com/paulomanrique/latency-map'
license=('Unlicense')
depends=('traceroute')
makedepends=('git' 'nodejs' 'npm')
optdepends=('iputils: tracepath fallback on Linux')
provides=('latency-map')
conflicts=('latency-map' 'latency-map-bin')
options=('!strip')
source=(
  'git+https://github.com/paulomanrique/latency-map.git'
  'latency-map.desktop'
  'latency-map.sh'
)
sha256sums=(
  'SKIP'
  '52267164dcca52da84ad8944dccdb808de2e8c263047e4b43eb2204bf29eb123'
  '180daf21d0a54515604a8ce4c61fb861f3f04cca66700e2732876725c053fc56'
)

pkgver() {
  cd "${srcdir}/latency-map"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/latency-map"
  npm ci --cache "${srcdir}/npm-cache"
}

build() {
  cd "${srcdir}/latency-map"

  local electron_arch
  case "${CARCH}" in
    x86_64)
      electron_arch='x64'
      ;;
    aarch64)
      electron_arch='arm64'
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  GH_RELEASE_OWNER='paulomanrique' \
    GH_RELEASE_REPO='latency-map' \
    npm run package -- --linux dir "--${electron_arch}"
}

package() {
  cd "${srcdir}/latency-map"

  install -d "${pkgdir}/opt/latency-map"
  cp -a dist/linux-unpacked/. "${pkgdir}/opt/latency-map/"
  install -Dm755 "${srcdir}/latency-map.sh" "${pkgdir}/usr/bin/latency-map"
  install -Dm644 "${srcdir}/latency-map.desktop" "${pkgdir}/usr/share/applications/latency-map.desktop"
  install -Dm644 assets/icon.png "${pkgdir}/usr/share/pixmaps/latency-map.png"
}
