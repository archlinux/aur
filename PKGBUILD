# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verify-squash-root
pkgver=0.0.4
pkgrel=1
pkgdesc='Build signed efi files which mount a verified squashfs image as rootfs on boot'
arch=(any)
url='https://github.com/brandsimon/verify-squash-root/'
license=(MIT)
depends=(python binutils efitools sbsigntools squashfs-tools tar)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(shellcheck mypy flake8)
checkdepends=(flake8 mypy shellcheck)
optdepends=('age: for encrypted secure boot keys')
backup=(etc/verify_squash_root/config.ini)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandsimon/verify-squash-root/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('de2508ad8267d2de2ab272f4e8d823760e33e07a90ae09eb33bc458226ef8835')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  flake8 src/ tests/ setup.py
  mypy src
  shellcheck usr/lib/initcpio/install/verify-squash-root usr/lib/verify-squash-root/*
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  mkdir -p "${pkgdir}/usr/lib/" "${pkgdir}/usr/share/verify_squash_root/" "${pkgdir}/etc/verify_squash_root/"
  cp -r usr/lib/* "${pkgdir}/usr/lib/"
  cp src/verify_squash_root/default_config.ini "${pkgdir}/usr/share/verify_squash_root/default.ini"
  cp src/verify_squash_root/default_config.ini "${pkgdir}/etc/verify_squash_root/config.ini"
}
