# Maintainer: Izu <ccatdev@proton.me>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=virtiofsd-git
_pkgname="${pkgname%-git}"
pkgver=1.13.3.r15.g4786298
pkgrel=1
pkgdesc="Vhost-user virtio-fs device backend written in Rust"
arch=(x86_64)
url="https://gitlab.com/virtio-fs/virtiofsd"
license=(
  Apache-2.0
  BSD-3-Clause
)
depends=(
  gcc-libs
  glibc
  libcap-ng
  libseccomp
)
makedepends=(cargo)
provides=('virtiofsd')
conflicts=('virtiofsd')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  # use /usr/lib instead of /usr/libexec: https://gitlab.com/virtio-fs/virtiofsd/-/issues/86
  sed 's/libexec/lib/' -i 50-$_pkgname.json

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $_pkgname
  cargo build --frozen --release
}

check() {
  cd $_pkgname
  cargo test --frozen
}

package() {
  cd $_pkgname
  install -vDm 755 target/release/$_pkgname -t "$pkgdir/usr/lib/"
  install -vDm 644 50-$_pkgname.json -t "$pkgdir/usr/share/qemu/vhost-user/"
  install -vDm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$_pkgname/"
  install -vDm 644 README.md doc/*.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}
