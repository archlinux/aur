# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=verity-squash-root
pkgver=0.3.5
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
sha512sums=('841b0ca9c1c7219f810a6c7a409b3c9d8325e77f071973f73f6ae46efa781a55fd08442d63ea9976022420894d3ebebc4f1bee05d4e730740c327e5e53100659')
b2sums=('36f71d8468854cacf58cec4b3c7143e70e83a6ee22e78e733a88511d00e6a8004c7f4106562dee060ea239708d9dc1f388c178a5e50ff8dc911516a4aaa9a90f')

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
