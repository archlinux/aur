# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
#
# Template — not a buildable PKGBUILD. The precompiled counterpart of
# PKGBUILD.template: the executable is the one the publish_aur workflow
# builds and attaches to the GitHub release, everything else comes from the
# release's source tarball. On release that workflow substitutes 0.9.0,
# fills the sha256sums via updpkgsums, generates .SRCINFO, and pushes the
# rendered files to the AUR; nothing is committed back here.
pkgname=workforest-bin
_pkgname=workforest
pkgver=0.9.0
pkgrel=1
pkgdesc="Git worktree forest management: per-branch worktrees with project-defined setup hooks (precompiled)"
arch=(x86_64 aarch64)
url="https://github.com/ArkadyBuryakov/workforest"
license=(MIT)
depends=(git gcc-libs glibc)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Built stripped: nothing to strip, and no debug package to split off.
options=(!strip !debug)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/workforest-linux-x86_64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/workforest-linux-aarch64")
sha256sums=('3fb66547a575bece3130ba1e9e0efe614654871fd504cd5f7f308469b938fc0d')
sha256sums_x86_64=('9f7617b4412c5ea7ed4216b3baa3e9f407af17d8d9176948474b89a3e3cf2fdd')
sha256sums_aarch64=('657ab58347eb128dfe71bd2f3dae78b83f4ec4700359c3c426fa48d3679e615e')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/workforest"
  ln -s workforest "$pkgdir/usr/bin/wf"

  cd "$_pkgname-$pkgver"

  # Man pages, from where the PyPI wheel ships them as data.
  local man=packaging/pypi/data/share/man
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$man/man1/workforest.1" "$man/man1/wf.1"
  install -Dm644 -t "$pkgdir/usr/share/man/man5" "$man/man5/workforest.5" "$man/man5/wf.5"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Shell completions (the wf function itself comes from `workforest shell-init`)
  install -Dm644 resources/shell/completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/workforest"
  install -Dm644 completions/_workforest \
    "$pkgdir/usr/share/zsh/site-functions/_workforest"

  # Reference configs
  install -Dm644 resources/examples/config.yaml \
    "$pkgdir/usr/share/doc/$_pkgname/examples/config.yaml"
  install -Dm644 resources/examples/.workforest.yaml \
    "$pkgdir/usr/share/doc/$_pkgname/examples/workforest.project.yaml"
}
