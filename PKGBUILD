# Maintainer: seulsale <me@seulsale.com>
pkgname=persistent-claude-code-git
_pkgname=persistent-claude-code
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="GTK desktop app for browsing and resuming Claude Code sessions"
arch=('any')
url="https://github.com/seulsale/persistent-claude-code"
license=('MIT')
depends=('python>=3.14' 'python-gobject' 'gtk4' 'libadwaita' 'vte4' 'webkitgtk-6.0' 'ttf-jetbrains-mono')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r src/persistent_claude_code "${pkgdir}/usr/share/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/usr/bin/env bash
exec python3 -c 'import sys; sys.path.insert(0, "/usr/share/${_pkgname}"); from persistent_claude_code.__main__ import main; raise SystemExit(main())' "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "data/io.github.seulsale.PersistentClaudeCode.desktop" \
    "${pkgdir}/usr/share/applications/io.github.seulsale.PersistentClaudeCode.desktop"
  install -Dm644 "data/io.github.seulsale.PersistentClaudeCode.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.seulsale.PersistentClaudeCode.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
