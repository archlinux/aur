# Maintainer: Hultwl <Hultwl@users.noreply.github.com>
pkgname=rufux-git
pkgver=2.2.r0.g7aec56d
pkgrel=1
pkgdesc="Rufux — bootable USB creator for Linux (Rufus port, latest git)"
arch=('x86_64')
url="https://github.com/Hultwl/Rufux"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'hicolor-icon-theme' 'openssl' 'udisks2' 'util-linux')
makedepends=('git' 'cmake' 'gcc' 'pkgconf' 'gettext' 'cargo')
optdepends=(
  'dosfstools: FAT32 formatting (mkfs.vfat)'
  'ntfsprogs: NTFS formatting (mkfs.ntfs)'
  'exfatprogs: exFAT formatting (mkfs.exfat)'
  'e2fsprogs: ext4 formatting and persistence'
  'libarchive: ISO extraction (bsdtar)'
  'p7zip: required for UDF/Windows ISOs (7z)'
  'wimlib: Windows 11 checks bypass inside boot.wim (wimlib-imagex)'
  'hivex: offline registry editing for the bypass (hivexsh)'
  'syslinux: BIOS/GPT MBR + syslinux install'
  'grub: GRUB bootloader install'
  'xorriso: ISO building'
  'curl: release update checks'
  'polkit: privilege escalation via pkexec'
)
provides=('rufux')
conflicts=('rufux')
source=("git+https://github.com/Hultwl/Rufux.git")
sha256sums=('SKIP')

pkgver() {
  cd Rufux
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S Rufux \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
  cargo build --release --manifest-path Rufux/gui-tauri/Cargo.toml
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm755 Rufux/gui-tauri/target/release/rufux-gui "$pkgdir/usr/bin/rufux-gui"
}
