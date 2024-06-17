# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verity-squash-root
pkgver=0.3.4
pkgrel=1
pkgdesc='Build signed efi files which mount a verified squashfs image as rootfs on boot'
arch=(any)
url='https://github.com/brandsimon/verity-squash-root/'
license=(MIT)
depends=(age bash python binutils cryptsetup efitools sbsigntools squashfs-tools tar)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(flake8 mypy shellcheck)
backup=(etc/verity_squash_root/config.ini)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandsimon/verity-squash-root/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8081964921faba01a0908f82e4f7f1141b891e6bc5dae46fa9fb083d01d141acfb1f81dffa0256e089ef6eaef3a10e66f8049e7369b3b9b58edeb4f2468eccba')
b2sums=('14a5fac01b296dec6f837f01bfd5fdcdf1c2545ec4f0b8f76d93c54c07c3f4625c62ee7c2f4de2c361965bbc517e85def07fc332a397e6aa818b7b8d9bf90dbb')

build() {
  cd "${pkgname}-${pkgver}"
  make
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  flake8 src/ tests/ setup.py
  mypy src
  shellcheck usr/lib/initcpio/install/verity-squash-root usr/lib/verity-squash-root/*
}

package() {
  cd "${pkgname}-${pkgver}"
  install -dm 755 "${pkgdir}"
  make install DESTDIR="${pkgdir}"
}
