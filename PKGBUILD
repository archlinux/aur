# Maintainer: defconxt <trevor@blacktemple.net>
# CIPHER — AI Security Engineering Platform

pkgname=cipher-security
pkgver=2.2.1
pkgrel=1
pkgdesc="AI-powered cybersecurity platform — 1,539 skills, 39 compliance frameworks, autonomous security engine"
arch=('any')
url="https://github.com/defconxt/CIPHER"
license=('AGPL-3.0-only')
depends=('nodejs>=18')
optdepends=(
  'nuclei: vulnerability scanning'
  'katana: web crawling and attack surface discovery'
  'docker: benchmark sandbox and container security testing'
)
makedepends=('npm' 'git')
source=("git+https://github.com/defconxt/CIPHER.git#tag=v${pkgver}")
sha256sums=('SKIP')  # TODO: pin after release — run `makepkg -g` to generate

package() {
  cd "${srcdir}/CIPHER/cli"

  # Install production deps locally (--workspaces=false prevents hoisting to root)
  npm install --production --workspaces=false

  # Install globally into the package directory
  npm install -g --prefix="${pkgdir}/usr" .

  # Copy content directories into the installed package
  local _instdir="${pkgdir}/usr/lib/node_modules/cipher-security"
  for dir in skills knowledge commands agents mappings; do
    if [ -d "${srcdir}/CIPHER/${dir}" ]; then
      cp -r "${srcdir}/CIPHER/${dir}" "${_instdir}/${dir}"
    fi
  done

  # Copy CLAUDE.md (system prompt)
  cp "${srcdir}/CIPHER/CLAUDE.md" "${_instdir}/CLAUDE.md" 2>/dev/null || true

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
