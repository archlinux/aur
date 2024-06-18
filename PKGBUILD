# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Reto Brunner <brunnre8@gmail.com>

pkgname=mkosi-git
pkgver=23.1.r11.g6972f9efba
pkgrel=1
pkgdesc='Build Legacy-Free OS Images'
arch=('any')
url='https://github.com/systemd/mkosi'
license=('LGPL2.1')
depends=(
    'bubblewrap'
    'python'
    'util-linux'
)
makedepends=(
    'git'
    'pandoc'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
optdepends=(
    'acl: manage ACLs'
    'apt: build Debian or Ubuntu images'
    'arch-install-scripts: build Arch images'
    'archlinux-keyring: build Arch images'
    'btrfs-progs: raw_btrfs and subvolume output formats'
    'ca-certificates: mount common CA certificates into images'
    'curl: build openSUSE images'
    'cpio: cpio output format'
    'cryptsetup: add dm-verity partitions'
    'debian-archive-keyring: build Debian images'
    'dnf: build Fedora or Mageia images'
    'dosfstools: build bootable images'
    'dpkg: build Debian images'
    'e2fsprogs: raw_ext4 output format'
    'edk2-ovmf: run bootable images in QEMU'
    'gnupg: sign images'
    'grub: install GRUB in images'
    'kmod: manage kernel module dependencies'
    'pacman: build Arch images'
    'pesign: sign EFI binaries for UEFI SecureBoot'
    'python-cryptography: sign verity data'
    'qemu-base: run bootable images in QEMU'
    'reprepro: manage APT repositories'
    'sbsigntools: sign EFI binaries for UEFI SecureBoot'
    'socat: proxy to QEMU VMs'
    'squashfs-tools: raw_squashfs output format'
    'swtpm: emulate TPM in QEMU'
    'systemd-ukify: build bootable images'
    'tar: tar output format'
    'ubuntu-keyring: build Ubuntu images'
    'virt-firmware: manage virtualized firmware in QEMU'
    'virtiofsd: boot directory trees in QEMU'
    'xfsprogs: raw_xfs output format'
    'xz: compress images with xz'
    'zstd: compress images with zstd'
    'zypper-git: build openSUSE images'
)
provides=('mkosi')
conflicts=('mkosi')
source=('git+https://github.com/systemd/mkosi.git#branch=main')
md5sums=('SKIP')

pkgver() {
  cd 'mkosi'

  git describe --long | sed '
    # v3-90-gd927f65 (tag - number of commits - g(it)hash)
    s/^v//
    # 3-90-gd927f65
    s/\([^-]*-g\)/r\1/
    # 3-r90-gd927f65
    s/-/./g
    # 3.r90.gd927f65
'
}

build() {
    cd 'mkosi'

    tools/make-man-page.sh
    python -m build --wheel --no-isolation
}

package() {
  cd 'mkosi'

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 mkosi/resources/mkosi.1 "$pkgdir/usr/share/man/man1/mkosi.1" || true
}
