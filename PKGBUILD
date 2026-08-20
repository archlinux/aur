# Maintainer: lugas7
_pkgname=terminal-browser
pkgname=terminal-browser-bin
pkgver=0.5.8
pkgrel=2
pkgdesc="A browser that runs directly inside your existing terminal"
arch=('x86_64' 'aarch64')
url="https://terminal-browser.sh"
license=('MIT')
depends=('nss' 'gtk3' 'alsa-lib' 'mesa')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source=("LICENSE-${pkgname}::https://raw.githubusercontent.com/zenbu-labs/terminal-browser/v${pkgver}/LICENSE")
sha256sums=('SKIP')

source_x86_64=("https://terminal-browser.sh/install/dl/stable/v${pkgver}/terminal-browser-linux-x64.tar.gz")
sha256sums_x86_64=('c330be3341ef6f6cb106e4fb32c1d60754a08e1a7641143a7a6a4d9e9448f617')

source_aarch64=("https://terminal-browser.sh/install/dl/stable/v${pkgver}/terminal-browser-linux-arm64.tar.gz")
sha256sums_aarch64=('9ffe7fc1f2a309ed0be48c2f35fba534f38163d64c22c0c7dc539949d4f19e71')

noextract=("terminal-browser-linux-x64.tar.gz" "terminal-browser-linux-arm64.tar.gz")

package() {
  install -Dm644 "${srcdir}/LICENSE-${pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/opt/terminal-browser"

  if [ "${CARCH}" = "x86_64" ]; then
    tar -xzf "${srcdir}/terminal-browser-linux-x64.tar.gz" -C "${pkgdir}/opt/terminal-browser" --strip-components 1
  elif [ "${CARCH}" = "aarch64" ]; then
    tar -xzf "${srcdir}/terminal-browser-linux-arm64.tar.gz" -C "${pkgdir}/opt/terminal-browser" --strip-components 1
  fi

  install -d "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/terminal-browser" <<EOF
#!/bin/sh
exec /opt/terminal-browser/bin/terminal-browser "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/terminal-browser"
}
