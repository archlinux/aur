# Maintainer: duanluan <duanluan@outlook.com>

pkgname=pi-agent-desktop-bin
_pkgname=pi-agent-desktop
_appname='Pi Agent'
pkgver=0.3.3
pkgrel=1
pkgdesc='Desktop UI for browsing sessions and working with the pi coding agent (prebuilt binary)'
arch=('x86_64')
url='https://github.com/abcwyc/pi-agent-desktop'
license=('MIT')
depends=('gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${_appname// /_}_${pkgver}_amd64.deb::https://github.com/abcwyc/pi-agent-desktop/releases/download/v${pkgver}/Pi.Agent_${pkgver}_amd64.deb"
        'LICENSE')
sha256sums=('32ee449b3e9eb97b22ae164a11c9ee16a1694546861a0c7e660f2b72ab8e49ba'
            '19cee3b1b8fd9b42f9515366bc1a7dfaaf22fcb006234ebb85ff2f6f8c52eb2b')

package() {
  local extract_dir="${srcdir}/deb-extract"

  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"
  bsdtar -C "${extract_dir}" -xf "${srcdir}/${_appname// /_}_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${extract_dir}/data.tar.gz"

  mv "${pkgdir}/usr/bin/${_pkgname}" \
    "${pkgdir}/usr/lib/${_appname}/${_pkgname}"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'SCRIPT'
#!/bin/sh
export WEBKIT_DISABLE_DMABUF_RENDERER="${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"
exec '/usr/lib/Pi Agent/pi-agent-desktop' "$@"
SCRIPT

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
