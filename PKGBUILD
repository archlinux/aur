# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mani
pkgver=0.11.0
pkgrel=1
pkgdesc="A CLI tool that helps you manage multiple repositories"
arch=('x86_64')
url="https://manicli.com"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alajmo/mani/archive/v$pkgver.tar.gz")
sha512sums=('c6ab00faa363dff0b3788753e7a88869448a62401c6238a1fde930d87a989691c8a01d0d39c823a01b19987c56ee01575371a5fdfb09f64f7ca092901d740487')
b2sums=('ed7f9b8cb4204c9a131d1ef5e48897ac76cf9f645deb0b03a80857e81b9b0f0976200341093b1730fff09beffb6bf4dd5838768234716bbbda590a7cf02c92f6')

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
