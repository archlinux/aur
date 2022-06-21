# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sake
pkgver=0.1.8
pkgrel=1
pkgdesc='CLI tool that enables you to run commands on servers via ssh'
arch=('x86_64')
url='https://sakecli.com'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='a53f99c934807872baf10d3388fdb5d12d35878e'
source=("$pkgname::git+https://github.com/alajmo/sake#commit=$_commit")
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
    -X github.com/alajmo/sake/cmd.version=$pkgver \
    -X github.com/alajmo/sake/cmd.commit=$_commit \
    -X github.com/alajmo/sake/cmd.date=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o build \
   .

   # create shell completions
  for shell in bash fish zsh; do
    ./build/sake completion "$shell" > "build/$shell-completions"
  done
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/sake

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" core/sake.1

  # shell auto-completions
  install -vDm644 build/bash-completions "$pkgdir/usr/share/bash-completion/completions/sake"
  install -vDm644 build/fish-completions "$pkgdir/usr/share/fish/vendor_completions.d/sake.fish"
  install -vDm644 build/zsh-completions "$pkgdir/usr/share/zsh/site-functions/_sake"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
