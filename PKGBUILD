# Maintainer: Rushikesh Gaikwad <rushikeshwastaken@gmail.com>
pkgname=ice-cli-bin
_upname=ice
pkgver=0.0.1
pkgrel=2
pkgdesc="Ice CLI streaming player (prebuilt binary - tracks latest GitHub release)"
arch=('x86_64' 'aarch64')
url="https://github.com/Wraient/ice"
license=('MIT')
depends=('mpv')
optdepends=('rofi: graphical selection via rofi')
provides=("${_upname}=${pkgver}" "ice-cli")
conflicts=("${_upname}" "ice-cli")

_src_linux_amd64="${_upname}-linux-amd64"
_src_linux_arm64="${_upname}-linux-arm64"

source_x86_64=("${_src_linux_amd64}::https://github.com/Wraient/${_upname}/releases/latest/download/${_upname}-linux-amd64" \
               "LICENSE::https://raw.githubusercontent.com/Wraient/${_upname}/main/LICENSE")
source_aarch64=("${_src_linux_arm64}::https://github.com/Wraient/${_upname}/releases/latest/download/${_upname}-linux-arm64" \
                "LICENSE::https://raw.githubusercontent.com/Wraient/${_upname}/main/LICENSE")

sha256sums_x86_64=('SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')

pkgver() {
  command -v curl >/dev/null 2>&1 || { printf '%s' "$pkgver"; return; }
  local latest
  latest=$(curl -Is https://github.com/Wraient/${_upname}/releases/latest | sed -n 's/^location: .*\/tag\/v\?\([^[:space:]]*\).*/\1/p' | tr -d '\r')
  if [[ -n $latest ]]; then
    printf '%s' "$latest"
  else
    printf '%s' "$pkgver"
  fi
}

build() { :; }

package() {
  cd "$srcdir"
  case "$CARCH" in
    x86_64)
      install -Dm755 "${_src_linux_amd64}" "$pkgdir/usr/bin/${_upname}"
      ;;
    aarch64)
      install -Dm755 "${_src_linux_arm64}" "$pkgdir/usr/bin/${_upname}"
      ;;
  esac
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et
