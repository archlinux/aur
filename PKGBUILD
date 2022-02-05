# Maintainer: endlesseden
_pkgname=python-hybridspi
pkgname=$_pkgname-git
pkgver=0.1.1.31.r44.g903e6ac
pkgrel=1
pkgdesc="A Python implementation of Hybrid Radio SPI"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/magicbadger/$_pkgname"
license=('GPL2')
groups=()
depends=('python')
checkdepends=()
optdepends=()
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "$(git describe --tags | sed 's|-|.|g' | sed 's/v//g' | sed 's|.g|\n|g' | head -1).r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  if [ ! "$(cat setup.py | grep -c bin/dump_binary)" -gt 0 ]; then
     sed -i "s|dump_binary|bin/dump_binary|g" setup.py
  fi
}

build() {
	cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
