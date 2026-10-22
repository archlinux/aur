# Maintainer: Anatoly Rugalev <anatoly.rugalev@gmail.com>
#
# Rendered by margin's packaging/aur/publish.sh from packaging/aur/PKGBUILD in
# github.com/neuroplastio/margin; change it there.
#
# A launcher plus a seed build (D20), as the Homebrew formula is: the launcher
# is /usr/bin/margin, and a complete margin binary is its seed at
# /usr/lib/margin/bin/margin. The launcher runs the seed while ~/.local/margin
# has no build, so a fresh install works with no network and does not depend
# on the channel being up; `margin update` then installs a newer build into
# ~/.local/margin, which the launcher prefers. pkgver is the release both files
# come from.
pkgname=margin-bin
_pkgname=margin
pkgver=26.10.22
pkgrel=1
pkgdesc="A terminal tool for reviewing markdown and handing the comments back to an agent, speaking hotty 0.5 (a launcher plus a seed build: margin updates itself in ~/.local/margin with margin update)"
arch=('x86_64' 'aarch64')
url="https://github.com/neuroplastio/margin"
license=('Apache-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('github-cli: margin import-pr'
            'neovim: the composer in margin 26.10.03, whose composer is nvim')
# Static Go binaries, stripped when they were built: no debug package, and
# nothing for strip to change about the bytes the sha256s below name.
options=('!strip' '!debug')

_release="https://github.com/neuroplastio/margin/releases/download/${pkgver}"
source_x86_64=("margin-launcher-${pkgver}-x86_64::${_release}/margin-launcher_linux_amd64"
               "margin-${pkgver}-x86_64::${_release}/margin_linux_amd64")
source_aarch64=("margin-launcher-${pkgver}-aarch64::${_release}/margin-launcher_linux_arm64"
                "margin-${pkgver}-aarch64::${_release}/margin_linux_arm64")
sha256sums_x86_64=('5ca5de859e092c6ec91ccd69876e3f191ac6b643b185dc33f46cf524c9f867ef' '825c7bae4f082228ec8e6c8940ea117d5cbce093944462f4f7e3588d8a07a0b4')
sha256sums_aarch64=('554e3609475406fc63ad0f9e52b926fdf65e0a71a7075c2f83ef41f485ef409b' '5454fae4e4cb512f308a46e82bc07a554f04e76a2fde5d7f2f8c4bc7649348e4')

package() {
  install -Dm755 "margin-launcher-${pkgver}-${CARCH}" "$pkgdir/usr/bin/$_pkgname"
  # The seed: enlaunch's default Seed is /usr/lib/<project>, and its bin/<name>
  # is what the launcher execs while the user's home has no build.
  install -Dm755 "margin-${pkgver}-${CARCH}" "$pkgdir/usr/lib/margin/bin/margin"
}
