# Maintainer: defconxt <trevor@blacktemple.net>
# NERF: AI Security Engineering Platform

pkgname=nerf-pi
pkgver=1.0.9
pkgrel=1
pkgdesc="AI security engineering platform: 1,563 skills, 9 modes, 39 compliance frameworks, engagement engine"
arch=('any')
url="https://github.com/defconxt/NERF"
license=('AGPL-3.0-only')
depends=('nodejs>=22')
optdepends=(
  'nuclei: vulnerability scanning'
  'katana: web crawling and attack surface discovery'
  'docker: benchmark sandbox and container security testing'
  'ollama: local LLM inference'
)
makedepends=('npm' 'git')
source=("git+https://github.com/defconxt/NERF.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/NERF"

  # Install production deps locally
  npm install --production --workspaces=false

  # Install globally into the package directory
  npm install -g --prefix="${pkgdir}/usr" .

  # Copy content directories into the installed package
  local _instdir="${pkgdir}/usr/lib/node_modules/@defconxt/nerf"
  for dir in skills knowledge commands agents data hooks; do
    if [ -d "${srcdir}/NERF/${dir}" ]; then
      cp -r "${srcdir}/NERF/${dir}" "${_instdir}/${dir}"
    fi
  done

  # System prompt
  cp "${srcdir}/NERF/CLAUDE.md" "${_instdir}/CLAUDE.md" 2>/dev/null || true

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
