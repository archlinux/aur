# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verity-squash-root
pkgver=0.3.2
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
sha512sums=('09d583f71906975aaf1bd18b274e809ace8a81fa42b4023de0c4f5052126536233079db31f7248df127c33672e686564be9966db38892b7b31854dd4afda654d')
b2sums=('6b7fb9d411e15874edc3c6220f9993d813d250143c0aae74f140d0b2a463604bdbc3557d2e9889229fb198c0ff1052745c6c903b3e72b9d10afd03649da01e27')

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
