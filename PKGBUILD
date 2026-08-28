
pkgname=uutils-shadow-git
pkgver=0.2.1.r6.ge374d7a
pkgrel=1
pkgdesc="Rust rewrite of shadow"
url=https://github.com/uutils/shadow
license=('MIT')
arch=('x86_64')
depends=(glibc libgcc libxcrypt)
makedepends=(git pkgconf rust)
source=("${pkgname%-git}::git+${url}.git")
b2sums=('SKIP')
pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd ${pkgname%-git}
  cargo build --release --workspace --bins --exclude uu_shadow
}

package(){
  cd ${pkgname%-git}
  find target/release -maxdepth 1 -executable -type f -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
  rename '' uu- "$pkgdir/usr/bin/"*
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}
}
