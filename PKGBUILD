# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-applet-caffeine-git
pkgver=r11.af74b93
pkgrel=1
pkgdesc="Caffeine Applet for the COSMIC™ desktop"
arch=('x86_64')
url="https://github.com/tropicbliss/cosmic-ext-applet-caffeine"
license=('MIT')
depends=('cosmic-applets')
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/tropicbliss/cosmic-ext-applet-caffeine.git"
        'justfile.patch')
sha256sums=('SKIP'
            'bcdb963ae64e1ddc6a9a9d24092fab06fe82cac7bbb6f163e2fa0b13383a7fe1')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i ../justfile.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
