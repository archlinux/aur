pkgname=gospt-git
pkgver=0.0.7.r1.gdcfc0d4
pkgrel=1
pkgdesc='Spotify TUI And CLI written in Go'
arch=('x86_64')
url="https://git.asdf.cafe/abs3nt/gospt"
license=('GPL')
provides=(gospt)
conflicts=(gospt)
makedepends=('go')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd gospt
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -buildmode=pie -trimpath -ldflags="-linkmode=external -s -w -X 'git.asdf.cafe/abs3nt/gospt/src.cmd.Version=v${pkgver}'" -mod=readonly -modcacherw .
  ./gospt completion zsh > gospt_zsh
  ./gospt completion bash > gospt_bash
  ./gospt completion fish > gospt_fish
}

package() {
  cd "gospt"
  install -Dm755 gospt "$pkgdir"/usr/bin/gospt
  install -Dm644 gospt_zsh "$pkgdir"/usr/share/zsh/site-functions/_gospt
  install -Dm644 gospt_bash "$pkgdir"/usr/share/bash-completion/completions/gospt
  install -Dm644 gospt_fish "$pkgdir"/usr/share/fish/vendor_completions.d/gospt.fish
}
