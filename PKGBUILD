# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verity-squash-root
pkgver=0.2.3
pkgrel=1
pkgdesc='Build signed efi files which mount a verified squashfs image as rootfs on boot'
arch=(any)
url='https://github.com/brandsimon/verity-squash-root/'
license=(MIT)
depends=(python age binutils cryptsetup efitools sbsigntools squashfs-tools tar)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(flake8 mypy shellcheck)
backup=(etc/verity_squash_root/config.ini)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandsimon/verity-squash-root/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('b87cab3d11b8a372df1998e82d7c523deee4621812e625a4b047a7f9c9570e2578af013ae9eaaaa5d05d1d30e15b78deba919dc00ed2b1b2bee9cb16d941c9a8')
b2sums=('a5ab66c74255e7a55aad010f8763e70ab1cb654a2c6658aa95b01516a72b0a083008951846ba7117fde69a15d62064bd95ec70a4048d740851dfd048922ee9b2')

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
  install -dm 755 "${pkgdir}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -dm 755 "${pkgdir}/usr/lib/"{initcpio,verity-squash-root}
  install -dm 755 "${pkgdir}/usr/lib/initcpio/install"
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/verity_squash_root/" "${pkgdir}/etc/verity_squash_root/"
  install -Dm 644 src/verity_squash_root/default_config.ini "${pkgdir}/usr/share/verity_squash_root/default.ini"
  install -Dm 600 src/verity_squash_root/default_config.ini "${pkgdir}/etc/verity_squash_root/config.ini"
  install -Dm 755 usr/lib/verity-squash-root/* "${pkgdir}/usr/lib/verity-squash-root"
  install -dm 755 "${pkgdir}/usr/lib/dracut/modules.d/99verity-squash-root"
  install -Dm 755 usr/lib/dracut/modules.d/99verity-squash-root/module-setup.sh \
    "${pkgdir}/usr/lib/dracut/modules.d/99verity-squash-root/"
  install -Dm 644 usr/lib/dracut/modules.d/99verity-squash-root/verity_squash_root.conf \
    "${pkgdir}/usr/lib/dracut/modules.d/99verity-squash-root/"
  install -Dm 644 usr/lib/initcpio/install/verity-squash-root "${pkgdir}/usr/lib/initcpio/install"
  install -Dm 755 usr/share/bash-completion/completions/verity-squash-root \
    "${pkgdir}/usr/share/bash-completion/completions/"
}
