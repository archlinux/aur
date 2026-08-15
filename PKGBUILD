# Maintainer: Axel Haustant <noirbizarre@gmail.com>
#
# Prebuilt binary package. `0.3.0`, `6b45f6afcc9cfdb44d9dd6de0c34cfe5812a0d624b26e798c3566c48699cac16` and `236a36ef8859967afb22efa85291522b083019cadc7fd6d6fac934fc7b6de94b`
# are substituted by .github/workflows/aur.yml from the published release
# assets.

pkgname=git-synchronizer-bin
_pkgname=git-synchronizer
pkgver=0.3.0
pkgrel=1
pkgdesc="Easily synchronize your local branches and worktrees (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/noirbizarre/git-synchronizer"
license=('MIT')
depends=('gcc-libs' 'glibc' 'git')
provides=("$_pkgname=$pkgver" 'git-sync')
conflicts=("$_pkgname")
options=('!strip' '!debug')
# The upstream archives are named after the target only — the tag in the URL is
# what pins the version — so they are renamed here to keep makepkg's source
# cache unambiguous across releases.
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/git-sync-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/git-sync-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6b45f6afcc9cfdb44d9dd6de0c34cfe5812a0d624b26e798c3566c48699cac16')
sha256sums_aarch64=('236a36ef8859967afb22efa85291522b083019cadc7fd6d6fac934fc7b6de94b')

package() {
  # The archives carry no leading directory, so their contents — `git-sync`,
  # `man/`, `completions/`, LICENSE and README.md — land straight in $srcdir.
  cd "$srcdir"

  install -Dm755 git-sync "$pkgdir/usr/bin/git-sync"

  # The man pages are not a nicety: git rewrites `git sync --help` into
  # `git help sync`, which runs `man git-sync` and fails without them.
  install -Dm644 -t "$pkgdir/usr/share/man/man1" man/*.1

  install -Dm644 completions/git-sync.bash \
    "$pkgdir/usr/share/bash-completion/completions/git-sync"
  install -Dm644 completions/_git-sync \
    "$pkgdir/usr/share/zsh/site-functions/_git-sync"
  install -Dm644 completions/git-sync.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/git-sync.fish"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
