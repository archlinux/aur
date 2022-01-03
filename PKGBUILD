# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mani
pkgver=0.11.1
pkgrel=1
pkgdesc="A CLI tool that helps you manage multiple repositories"
arch=('x86_64')
url="https://manicli.com"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alajmo/mani/archive/v$pkgver.tar.gz")
sha512sums=('fcc64d367068ef7e3c2d29b4dbf6ec208e01899ce2ad2ba693e46ae7f6eb10ceddb9f1793a229d2d9ccab0dae015445d0ecf5e562a10fed1f3d702c1636822d1')
b2sums=('a6cb607c718eef90ea7073c03ffe60691926e4c3f6da0270065b0601b7f691f3a66b1ea26c8513937ba69f0201a39277ec052116eaf03f4c6362acf6ffe834b6')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname-$pkgver"

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
    -X github.com/alajmo/mani/cmd.commit=tarball \
    -X github.com/alajmo/mani/cmd.date=$build_time" \
    -o build \
    .

  # create shell completions
  for shell in bash zsh fish; do
    ./build/mani completion "$shell" > "build/completion.$shell"
  done
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # shell completions
  install -vDm644 build/completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 build/completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -vDm644 build/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
