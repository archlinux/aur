# Maintainer: Thomas Clarke <colonia_duck@posteo.net>
pkgname="elite-beep-beep-git"
_pkgname="elite-beep-beep"
pkgver=r13.05d910a
pkgrel=1
pkgdesc="Elite Dangerous player indicator"
arch=("x86_64")
url="https://github.com/CMDR-WDX/elite-beep-beep"
license=('GPL-3.0')
depends=('glibc' 'alsa-lib' 'gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-*}=$pkgver")
conflicts=("elite-beep-beep")
source=(
  'git+https://github.com/CMDR-WDX/elite-beep-beep.git'
)
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
