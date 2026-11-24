# Maintainer: agony <27015 at riseup dot net>

pkgname=mtp-mount-git
pkgver=r82.7dd0821
pkgrel=1
pkgdesc='Mount MTP devices as local filesystems via FUSE (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/vdavid/mtp-mount'
license=('MIT OR Apache-2.0')
depends=('fuse3' 'glibc' 'libgcc')
optdepends=('libmtp: udev rules that give the desktop user access to MTP devices')
makedepends=('cargo' 'git')
provides=('mtp-mount')
conflicts=('mtp-mount')
options=('!lto')
source=("mtp-mount::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd mtp-mount
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd mtp-mount
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd mtp-mount
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd mtp-mount
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd mtp-mount
  install -Dm755 target/release/mtp-mount target/release/mtp-mountd -t "${pkgdir}/usr/bin"
  sed 's|^ExecStart=.*|ExecStart=/usr/bin/mtp-mountd|' dist/mtp-mountd.service > mtp-mountd.service
  install -Dm644 mtp-mountd.service -t "${pkgdir}/usr/lib/systemd/user"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
