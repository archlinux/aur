# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: A.Shukaev

_pkgname=conky-colors
pkgname=$_pkgname-git
pkgver=20200927.r171.138963a
pkgrel=1
pkgdesc='An easier way to configure Conky'
url='https://github.com/helmuthdu/conky_colors'
license=('GPL3')
arch=('armv6h' 'armv7h' 'arm' 'i686' 'x86_64')
depends=('python' 'conky' 'pystatgrab' 'python-keyring' 'ttf-liberation' 'ttf-ubuntu-font-family' 'hddtemp' 'curl' 'lm_sensors')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd ${_pkgname/-/_}
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname/-/_}
  sed -i 's|\(ln\s\+-\S\+\s\+\)\$(DESTDIR)|\1|' Makefile
  sed -i 's|\(PREFIX\s*\):\?=|\1?=|' Makefile
}

build() {
  cd ${_pkgname/-/_}
  make PREFIX=/usr
}

package() {
  cd ${_pkgname/-/_}
  install -dm755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
