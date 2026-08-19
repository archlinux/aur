# Maintainer: Axel Haustant <noirbizarre@gmail.com>
#
# Prebuilt binary package. `0.5.0`, `18fbb9ec2f3918f5a7deafaa5d87b7551d051c7e45c4beb1f274ab2866271104` and `41dcdde22ea5ad64e1b2cbe83bef232b4d96d3d92d816fce54b348a19c845ba4`
# are substituted by .github/workflows/aur.yml from the published release
# assets.

pkgname=git-wipe-bin
_pkgname=git-wipe
pkgver=0.5.0
pkgrel=1
pkgdesc="Wipe out merged local branches and worktrees (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/noirbizarre/git-wipe"
license=('MIT')
depends=('gcc-libs' 'glibc' 'git')
provides=("$_pkgname=$pkgver")
# `replaces`/`conflicts` on the pre-rename name so `pacman -Syu` migrates
# anyone still on git-synchronizer-bin instead of leaving both installed.
conflicts=("$_pkgname" 'git-synchronizer-bin')
replaces=('git-synchronizer-bin')
options=('!strip' '!debug')
# The upstream archives are named after the target only — the tag in the URL is
# what pins the version — so they are renamed here to keep makepkg's source
# cache unambiguous across releases.
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/git-wipe-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/git-wipe-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('18fbb9ec2f3918f5a7deafaa5d87b7551d051c7e45c4beb1f274ab2866271104')
sha256sums_aarch64=('41dcdde22ea5ad64e1b2cbe83bef232b4d96d3d92d816fce54b348a19c845ba4')

package() {
  # The archives carry no leading directory, so their contents — `git-wipe`,
  # `man/`, `completions/`, LICENSE and README.md — land straight in $srcdir.
  cd "$srcdir"

  install -Dm755 git-wipe "$pkgdir/usr/bin/git-wipe"

  # The man pages are not a nicety: git rewrites `git wipe --help` into
  # `git help wipe`, which runs `man git-wipe` and fails without them.
  install -Dm644 -t "$pkgdir/usr/share/man/man1" man/*.1

  install -Dm644 completions/git-wipe.bash \
    "$pkgdir/usr/share/bash-completion/completions/git-wipe"
  install -Dm644 completions/_git-wipe \
    "$pkgdir/usr/share/zsh/site-functions/_git-wipe"
  install -Dm644 completions/git-wipe.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/git-wipe.fish"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
