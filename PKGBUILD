# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=vhs
pkgver=0.2.0
pkgrel=1
pkgdesc='A tool for recording terminal GIFs'
arch=('x86_64')
url='https://github.com/charmbracelet/vhs'
license=('MIT')
depends=('ffmpeg' 'ttyd')
makedepends=('git' 'go')
options=('!lto')
_commit='6f7cc819032319a4bbef579d82c41b66bc0c427a'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.Version=v$pkgver \
    -X main.CommitSHA=$_commit \
    -X main.CommitDate=$(git show --no-patch --format=%cd --date=format:%Y-%m-%d)" \
    -o build \
    .

  # man page
  ./build/vhs man > build/vhs.1

  # completions
  for shell in bash fish zsh; do
    ./build/vhs completion "$shell" > "build/$shell-completion"
  done
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/vhs

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" build/vhs.1

  # completions
  install -vDm644 build/bash-completion "$pkgdir/usr/share/bash-completion/completions/vhs"
  install -vDm644 build/fish-completion "$pkgdir/usr/share/fish/vendor_completions.d/vhs.fish"
  install -vDm644 build/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_vhs"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
