# Maintainer: Gabriel Menezes <gabrielsmenezes99@gmail.com>
#
# Binary package: installs the prebuilt Linux binary that
# .github/workflows/release-binaries.yml attaches to the release. No Rust
# toolchain, no compile. The from-source counterpart is `ivar` (PKGBUILD).
#
# The asset names below are the same contract scripts/install.sh depends on —
# bare binaries named `ivar-linux-<arch>`, not archives named for the Rust
# target triple. Changing one without the other breaks both installers.
#
# This file is the source of truth; the AUR repo is a publish target.
# .github/workflows/release-aur.yml rewrites pkgver/pkgrel/sha256sums and
# pushes it. Do not hand-edit those fields in the AUR checkout.

pkgname=ivar-bin
_pkgname=ivar
pkgver=0.21.0
pkgrel=1
pkgdesc="Multi-repo worktrees for coding agents: one feature across repos, on one branch, one PR per repo (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mnzsss/ivar"
license=('Apache-2.0')
# git is a runtime dependency: ivar reads through libgit2 but every mutation
# shells out to the git binary (docs/adr/0001 §3).
depends=('gcc-libs' 'glibc' 'git')
optdepends=(
    'github-cli: authentication and pull requests without exporting a token'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# !strip: [profile.release] sets strip = true, so the asset arrives stripped —
#   and on aarch64 built elsewhere there is nothing local that could strip it.
# !debug: same reason, there are no symbols for a -debug package.
options=('!strip' '!debug')

# Arch-independent: the licence texts, which the binary asset does not carry.
source=(
    "$_pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/mnzsss/$_pkgname/v$pkgver/LICENSE"
    "$_pkgname-$pkgver-NOTICE::https://raw.githubusercontent.com/mnzsss/$_pkgname/v$pkgver/NOTICE"
)
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30' '1e7b87100a718e00eddad62c6b0f28b1d6c7fe59421b62f7e504e956981947ec')

source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64")
sha256sums_x86_64=('44d272e6b65f6c52c2bfaf8d46c36a2ad1ab93b71e19d46cb60fc11adc171ca3')
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64")
sha256sums_aarch64=('b923bbd4372007a0dbc20925ec4fb4185ba4b355d39b42c7cd65647a7dceb96f')

package() {
    install -Dm0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
    install -Dm0644 "$srcdir/$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm0644 "$srcdir/$_pkgname-$pkgver-NOTICE" "$pkgdir/usr/share/licenses/$_pkgname/NOTICE"
}
