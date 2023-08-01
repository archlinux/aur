# Maintainer: Miten <admin@m1ten.me>
# Maintainer: Anton Hvornum <anton@hvornum.se>

_name=archinstall
pkgname=archinstall-git
pkgver=2.6.0.r5.g0852a7c
pkgrel=3
pkgdesc="Just another guided/automated Arch Linux installer with a twist"
arch=('any')
url="https://github.com/archlinux/$_name"
license=('GPL3')
depends=(
  'arch-install-scripts'
  'btrfs-progs'
  'coreutils'
  'cryptsetup'
  'e2fsprogs'
  'kbd'
  'pciutils'
  'procps-ng'
  'python'
  'python-pyparted'
  'python-simple-term-menu'
  'systemd'
  'util-linux'
)
makedepends=(
  'git'
  'python-setuptools'
  'python-sphinx'
  'python-build'
  'python-installer'
  'python-wheel'
)
optdepends=(
  'python-systemd: Adds journald logging'
)
provides=('python-archinstall' 'archinstall')
conflicts=('python-archinstall' 'archinstall')
replaces=('python-archinstall' 'archinstall')
source=("git+https://github.com/archlinux/$_name.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_name"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_name"
}

build() {
  cd "$_name"

  python -m build --wheel --no-isolation
  PYTHONDONTWRITEBYTECODE=1 make man -C docs
}

package() {
  cd "$_name"

  # We have previously added "--optimize=1", "--skip-build" and "--prefix=/usr" here.
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 docs/_build/man/archinstall.1 -t "${pkgdir}/usr/share/man/man1/"
}
