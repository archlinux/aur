# Maintainer: h8d13 <hadrien dot loge at gmail dot com>

pkgname=archinstall-latest
pkgver=3.0.14
pkgrel=1
pkgdesc="Just another guided/automated Arch Linux installer with a twist (latest release)"
arch=(any)
url="https://github.com/archlinux/archinstall"
license=(GPL-3.0-only)
depends=(
  'arch-install-scripts'
  'btrfs-progs'
  'coreutils'
  'cryptsetup'
  'dosfstools'
  'e2fsprogs'
  'glibc'
  'kbd'
  'libcrypt.so'
  'libxcrypt'
  'pciutils'
  'procps-ng'
  'python'
  'python-cryptography'
  'python-pydantic'
  'python-pyparted'
  'python-textual'
  'systemd'
  'util-linux'
  'xfsprogs'
  'lvm2'
  'f2fs-tools'
  'ntfs-3g'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel'
  'python-sphinx_rtd_theme'
  'python-pylint'
  'ruff'
)
optdepends=(
  'python-systemd: Adds journald logging'
)
provides=(archinstall)
conflicts=(archinstall python-archinstall archinstall-git)
source=(
  archinstall-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  archinstall-$pkgver.tar.gz.sig::$url/releases/download/$pkgver/archinstall-$pkgver.tar.gz.sig
)
sha256sums=('92f81ac80779b955d6e2550edf74c17bdedc2da9c69ea50b21fce034f9fa49e0'
            'SKIP')
validpgpkeys=('8AA2213C8464C82D879C8127D4B58E897A929F2E') # torxed@archlinux.org

check() {
  cd archinstall-$pkgver
  ruff check
}

build() {
  cd archinstall-$pkgver

  python -m build --wheel --no-isolation
  PYTHONDONTWRITEBYTECODE=1 make man -C docs
}

package() {
  cd archinstall-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 docs/_build/man/archinstall.1 -t "$pkgdir/usr/share/man/man1/"
}
