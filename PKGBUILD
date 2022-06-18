# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=octosql
pkgver=0.7.3
pkgrel=1
pkgdesc='A CLI tool which lets you query a plethora of databases and file formats using SQL'
arch=('x86_64')
url='https://github.com/cube2222/octosql'
license=('MPL2')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='147495a0e11eb4fa519490cc101e370ff5be5726'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed "s/^v//"
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

  # binary
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/cube2222/octosql/cmd.VERSION=$pkgver" \
    -o build \
    .

  # generate shell completions
  for shell in bash fish zsh; do
    ./build/octosql completion "$shell" > "build/$shell.completion"
  done
}

check() {
  cd "$pkgname"
  go test -v ./...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/octosql

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # shell completions
  install -vDm644 build/bash.completion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 build/fish.completion "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -vDm644 build/zsh.completion "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
