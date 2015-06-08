# Maintainer: Masami Ichikawae <masami256@gmail.com>
# vim:set ts=2 sw=2 et filetype=sh:
pkgname=xfstests-git
pkgver=linux.v3.8.r640.gfacff60
pkgrel=1
pkgdesc="File system QA suite"
arch=('i686' 'x86_64')
url="http://oss.sgi.com/projects/xfs"
license=('GPL')
install=xfstests-git.install
depends=('xfsprogs' 'openssl' 'libaio')
makedepends=('git')
source=("$pkgname"::'git://oss.sgi.com/xfs/cmds/xfstests.git' 'no-ltinstall.diff')
md5sums=('SKIP' '4ec54611e65df0caa825e5fe8dc949c7') # skip git source checksum

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 -i "$srcdir/no-ltinstall.diff"
}

build() {
    cd "$srcdir/$pkgname"
    make configure
    ./configure
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
    
    mv $pkgdir/var/lib/xfstests $pkgdir/var/lib/$pkgname
    chown -R root:root "$pkgdir/var/lib/$pkgname"
}
