# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verity-squash-root
pkgver=0.3.3
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
sha512sums=('f960e842ef3ccf097c2af19a136761a66502a3401d572d26b4719817d5e17e5f463283fa0b72d3c79b85e4baff298f2e62cd184dc8e78631b1c482ff2fd56e98')
b2sums=('be3bb50a968294055a457f935ee204cc320fc3b92424e9f83ffe3550796068e6e1ac943cabdea5d9bb0ed71a53574406a198ace9fe488dd0d0e206df23fc57b7')

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
