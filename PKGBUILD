# Maintainer: Thomas Butler <goliyth@gmail.com>
pkgname=fnclaude-bin
pkgver=5.3.0
pkgrel=1
pkgdesc="A claude CLI launcher with quality-of-life features (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/fnrhombus/fnclaude"
license=('MIT')
provides=('fnclaude')
conflicts=('fnclaude')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/fnrhombus/fnclaude/releases/download/v$pkgver/fnclaude_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/fnrhombus/fnclaude/releases/download/v$pkgver/fnclaude_Linux_arm64.tar.gz")
sha256sums_x86_64=('c4a5c764a6ab4f4592d7e6b1bece2902ecec843679c623ce33ac97d58ea8c2c4')
sha256sums_aarch64=('a3fdaca937624d679becab5ccc01dda509b9c4301418755b62e65551863c04c2')

package() {
    install -Dm755 fnclaude "$pkgdir/usr/bin/fnclaude"
    # `fnc` is the ergonomic shortcut shipped alongside fnclaude. Shell
    # completions in this repo already register both names.
    ln -s fnclaude "$pkgdir/usr/bin/fnc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install-dir system-prompt fragments. fnclaude reads these at runtime
    # to compose --append-system-prompt for the claude child; `cat` any one
    # to see what claude is being told for a given session type.
    install -dm755 "$pkgdir/usr/share/fnclaude/prompts"
    install -Dm644 prompts/*.md "$pkgdir/usr/share/fnclaude/prompts/"

    # Vendor-namespaced host-aliases LUT for the {host-short} placeholder.
    # Shared with the claude-code-worktree-paths plugin which reads this
    # same file (npm-installed plugins can't write under /usr/share/, so
    # fnclaude-bin owns the canonical system-level copy). User-level
    # override lives at ~/.local/share/fnrhombus/host-aliases.json.
    install -Dm644 host-aliases.json "$pkgdir/usr/share/fnrhombus/host-aliases.json"
}
