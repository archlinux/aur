# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=shiori
pkgver=1.5.3
pkgrel=1
pkgdesc='Simple bookmark manager'
arch=('x86_64')
url='https://github.com/go-shiori/shiori'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='f000f11bfa02949da91c8c246a88671e4250a1f8'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
sha512sums=('SKIP'
            '5afa2d8d02b414e106d6fcf41d3820b7c0b6c7fc86d12f5439c5d7330db874c0d58c905f646877b5d8b2bcc1ffc33c24756c8e3269c417f4b2abd185a5408de3'
            '23f08378dcd3d40defd969e891a7759a8e59a103b6515d1748da66f1f8eef7a4eff5b02b0f5615a580aa5cde67fcbad98b5c610ed478ee32a4385ad7ee40766d'
            'e0c5cae54966ac24c8227f09577ab0e62f9b0ae025b2667791b8ed773fdce36fe4188d0353ef03e365342126ae05b0faa9c31c0bd938fabe3358136eb5ed1281')
b2sums=('SKIP'
        '675e15e77d7328badaade040af67bbdcc8335de30c4ceef64e60aa761c80c38dc06c3e9cfaca51be6b353b8a2c872c242406ade487c738c50de44e94507ce87a'
        '4a0fe59a05aa1275a3e42bf616ef4f9c0e2ca3639a516f6966ef1689ff20f6e84827ca43ab66e15f31c9628c452a274d5a888f45155100b851fdcecd5c327fe7'
        '1a119411823ab3f6a49ab66c9df7bcad747d594c95aa96918f3f416481ee791533e67ae9789232e7806bd4178d2af18f88c7cc5a1ac06daa3678c7a37adb175a')

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
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    .

  # shell completions
  for shell in bash fish zsh; do
    ./build/shiori completion "$shell" > "build/completion-$shell"
  done
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/shiori

  # shell completions
  install -vDm644 build/completion-bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 build/completion-fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -vDm644 build/completion-zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
