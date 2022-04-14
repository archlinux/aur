# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=doko
pkgver=0.1.1
pkgrel=1
pkgdesc='The docker you know, but with TUI'
arch=('x86_64')
url='https://github.com/abdfnx/doko'
license=('GPL')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='1e0f07029ba62ea5d4005eb79d960102302d2742'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  mkdir build

  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  local _date=$(date -u --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" "+%Y-%m-%d")

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags $LDFLAGS \
    -X main.version=v$pkgver \
    -X main.buildDate=$_date" \
    -o build \
    .

  # create shell completions
  for shell in bash fish zsh; do
    ./build/doko completion "$shell" > "build/$shell-completions"
  done
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/doko

  # shell auto-completions
  install -vDm644 build/bash-completions "$pkgdir/usr/share/bash-completion/completions/doko"
  install -vDm644 build/fish-completions "$pkgdir/usr/share/fish/vendor_completions.d/doko.fish"
  install -vDm644 build/zsh-completions "$pkgdir/usr/share/zsh/site-functions/_doko"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
