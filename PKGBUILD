# Maintainer: kvtodev kvtodev@outlook.com

pkgname=ollama-proxy
pkgver=1.0.2
pkgrel=1
pkgdesc="Proxy to wrap local Ollama requests with basic auth and HTTPS to remote auth-required service"
arch=('x86_64' 'aarch64')
url="https://github.com/k88936/ollama-proxy"
license=('custom:unknown')
depends=()
makedepends=('cargo')
source=("${pkgname}::git+${url}.git"
  "ollama-proxy@.service"
  )
sha256sums=('SKIP'
            'SKIP')


build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release
}

package() {

  cd "${srcdir}/${pkgname}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # systemd service template for per-user instances
  install -Dm644 "${srcdir}/ollama-proxy@.service" "${pkgdir}/usr/lib/systemd/system/ollama-proxy@.service"

  # docs
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # license placeholder (none in repo)
  echo "No explicit license provided upstream." > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # post-install hint (shown during packaging build logs)
  echo "==> Reminder: After installation, start/enable the systemd service template:"
  echo "    sudo systemctl enable --now ollama-proxy@<user>.service"
  echo "    systemctl status ollama-proxy@<user>.service"
}
