# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mani
pkgver=0.21.0
pkgrel=1
pkgdesc='A CLI tool that helps you manage multiple repositories'
arch=('x86_64')
url='https://manicli.com'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='24133e3214fc33342803b4271a194ed7b5484cc0'
source=("$pkgname::git+https://github.com/alajmo/mani.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  local build_time="$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)"

  # build
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/alajmo/mani/cmd.version=$pkgver \
    -X github.com/alajmo/mani/cmd.commit=$_commit \
    -X github.com/alajmo/mani/cmd.date=$build_time" \
    -o build \
    .

  # create shell completions
  for shell in bash zsh fish; do
    ./build/mani completion "$shell" > "build/completion.$shell"
  done
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/mani

  # shell completions
  install -vDm644 build/completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 build/completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -vDm644 build/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
