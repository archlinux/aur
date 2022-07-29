# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='gum'
pkgver=0.1.0
pkgrel=1
pkgdesc='A tool for glamorous shell scripts'
url='https://github.com/charmbracelet/gum'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('MIT')
provides=('gum')
conflicts=('gum')
makedepends=('go')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

build() {
  cd "$pkgname-$pkgver" || exit 1

  # https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -mod=readonly \
    -modcacherw \
     .

  ./gum man > gum.1

  for shell in bash fish zsh; do
    ./gum completion "$shell" > "completions.$shell"
  done
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  # Binary
  install -Dm0755 gum              "$pkgdir/usr/bin/gum"
  # Man page
  install -Dm0644 gum.1            "$pkgdir/usr/share/man/man1/gum.1"
  # Completions
  install -Dm0644 completions.bash "$pkgdir/usr/share/bash-completion/completions/gum"
  install -Dm0644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/gum.fish"
  install -Dm0644 completions.zsh  "$pkgdir/usr/share/zsh/site-functions/_gum"
  # License
  install -Dm0644 LICENSE          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'f89228867cd61ebeae0b7bcc9e8034079da256e2c6bf696a9eceb73fc4c3f2b6'
)
sha512sums=(
  '1890702d190610f87d82dcc3f950e2f545bef1d294249cfcdc68da24ba5f4b6506583fbdfce42aa7cc7ef96e0b0c0c0216b44cb07ec63a5920c3f04a2691000c'
)
b2sums=(
  'c3e3121c2f5dcfa35d2ce2783b8c09ea03ee346904ee0c8a24ea005d5dfd0f986ac95aaa2bf3bcbee046067e1af1ceea857a53afe7d9a54275e35d81daa7c344'
)

# eof
