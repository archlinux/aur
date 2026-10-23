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
pkgver=26.10.23
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
sha256sums_x86_64=('ec1eae5192686eda6539e5cac7bbd5fa1b635b6b0e0c174052fa5c80e38b9ef0' 'e3dd8db23eb85077605a024655643b6a599398cd3101ddae58dd8412df7eba9e')
sha256sums_aarch64=('f7d966bc7ba94dbea0028d41403d65f1d5c7d3d016a492df4ec1a109e6b20ee8' '53bd8befeb2421b9891a8b58e490dbef74bf22df8dfdcc4919bba81af7cb064e')

package() {
  install -Dm755 "margin-launcher-${pkgver}-${CARCH}" "$pkgdir/usr/bin/$_pkgname"
  # The seed: enlaunch's default Seed is /usr/lib/<project>, and its bin/<name>
  # is what the launcher execs while the user's home has no build.
  install -Dm755 "margin-${pkgver}-${CARCH}" "$pkgdir/usr/lib/margin/bin/margin"
}
