# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verity-squash-root
pkgver=0.3.1
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
sha512sums=('28bc535fe0c89c20b2e4b2d3f69c2ffd08603186e5a83612a81554ebae506939271a3bf31d1a60002196e87ac33c3b0f83e6717449673bb3eb65c4932ff14758')
b2sums=('7936a97613870f84596d98399ccbbde074e434214247135e9f24dbd15e144589d635d6fe3fe9097b855058f07c9a22d68b357627fa685c37673bd2794b3f3b13')

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
  install -Dm 644 usr/lib/dracut/modules.d/99verity-squash-root/cryptsetup_overlay.conf \
    "${pkgdir}/usr/lib/dracut/modules.d/99verity-squash-root/"
  install -Dm 644 usr/lib/dracut/modules.d/99verity-squash-root/dracut_mount_overlay.conf \
    "${pkgdir}/usr/lib/dracut/modules.d/99verity-squash-root/"
  install -Dm 644 usr/lib/initcpio/install/verity-squash-root "${pkgdir}/usr/lib/initcpio/install"
  install -Dm 755 usr/share/bash-completion/completions/verity-squash-root \
    "${pkgdir}/usr/share/bash-completion/completions/"
  install -dm 755 "${pkgdir}/verity-squash-root/usr/lib/systemd/system"
  install -Dm 644 usr/lib/systemd/system/verity-squash-root-notifiy.service \
    "${pkgdir}/usr/lib/systemd/system/verity-squash-root-notifiy.service"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/verity-squash-root"
}
