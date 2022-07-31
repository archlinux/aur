# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='gum'
pkgver=0.2.0
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
  '85bf131216c5ce7fdfc1c8c72d2eca43d4a57e4ce323792f386317b6bfffb032'
)
sha512sums=(
  '8b8d2ec2fc6090137b6b605b3a22849fd3243b60850a33a0b090724ac846736b9fd348412eba0470fa2cc15a7661cf7ee18f9d214ce2404f70641b6d37a53204'
)
b2sums=(
  'f8e65b592eaf5542f6a1befeb122fb4241342498836b95bb57dd680822fa25d89ffce4633455aad3a1c2af39ab5c8e4ebbfbeb994641894f3efaad7e92a012b2'
)

# eof
