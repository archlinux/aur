# Maintainer: tctinh
pkgname=agentic-hive-git
_pkgname=agentic-hive
pkgver=0.1.0.r62.g4840de9
pkgrel=1
pkgdesc="Persistent Unix habitat for Claude Code, Codex, OpenCode and Antigravity agents sharing projects"
arch=('any')
url="https://github.com/tctinh/agentic-hive"
license=('MIT')
depends=(
  'acl'
  'bash'
  'coreutils'
  'findutils'
  'gawk'
  'git'
  'grep'
  'jq'
  'ncurses'
  'python'
  'python-markdown-it-py'
  'ripgrep'
  'sed'
  'sudo'
  'systemd'
  'tmux'
  'util-linux'
)
makedepends=('git')
optdepends=(
  'claude-code: Claude Code member harness'
  'openai-codex: Codex member harness'
  'opencode: OpenCode member harness'
  'antigravity-cli: Antigravity (agy) member harness'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=(
  'etc/profile.d/agentic-hive.sh'
  'etc/tmux.conf.d/agentic-hive.conf'
)
install=agentic-hive.install
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local base
  base=$(sed -n 's/^ *version = "\([^"]*\)";/\1/p' nix/package.nix | head -n1)
  printf '%s.r%s.g%s' "${base:-0.1.0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

check() {
  cd "$_pkgname"
  python test/harnesses.py
  python test/config.py
  python test/runtime.py
  python test/prompt.py
  bash test/smoke.sh bin
}

package() {
  cd "$_pkgname"
  local share="$pkgdir/usr/share/agentic-hive" arch=packaging/arch f

  for f in bin/*; do
    [[ -f $f ]] && install -Dm755 "$f" "$pkgdir/usr/bin/${f#bin/}"
  done
  while IFS= read -r -d '' f; do
    install -Dm644 "share/$f" "$share/$f"
  done < <(cd share && find . -type f ! -path '*/__pycache__/*' ! -name '*.pyc' -printf '%P\0')
  chmod 755 "$share/antigravity/agentic-hive/hook.sh"
  install -Dm644 "$arch/claude-managed-settings.json" "$share/claude-managed-settings.json"

  install -Dm644 "$arch/agentic-hive.sysusers" "$pkgdir/usr/lib/sysusers.d/agentic-hive.conf"
  install -Dm644 "$arch/agentic-hive.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/agentic-hive.conf"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$arch/agentic-hive-init.service" "$arch/hive-web.service"
  install -Dm644 "$arch/agentic-hive.profile.sh" "$pkgdir/etc/profile.d/agentic-hive.sh"
  install -Dm644 "$arch/agentic-hive.tmux.conf" "$pkgdir/etc/tmux.conf.d/agentic-hive.conf"

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md SPEC.md
  install -Dm644 install/README.md "$pkgdir/usr/share/doc/$_pkgname/INSTALL.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r --no-preserve=ownership docs "$pkgdir/usr/share/doc/$_pkgname/"
}
