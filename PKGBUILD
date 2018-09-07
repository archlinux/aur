# Maintainer: Pechin Mikhail <ahsima1 (at) gmail (dot) com>

_pkgbase=digimend-kernel-drivers
pkgname=digimend-kernel-drivers-dkms-git
pkgver=8.r4.g42b16eb
pkgrel=1

pkgdesc='Linux kernel modules (DKMS) for non-Wacom USB graphics tablets. Git version.'
arch=('any')
url='https://digimend.github.io'
license=('GPL2')

depends=('dkms')
makedepends=('git')
conflicts=("$_pkgbase" "$_pkgbase"-dkms)
provides=("$_pkgbase"-dkms)

source=('git+https://github.com/DIGImend/digimend-kernel-drivers.git')

md5sums=('SKIP')


pkgver() {
  cd "$_pkgbase"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  # Install
  cd "$_pkgbase"

  install -Dm 0644 digimend.conf "$pkgdir"/etc/depmod.d/digimend.conf
  install -Dm 0755 hid-rebind "$pkgdir"/usr/bin/hid-rebind
  install -Dm 0644 90-hid-rebind.rules "$pkgdir"/usr/lib/udev/rules.d/90-hid-rebind.rules

  # Copy sources (including Makefile)
  mkdir -p "$pkgdir"/usr/src/"$_pkgbase"-"$pkgver"
  cp -rf ./* "$pkgdir"/usr/src/"$_pkgbase"-"$pkgver"

  # Set version
  sed "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/g" \
      -i "$pkgdir"/usr/src/"$_pkgbase"-"$pkgver"/dkms.conf

  # Remove unneeded files
  rm -rf "$pkgdir"/usr/src/"$_pkgbase"-"$pkgver"/debian
  rm "$pkgdir"/usr/src/"$_pkgbase"-"$pkgver"/COPYING
  rm "$pkgdir"/usr/src/"$_pkgbase"-"$pkgver"/90-hid-rebind.rules
  rm "$pkgdir"/usr/src/"$_pkgbase"-"$pkgver"/digimend.conf
  rm "$pkgdir"/usr/src/"$_pkgbase"-"$pkgver"/hid-rebind
  rm "$pkgdir"/usr/src/"$_pkgbase"-"$pkgver"/README.md
}
