# Maintainer: duanluan <duanluan@outlook.com>

pkgname=mind-elixir-bin
_pkgname=mind-elixir
pkgver=1.10.2
pkgrel=1
pkgdesc='Lightweight privacy-focused mind mapping tool (prebuilt binary)'
arch=('x86_64')
url='https://app.mind-elixir.com/'
license=('unknown')
depends=('gtk3' 'hicolor-icon-theme' 'webkit2gtk-4.1')
provides=('mind-elixir')
conflicts=('mind-elixir')
options=('!strip')
source=("Mind.Elixir_${pkgver}_amd64.deb::https://github.com/SSShooter/Mind-Elixir-Desktop-Release/releases/download/app-v${pkgver}/Mind.Elixir_${pkgver}_amd64.deb")
sha256sums=('d5a8b33db26188dfeb14d60a051d98a700ce17feacd196c34c7348b0ddcd9e28')

package() {
  local _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/Mind.Elixir_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.gz"

  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  mv "${pkgdir}/usr/bin/MindElixir" "${pkgdir}/usr/lib/${_pkgname}/MindElixir"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mind-elixir" <<'SCRIPT'
#!/bin/sh
export WEBKIT_DISABLE_DMABUF_RENDERER="${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"
exec /usr/lib/mind-elixir/MindElixir "$@"
SCRIPT

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/MindElixir" <<'SCRIPT'
#!/bin/sh
exec /usr/bin/mind-elixir "$@"
SCRIPT

  sed -i \
    -e 's|^Exec=.*|Exec=mind-elixir %U|' \
    -e 's|^Categories=.*|Categories=Office;Utility;|' \
    "${pkgdir}/usr/share/applications/Mind Elixir.desktop"
}
