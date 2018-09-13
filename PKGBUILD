# Maintainer: SherlockHolo <sherlockya(at)gmail.com>
# Container: Jan de Groot <jgc@archlinux.org>

pkgname=libpwquality-py3
pkgver=1.4.0
pkgrel=1
pkgdesc="Library for password quality checking and generating random passwords"
arch=('x86_64')
url="https://github.com/libpwquality/libpwquality"
license=('GPL')
depends=('cracklib' 'pam')
optdepends=('python: Python bindings')
makedepends=('python' git)
backup=('etc/security/pwquality.conf')
_commit=ec03e45823965bbcfcbaec7497a1b47033c3b632  # tags/libpwquality-1.4.0
source=("git+https://github.com/libpwquality/libpwquality.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^libpwquality-//;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
  sed '/mr_IN/d' -i po/LINGUAS
}

build() {
    cd "$pkgname"
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-python-rev=3.7 \
        --with-python-binary=python3
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    install -m755 -d "$pkgdir"/etc/security/pwquality.conf.d
}
