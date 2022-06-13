# Maintainer:
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Pulphix <crimea.v@libero.it>

pkgname=gamin
pkgver=0.1.10
pkgrel=9
pkgdesc='File and directory monitoring system defined to be a subset of the FAM (File Alteration Monitor)'
url='https://people.gnome.org/~veillard/gamin'
url='https://web.archive.org/web/20141226011517/https://people.gnome.org/~veillard/gamin'
url="https://download.gnome.org/sources/${pkgname}/"
license=('GPL')
arch=('x86_64' 'i686')
depends=('glib2')
makedepends=('python2')
optdepends=('python2: for the python module')
provides=('fam')
conflicts=('fam')
source=("${url}/${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"
        'fix-deprecated-const.patch'
        '18_gam_server_deadlocks.patch'
        '0001-Poll-files-on-nfs4.patch')
sha512sums=('21bfe6fcf8fb3117cd5a08c8ce3b8d0d1dd23e478e60a95b76c20d02cc29b050dde086578d81037990484ff891c3e104d2cbbf3d294b4a79346b14a0cae075bb'
            'c4c10bee70c7231db395cbfe5bdf513ade6be599a11a9d35888ddfaca42d619fe2b5e87c2b2bab469ea98ba718bc01711252313ba5f53c392379b669f5b2902b'
            'ae2d3f3cd16e2da05836cbb2f21527896db5d5067ef4b120e943693234a685527eff528955ed80120265ca70e04a88cc28413cc34311d6faa068c620339fad38'
            'dcb23fd68e106a1b578235ef0b01b49773908ca6ded706610103f880f77a2aa0b0403cb720b9c6b062bac71e9d66cd2288b489c558839fc23295b18635bf399f')

prepare() {
  cd $pkgname-$pkgver

  # https://bugs.archlinux.org/task/33642
  patch -Np1 -i ../18_gam_server_deadlocks.patch

  patch -Np1 -i ../fix-deprecated-const.patch
  patch -Np1 -i ../0001-Poll-files-on-nfs4.patch

  # python 2
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' python/gamin.py
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static --with-threads \
    --disable-debug-api --disable-debug --libexecdir=/usr/lib/gamin \
    --with-python=/usr/bin/python2
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
