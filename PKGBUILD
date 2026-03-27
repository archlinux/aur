# Maintainer: Fredrik Söderström <tirithen@gmail.com>
pkgname=goose-agent-bin
pkgver=1.28.0
pkgrel=1
pkgdesc="Codename Goose AI agent CLI from Block (binary release)"
arch=('x86_64')
url="https://github.com/block/goose"
license=('custom')
provides=('goose-agent')
conflicts=()
depends=('glibc')
makedepends=()
options=('!strip')

source_x86_64=("https://github.com/block/goose/releases/download/v${pkgver}/goose-x86_64-unknown-linux-gnu.tar.bz2")
sha256sums_x86_64=('41049f6f7b1f460f3807c5b91bded5869ff0f1b098d7c06772e359064d65074b')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/bin"

  # Extract the downloaded tarball
  tar -xjf "goose-x86_64-unknown-linux-gnu.tar.bz2"

  # Install the CLI as goose-agent to avoid conflict with the legacy DB tool
  install -m755 goose "${pkgdir}/usr/bin/goose-agent"

  install -dm755 "${pkgdir}/etc/profile.d"
  cat > "${pkgdir}/etc/profile.d/goose-agent.sh" << 'EOF'
if ! command -v goose >/dev/null 2>&1; then
  alias goose='goose-agent'
fi
EOF

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
This package repackages the prebuilt Codename Goose CLI from Block.
See https://github.com/block/goose for the full license terms.
EOF
}
