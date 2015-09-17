# Maintainer: Christopher Reimer <mail+aur[at]c-reimer[dot]de>
pkgname=cargo
pkgver=0.5.0
pkgrel=1
pkgdesc="Rust package manager"
url="http://crates.io/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('custom')
depends=('curl' 'rust')
makedepends=('cmake' 'git' 'python')
conflicts=('cargo-bin')
source=("git+https://github.com/rust-lang/cargo.git#tag=$pkgver")
options=('!emptydirs')
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname}"

  ./configure --prefix=/usr \
              --enable-optimize
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  #Contains reference to $srcdir and $pkgdir
  find "$pkgdir" -name install.log -delete
  find "$pkgdir" -name manifest-cargo -delete

  #Conflict with rust package
  find "$pkgdir" -name uninstall.sh -delete

  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  mv "$pkgdir/usr/etc/bash_completion.d/cargo" "$pkgdir/usr/share/bash-completion/completions/cargo"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir"/usr/share/doc/cargo/LICENSE* "$pkgdir/usr/share/licenses/$pkgname"
}
