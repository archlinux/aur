# Maintainer: agony <27015 at riseup dot net>

pkgname=mtp-mount
pkgver=0.6.0
pkgrel=1
pkgdesc='Mount MTP devices as local filesystems via FUSE'
arch=('x86_64' 'aarch64')
url='https://github.com/vdavid/mtp-mount'
license=('MIT OR Apache-2.0')
depends=('fuse3' 'glibc' 'libgcc')
optdepends=('libmtp: udev rules that give the desktop user access to MTP devices')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-LICENSE-MIT::https://raw.githubusercontent.com/vdavid/mtp-mount/2064badae7adffdacc4c3eaf2c602d42bf5b9fb8/LICENSE-MIT")
sha256sums=('38d03fa518b96061d0b28b3ca22e3b884edfeecc1bf506ef044016e1740977b6'
            '7012cb461f4ef84bce314d2a2e6cadcc773ed34fa509cec5a602c52077958ef6')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/mtp-mount target/release/mtp-mountd -t "${pkgdir}/usr/bin"
  sed 's|^ExecStart=.*|ExecStart=/usr/bin/mtp-mountd|' dist/mtp-mountd.service > mtp-mountd.service
  install -Dm644 mtp-mountd.service -t "${pkgdir}/usr/lib/systemd/user"
  install -Dm644 "${srcdir}/${pkgname}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
