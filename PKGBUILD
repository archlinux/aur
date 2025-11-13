pkgname=mcp-gearbox-git
_pkgname=mcp-gearbox
pkgver=0.0.2.20251112.095801.r0.g460ed4d
pkgrel=1
pkgdesc="Modern MCP server manager for multiple AI agents (development snapshot)"
arch=('x86_64')
url="https://github.com/rohitsoni007/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'atk' 'at-spi2-core' 'cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
         'libxfixes' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'mesa' 'nss' 'pango')
makedepends=('git' 'nodejs>=18' 'npm' 'python')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://github.com/rohitsoni007/${_pkgname}.git"
        "mcp-gearbox.desktop"
        "mcp-gearbox.png"
        "LICENSE")
sha256sums=('SKIP'
            '5781878d4bf298ae7f7d324ae9a52ef6d626014b86fdf31570ce986b9a65d312'
            '9f6e9d0f39ef3f78a5e72aae8c6ebf7c5e39b078398e4c1b154e80c492330981'
            '1557fb5ac94058a3af1e3a11c78a47c2370533d6dfd931166cf2012adfb87fbb')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags \
    | sed -E 's/^v//; s/-([0-9]+)-g/.r\1.g/; s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm ci --cache "${srcdir}/npm-cache" --prefer-offline
  npm run package -- --platform=linux --arch=x64
}

package() {
  cd "${srcdir}/${_pkgname}"
  local build_dir="out/${_pkgname}-linux-x64"
  if [[ ! -d "${build_dir}" ]]; then
    printf 'Build output not found: %s\n' "${build_dir}" >&2
    return 1
  fi

  install -d "${pkgdir}/opt/${_pkgname}"
  cp -r "${build_dir}/"* "${pkgdir}/opt/${_pkgname}"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'WRAPPER'
#!/bin/sh
exec /opt/mcp-gearbox/mcp-gearbox "$@"
WRAPPER

  install -Dm644 "${srcdir}/mcp-gearbox.desktop" "${pkgdir}/usr/share/applications/mcp-gearbox.desktop"
  install -Dm644 "${srcdir}/mcp-gearbox.png" "${pkgdir}/usr/share/pixmaps/mcp-gearbox.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
