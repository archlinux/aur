# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verify-squash-root
pkgver=0.0.3
pkgrel=1
pkgdesc='Build signed efi files which mount a verified squashfs image as rootfs on boot'
arch=(any)
url='https://github.com/brandsimon/verify-squash-root/'
license=(MIT)
depends=(python binutils sbsigntools squashfs-tools tar)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(shellcheck mypy flake8)
checkdepends=(flake8 mypy shellcheck)
optdepends=('age: for encrypted secure boot keys')
backup=(etc/verify_squash_root/config.ini)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandsimon/verify-squash-root/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f0bf48180e5d861191d427578eeb1b25147d1c8a335b32cc3651e0e094b09a1c')

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
