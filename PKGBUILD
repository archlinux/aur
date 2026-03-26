# Maintainer: defconxt <trevor@blacktemple.net>
# CIPHER: AI Security Engineering Platform

pkgname=cipher-pi
pkgver=2.41.5
pkgrel=1
pkgdesc="AI security engineering platform: 1,543 skills, 9 modes, 39 compliance frameworks, engagement engine"
arch=('any')
url="https://github.com/defconxt/CIPHER"
license=('AGPL-3.0-only')
depends=('nodejs>=22')
optdepends=(
  'nuclei: vulnerability scanning'
  'katana: web crawling and attack surface discovery'
  'docker: benchmark sandbox and container security testing'
  'ollama: local LLM inference'
)
makedepends=('npm' 'git')
source=("git+https://github.com/defconxt/CIPHER.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/CIPHER/cli"

  # Install production deps locally
  npm install --production --workspaces=false

  # Install globally into the package directory
  npm install -g --prefix="${pkgdir}/usr" .

  # Copy content directories into the installed package
  local _instdir="${pkgdir}/usr/lib/node_modules/cipher-pi"
  for dir in skills knowledge commands agents data hooks; do
    if [ -d "${srcdir}/CIPHER/${dir}" ]; then
      cp -r "${srcdir}/CIPHER/${dir}" "${_instdir}/${dir}"
    fi
  done

  # System prompt
  cp "${srcdir}/CIPHER/CLAUDE.md" "${_instdir}/CLAUDE.md" 2>/dev/null || true

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
