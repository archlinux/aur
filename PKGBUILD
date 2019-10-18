# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Tom Payne <twpayne@gmail.com>
# Contributor:  <godeater@gmail.com>

pkgname=chezmoi-git
pkgver=1.7.2.r0.g41c4fdc
pkgrel=2
pkgdesc="Manage your dotfiles across multiple machines"
arch=('x86_64')
url='https://github.com/twpayne/chezmoi'
license=('MIT')
makedepends=('go' 'git')
provides=('chezmoi')
conflicts=('chezmoi')
depends=('glibc')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  version_str="$(git describe --tags)"
  commit="$(git rev-parse HEAD)"
  date="$(date "+%H:%M:%S_%d/%m/%Y")"

  go build \
    -tags noupgrade,noembeddocs \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X github.com/twpayne/chezmoi/cmd.DocsDir=/usr/share/doc/$pkgname \
              -X github.com/twpayne/chezmoi/cmd.VersionStr=$version_str \
              -X github.com/twpayne/chezmoi/cmd.Commit=$commit \
              -X github.com/twpayne/chezmoi/cmd.Date=$date \
              -extldflags ${LDFLAGS}" \
    .
}

package() {
  cd "$pkgname"

  install -D "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"

  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/* "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 completions/chezmoi-completion.bash "$pkgdir/usr/share/bash-completion/completions/chezmoi"
  install -Dm644 completions/chezmoi.fish "$pkgdir/usr/share/fish/vendor_completions.d/chezmoi.fish"
  install -Dm644 completions/chezmoi.zsh "$pkgdir/usr/share/zsh/site-functions/_chezmoi"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
