# Maintainer: H3mul <phil.d324@gmail.com>
_pkgname=lfs-dal
pkgname=lfs-dal-git
pkgbase=lfs-dal-git
pkgver=0.1.3.r0.g7518ad2
pkgrel=1
pkgdesc='A custom transfer agent for Git LFS powered by OpenDAL.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/regen100/lfs-dal'
license=('MIT')
makedepends=('cargo' 'git')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')
conflicts=($_pkgname)
OPTIONS=(strip docs !libtool !staticlibs !lto)

pkgver() {
   cd "$_pkgname"
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}
