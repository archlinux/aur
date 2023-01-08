# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verity-squash-root
pkgver=0.2.1
pkgrel=1
pkgdesc='Build signed efi files which mount a verified squashfs image as rootfs on boot'
arch=(any)
url='https://github.com/brandsimon/verity-squash-root/'
license=(MIT)
depends=(python binutils efitools sbsigntools squashfs-tools tar)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(flake8 mypy shellcheck)
optdepends=('age: for encrypted secure boot keys')
backup=(etc/verity_squash_root/config.ini)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandsimon/verity-squash-root/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('be9375e5e02d759b4b0d5e3d531c7baeb26f0f9538e67c28788f750490eb544f8cf8044307105abdac67f22a4fab80724d5765e9be97bb62f06495e941b171a2')
b2sums=('dc0738faaf28962dd5d11a13187fb2023122065c602678246fd5bb053745ab42c0cea9b9dec97e426a98160143d7be4de4c592e065ebb14f28c7829a37c6dde2')

build() {
  cd "${pkgname}-${pkgver}"
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
  python -m installer --destdir="${pkgdir}" dist/*.whl
  mkdir -p "${pkgdir}/usr/lib/" "${pkgdir}/usr/share/verity_squash_root/" "${pkgdir}/etc/verity_squash_root/"
  cp -r usr/lib/* "${pkgdir}/usr/lib/"
  cp src/verity_squash_root/default_config.ini "${pkgdir}/usr/share/verity_squash_root/default.ini"
  cp src/verity_squash_root/default_config.ini "${pkgdir}/etc/verity_squash_root/config.ini"
}
