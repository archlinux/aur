pkgname=mcp-gearbox-bin
_pkgname=mcp-gearbox
pkgver=0.0.2
_tag=v0.0.2-20251112-095801
pkgrel=2
pkgdesc="Modern MCP server manager for multiple AI agents (binary release)"
arch=('x86_64')
url="https://github.com/rohitsoni007/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'atk' 'at-spi2-core' 'cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
         'libxfixes' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'mesa' 'nss' 'pango')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/rohitsoni007/${_pkgname}/releases/download/${_tag}/${_pkgname}_${pkgver}_amd64.deb"
        "mcp-gearbox.desktop"
        "mcp-gearbox.png"
        "LICENSE")
sha256sums=('beab004c86db5cbdcc2d8db05eb4e18cf07ca4f4852ef4978496f96d96e46f84'
            '9442af73cae749b3bb09dac6564e440abd1c0f80f8d0410190b08cbde5e767c2'
            '9f6e9d0f39ef3f78a5e72aae8c6ebf7c5e39b078398e4c1b154e80c492330981'
            '1557fb5ac94058a3af1e3a11c78a47c2370533d6dfd931166cf2012adfb87fbb')

prepare() {
  cd "${srcdir}"
  rm -f data.tar.* control.tar.*
  bsdtar -xf "${_pkgname}_${pkgver}_amd64.deb"
}

package() {
  cd "${srcdir}"
  local data_tar
  data_tar=$(find . -maxdepth 1 -name 'data.tar.*' -print -quit)
  bsdtar -xf "${data_tar}" -C "${pkgdir}"

  rm -rf "${pkgdir}/usr/share/doc" || true

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'WRAPPER'
#!/bin/sh
exec /usr/lib/mcp-gearbox/mcp-gearbox "$@"
WRAPPER

  install -Dm644 "${srcdir}/mcp-gearbox.desktop" "${pkgdir}/usr/share/applications/mcp-gearbox.desktop"
  install -Dm644 "${srcdir}/mcp-gearbox.png" "${pkgdir}/usr/share/pixmaps/mcp-gearbox.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
