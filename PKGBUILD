# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verity-squash-root
pkgver=0.3.0
pkgrel=1
pkgdesc='Build signed efi files which mount a verified squashfs image as rootfs on boot'
arch=(any)
url='https://github.com/brandsimon/verity-squash-root/'
license=(MIT)
depends=(age bash python binutils cryptsetup efitools sbsigntools squashfs-tools tar)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(flake8 mypy shellcheck)
backup=(etc/verity_squash_root/config.ini)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandsimon/verity-squash-root/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('1b9db016a652a799b757efe036076cfad3c37ddbb9196ff1895814edd1c85610d2dafdb64351a959f3a5a6080cf250e659294128072871bce4a0b62941f4976e')
b2sums=('1846f086043b4dc5a82e08987df6bc749b43a18a4bc7b024faa3d1199f4d2f2d7c3808367b9fbb58e22ee675aed7e7f44a6046b5be29b257bfc60d88339b52fe')

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
  install -dm 755 "${pkgdir}/usr/share/licenses/verity-squash-root"
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
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/verity-squash-root"
}
