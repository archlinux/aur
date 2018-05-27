# Maintainer: Matthias Riegler <matthias@xvzf.tech>
pkgname=dataleech
pkgdesc="Backup plan using ZFS..."
pkgver=1.0.4
pkgrel=1
arch=("any")
url="https://github.com/xvzf/dataleech"
license=("GPL3")
depends=("zfs-utils" "python" "python-click" "pv" "openssh" "cronie")
provides=("dataleech" "superman")
backup=("etc/dataleech/datasets")
source=("https://github.com/xvzf/dataleech/archive/${pkgver}.tar.gz")
sha256sums=("cb70dbbe62adec37c703b3f030df39a96544ff5ad72d05ef85dac667b872f088")

build() {
  cd "${srcdir}/dataleech-${pkgver}/"
  python setup.py build
}

package() {
  # Install dataleech
  cd "${srcdir}/dataleech-${pkgver}/"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # Copy cronfiles
  mkdir -p ${pkgdir}/etc/{dataleech,cron.d}

  install -Dm644 "${srcdir}/dataleech-${pkgver}/other/configfiles/datasets" \
                 "${pkgdir}/etc/dataleech/datasets"

  install -Dm644 "${srcdir}/dataleech-${pkgver}/other/cronfiles/dataleech.10min" \
                 "${pkgdir}/etc/cron.d/dataleech"

  install -Dm755 "${srcdir}/dataleech-${pkgver}/other/cronfiles/dataleech.daily" \
                 "${pkgdir}/etc/cron.daily/dataleech"

  install -Dm755 "${srcdir}/dataleech-${pkgver}/other/cronfiles/dataleech.weekly" \
                 "${pkgdir}/etc/cron.weekly/dataleech"

  # Copy the pacman wrapper superman
  install -Dm755 "${srcdir}/dataleech-${pkgver}/other/scripts/superman" \
                 "${pkgdir}/usr/bin/superman"
}

# vim:set ts=4 sts=2 sw=2 et:
