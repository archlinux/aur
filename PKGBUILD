# Based on linux-firmware by Thomas Bächler <thomas@archlinux.org>
# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: xduugu

pkgname=linux-firmware-git
pkgrel=2
pkgdesc="Firmware files for Linux"
makedepends=('git')
arch=('any')
url="http://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
conflicts=('linux-firmware')
pkgver=20150924.f88e5c2
provides=("linux-firmware=$pkgver")
options=(!strip)
source=("$pkgname::git+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git")
md5sums=('SKIP')

pkgver() {
  # Mimics ABS pkgver described like this:
  # Commit date + git rev-parse --short origin/master
  cd "${srcdir}/${pkgname}"
  (
  git show --format='%cI' -q master | sed 's/T.*//g;s/-//g'
  echo .
  git rev-parse --short master
  ) | tr -d '\n'
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install
  rm "${pkgdir}/usr/lib/firmware/"{Makefile,README,configure,GPL-3}

  install -d "${pkgdir}/usr/share/licenses/linux-firmware"
  install -Dm644 LICEN* WHENCE "${pkgdir}/usr/share/licenses/linux-firmware/"

  # Trigger a microcode reload for configurations not using early updates
  install -d "${pkgdir}/usr/lib/tmpfiles.d"
  echo 'w /sys/devices/system/cpu/microcode/reload - - - - 1' \
    >"${pkgdir}/usr/lib/tmpfiles.d/linux-firmware.conf"
}
# vim:set ts=2 sw=2 et:
