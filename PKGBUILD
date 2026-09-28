# Maintainer: Jon Tsiros <jon@brightblock.ai>

pkgname=hyprlayer-server-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="Hyprlayer runtime as a headless server, reached over a local socket or SSH"
arch=('x86_64')
url="https://brightblock.ai/hyprlayer"
license=('LicenseRef-proprietary')
# Deliberately no webkit2gtk/gtk3: a headless host runs this without a desktop.
depends=('git')
optdepends=('claude-code: run Claude Code agent sessions'
            'github-cli: PR status and publishing'
            'hyprlayer: thoughts and project management the runtime shells out to')
provides=('hyprlayer-server')
conflicts=('hyprlayer-server')
options=('!strip' '!debug')
_bin="hyprlayer-server-x86_64-unknown-linux-gnu"
source=("${_bin}-${pkgver}::https://github.com/BrightBlock/hyprlayer-releases/releases/download/server-v${pkgver}/${_bin}"
        "hyprlayer-server.service")
sha256sums=('5fbde5e67e1840beb61cc6891ac1909b19fa4c020b62ca62f75778d7a2d5ba4e'
            'e578119d5152948b1ba56576c36825d63bce9ad1266e1c8ac661365cd597adae')

package() {
  install -Dm755 "${srcdir}/${_bin}-${pkgver}" "${pkgdir}/usr/bin/hyprlayer-server"
  # A user unit, never a system one: every RuntimePaths entry is home-relative.
  # Installed, not enabled — `systemctl --user enable --now hyprlayer-server`.
  install -Dm644 "${srcdir}/hyprlayer-server.service" \
    "${pkgdir}/usr/lib/systemd/user/hyprlayer-server.service"
}
