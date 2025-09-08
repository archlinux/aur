# Maintainer: Marco Huenseler <marco@wuthoehle.de>

pkgname=bootc-git-composefs
_pkgname=bootc
pkgver=1.7.1.r61.g023be10
pkgrel=1
pkgdesc="Boot and upgrade via container images (composefs branch)"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://bootc-dev.github.io/bootc"
_url="https://www.github.com/$_pkgname-dev/$_pkgname"
license=('MIT OR Apache-2.0')
depends=(gcc-libs
  glibc
  ostree
  bootupd
  dracut)
makedepends=(cargo
  git)
provides=("bootc=$pkgver")
conflicts=('bootc'
  'bootc-git')
source=("git+$_url.git#branch=composefs-backend")
sha256sums=('SKIP')
# options=(!lto)

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 --match="v*" HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/bootc target/release/system-reinstall-bootc -t "${pkgdir}/usr/bin"
  install -Dm755 target/release/bootc-initramfs-setup -t "${pkgdir}/usr/lib/bootc"
  install -Dm644 crates/initramfs/bootc-root-setup.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 crates/initramfs/dracut/module-setup.sh -t "${pkgdir}/usr/lib/dracut/modules.d/37composefs"
  install -Dm755 -d "${pkgdir}/usr/share/doc/$pkgname"
  cp -Rv docs/src/* "${pkgdir}/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
