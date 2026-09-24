# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=machines
pkgver=0.1.1
pkgrel=1
pkgdesc='Manager for libvirt virtual machines'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/machines'
license=('GPL-3.0-or-later')
depends=('gtk4>=1:4.22' 'libadwaita>=1:1.9' 'glib2' 'libvirt' 'gtk-vnc' 'spice-gtk' 'vte4'
         'hicolor-icon-theme' 'libgcc' 'glibc')
makedepends=('cargo' 'blueprint-compiler' 'just' 'gettext')
optdepends=('qemu-desktop: run machines on this computer'
            'dnsmasq: virtual networks'
            'osinfo-db: recognize the system on an installation ISO'
            'edk2-ovmf: UEFI firmware'
            'swtpm: emulated TPM'
            'virtiofsd: folders shared with a machine')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('038778edc610db443c35746883a117c1a4a22f132650bdd60b910221a98777a4')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export MACHINES_LOCALEDIR=/usr/share/locale
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" just prefix=/usr install
}
