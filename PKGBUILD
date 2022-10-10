# Maintainer: Benedikt Braunger <accounts+aur@domainmess.org>
pkgname="e2factory"
pkgver="2.3.18p1"
pkgrel="1"
pkgdesc="A software buildsystem not only for embedded systems"
url="http://e2factory.org"
license=('GPLv3')
arch=("any")
depends_x86_64=('gcc' 'rsync' 'git' 'gzip' 'tar' 'man-db' 'patch' 'unzip' 'make' 'openssh')
install=.INSTALL
sha256sums=('c61f12da7cdad526bdcbed47a4c0a603e60dbbfdaf8b66933cd088e9132c303f'
            '277d15ded89f2261d427119e7df70a3d27ca1f71847a45ee61659a3c27b38b22'
            '7474dcadc663a3fd5bed34f79f6b7253d4b637ce34daef46651ce57564b04202')

source=("LICENSE"
        "e2factory.conf"
        "https://github.com/emlix/e2factory/archive/refs/tags/e2factory-2.3.18p1.tar.gz")

# 'e2factory' is chosen instead of 'ebs' as E2_GROUP for better recognizability
# E2_GROUP is first set to $USER to prevent the need of the e2factory group on the build host
# Group rights are corrected in the .INSTALL file and group is created by systemd-sysusers

build () {
          cd $pkgname-$pkgname-$pkgver
          make \
            DESTDIR=$pkgdir \
            MANDIR=/usr/local/man \
            E2_GROUP=$USER \
            all
}

package() {
          cd $pkgname-$pkgname-$pkgver
          make \
            MANDIR=/usr/local/man \
            DESTDIR=$pkgdir \
            E2_GROUP=$USER \
            install
          make \
            DESTDIR=$pkgdir \
            MANDIR=/usr/local/man \
            E2_GROUP=$USER \
            install-doc
          install -D -m644 $srcdir/LICENSE        $pkgdir/usr/share/licenses/$pkgname/LICENSE
          install -D -m644 $srcdir/e2factory.conf $pkgdir/usr/lib/sysusers.d/e2factory.conf
}
