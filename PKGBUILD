# Maintainer: David Birks <david@birks.dev>

pkgname=mcp-agent-mail-git
pkgver=r389.f40446f
pkgrel=1
pkgdesc='A mail-like coordination layer for coding agents'
arch=('any')
url='https://github.com/Dicklesworthstone/mcp_agent_mail'
license=('MIT')
depends=('uv' 'python' 'curl' 'jq')
makedepends=('git')
provides=("mcp-agent-mail=${pkgver}")
conflicts=('mcp-agent-mail')
options=('!debug')
install='mcp-agent-mail-git.install'
source=(
  "${pkgname}::git+https://github.com/Dicklesworthstone/mcp_agent_mail.git"
  'mcp-agent-mail.sh'
  'mcp-agent-mail-server.sh'
  'mcp-agent-mail-setup.sh'
  'use-xdg-config-dir.patch'
  'fix-project-root.patch'
)
b2sums=(
  'SKIP'
  '2b652e1ffcfecb777526204c1508cac859bdac595b9815e26e19a1d421dc8f2d28f88ed830cc9121ddc309f735527ce42bbf986f9e54a28e3cf490f483d8f5e8'
  '63e62022183b61677aa812e848d3e9161036c77ba93e1e35ad45051d02434ef15efa87fa62c604c31247034d1f810d07cb865299041704705467c85560435ce7'
  '4b268d32a9fcd3bb4005e958be165a3358fabca67628de702ff8d1da561127ee2b9a202213a209f87d714ed9f901a83c51f778069ae25fef7f581e794ce7857c'
  '19092592be5755978a0242356656fe160ea51e1ebf657769c3c00b30b5dd290128335b141ab85c3d78280ad5db9cafcfb243f6ccfe56e9a28ebf38c1986cf2a8'
  'c8320e57bb1e7adfaeb20b88cb29b05d76b68e4f174fb33d6ca0645d370887c004647a186a5c4bdbb9374e45057e1ffe29724fcb6941d09278a7620365f9d97a'
)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  patch -p1 < "$srcdir/use-xdg-config-dir.patch"
  patch -p1 < "$srcdir/fix-project-root.patch"
}

build() {
  cd "$pkgname"
  uv build --wheel
}

package() {
  cd "$pkgname"

  # Create venv and install wheel
  uv venv "$pkgdir/usr/lib/$pkgname/venv" --python 3.14
  uv pip install --python "$pkgdir/usr/lib/$pkgname/venv/bin/python" dist/*.whl

  # Install wrapper scripts
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/mcp-agent-mail.sh" "$pkgdir/usr/bin/mcp-agent-mail"
  install -Dm755 "$srcdir/mcp-agent-mail-server.sh" "$pkgdir/usr/bin/mcp-agent-mail-server"
  install -Dm755 "$srcdir/mcp-agent-mail-setup.sh" "$pkgdir/usr/bin/mcp-agent-mail-setup"

  # Create 'am' symlink (matches upstream alias)
  ln -s mcp-agent-mail "$pkgdir/usr/bin/am"

  # Install scripts directory
  install -dm755 "$pkgdir/usr/share/mcp-agent-mail/scripts"
  install -dm755 "$pkgdir/usr/share/mcp-agent-mail/scripts/hooks"

  # Install main scripts
  for script in lib.sh \
                run_server_with_token.sh \
                automatically_detect_all_installed_coding_agents_and_install_mcp_agent_mail_in_all.sh \
                integrate_claude_code.sh \
                integrate_codex_cli.sh \
                integrate_cursor.sh \
                integrate_gemini_cli.sh \
                integrate_cline.sh \
                integrate_windsurf.sh \
                integrate_opencode.sh \
                integrate_github_copilot.sh; do
    install -Dm755 "scripts/$script" "$pkgdir/usr/share/mcp-agent-mail/scripts/$script"
  done

  # Install hook scripts
  for hook in check_inbox.sh codex_notify.sh; do
    if [[ -f "scripts/hooks/$hook" ]]; then
      install -Dm755 "scripts/hooks/$hook" "$pkgdir/usr/share/mcp-agent-mail/scripts/hooks/$hook"
    fi
  done

  # Patch scripts to use our installed wrapper instead of 'uv run python -m mcp_agent_mail.cli'
  find "$pkgdir/usr/share/mcp-agent-mail/scripts" -name '*.sh' -exec \
    sed -i 's|uv run python -m mcp_agent_mail\.cli|mcp-agent-mail|g' {} \;

  # Patch 'uv run python' (for inline scripts) to use our venv's Python
  find "$pkgdir/usr/share/mcp-agent-mail/scripts" -name '*.sh' -exec \
    sed -i 's|uv run python|/usr/lib/mcp-agent-mail-git/venv/bin/python|g' {} \;

  # Patch scripts to find lib.sh and other scripts in installed location
  find "$pkgdir/usr/share/mcp-agent-mail/scripts" -name '*.sh' -exec \
    sed -i 's|\./scripts/|/usr/share/mcp-agent-mail/scripts/|g' {} \;

  # Patch ROOT_DIR references to use installed scripts location
  find "$pkgdir/usr/share/mcp-agent-mail/scripts" -name '*.sh' -exec \
    sed -i 's|"$ROOT_DIR/scripts/|"/usr/share/mcp-agent-mail/scripts/|g' {} \;
  find "$pkgdir/usr/share/mcp-agent-mail/scripts" -name '*.sh' -exec \
    sed -i 's|${ROOT_DIR}/scripts/|/usr/share/mcp-agent-mail/scripts/|g' {} \;

  # Patch ROOT_DIR initialization to use XDG config dir (for writable config files)
  find "$pkgdir/usr/share/mcp-agent-mail/scripts" -name '*.sh' -exec \
    sed -i 's|ROOT_DIR=\$(cd "\$(dirname "\$0")/\.\." && pwd)|ROOT_DIR="\${XDG_CONFIG_HOME:-\$HOME/.config}/mcp-agent-mail"|g' {} \;

  # Install README.md for docs command
  install -Dm644 README.md "$pkgdir/usr/share/mcp-agent-mail/README.md"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
