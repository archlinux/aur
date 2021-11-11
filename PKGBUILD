# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mani
pkgver=0.10.0
pkgrel=1
pkgdesc="A CLI tool that helps you manage multiple repositories"
arch=('x86_64')
url="https://manicli.com"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alajmo/mani/archive/v$pkgver.tar.gz")
sha512sums=('13ab299abe4c085b5c96eb1f58037e213f2f8f98d33869ad7d1269997b5735d90c264063f7c25ee7086a4a6c02ea95830175fce1f1639c4eea4e5e962a97c518')
b2sums=('dae0eeec02646061f345b5b7b5383da724828c9c5cce1de781822543d90bdb11dde8cf28483c1934266f742cb8bbb22a22b337812d271649f4200959bcff2131')

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
