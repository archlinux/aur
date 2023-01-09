# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verity-squash-root
pkgver=0.2.2
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
sha512sums=('4aa24378702df2a83faf5d60ce3192f91a314284b13f2ba89c0e38ec2b04093a4c6e2b783b75f3c2a9929c1250df1becbbc293e6c75eedb9ede8454d24949452')
b2sums=('26000a61f469cecc8871904bd426c1f4c514b18dcf11c7763ee8c62114dc1c54c63ed23b2d4c160844568d465d436b11313f337c31d082eb4a86e0214a4bd660')

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
