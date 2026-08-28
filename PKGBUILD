# Maintainer: lugas7
_pkgname=terminal-browser
pkgname=terminal-browser-bin
pkgver=0.7.3
pkgrel=2
pkgdesc="A browser that runs directly inside your existing terminal"
arch=('x86_64' 'aarch64')
url="https://terminal-browser.sh"
license=('MIT')
depends=('nss' 'gtk3' 'alsa-lib' 'mesa')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')

source=("LICENSE-${pkgname}::https://raw.githubusercontent.com/zenbu-labs/terminal-browser/v${pkgver}/LICENSE")
sha256sums=('SKIP')

source_x86_64=("https://terminal-browser.sh/install/dl/stable/v${pkgver}/terminal-browser-linux-x64.tar.gz")
sha256sums_x86_64=('f7ffae405e123ea583a54351fcb1b13f5058a19cc7c27423c31525bccaea1eb9')

source_aarch64=("https://terminal-browser.sh/install/dl/stable/v${pkgver}/terminal-browser-linux-arm64.tar.gz")
sha256sums_aarch64=('49aa78993fa9ccba99e4ae8104096d75cad378768e21712d0bcfb350c683f02f')

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
