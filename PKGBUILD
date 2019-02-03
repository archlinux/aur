# Contributor: Christian Neukirchen <chneukirchen.org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=nn
pkgver=6.7.3
_debver=10
pkgrel=3
pkgdesc="Heavy-duty USENET news reader (curses-based client, with Debian patches)"
arch=('i686' 'x86_64')
url="http://packages.debian.org/en/sid/news/nn"
license=('custom')
depends=(sh)
makedepends=(gawk)
install=nn.install
source=(http://ftp.de.debian.org/debian/pool/main/n/nn/nn_$pkgver.orig.tar.gz
        http://ftp.de.debian.org/debian/pool/main/n/nn/nn_$pkgver-$_debver.diff.gz
        config.h)
md5sums=('98e9cafed68509b44cf8c8acaf373eff'
         '10a68a3d63f02594102c2939c12cb493'
         '975dc4bf20bbab47fd9af71026d3ac87')
sha1sums=('114caf94bff0053a7406c430f217d51e0668e125'
          'adf96113d518cf0ae4533beea62513a904486b2f'
          '30279ca05cb909a209983983dc8934407af90033')
sha256sums=('f696e9e2115ea4019398fc06aadcf07c43822559210cd05daf20801ea733f3ba'
            'f774151f745224e92f93e856802bb29dada097e7dd2014d2d4b3c3d2ee40e6e5'
            'ff67dfef23bb1e18bcaccffc2174a3ca36ef4694cdef40c1ded459882648c422')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  zcat "$srcdir/nn_$pkgver-$_debver.diff.gz" | patch -p1
  cp -f $srcdir/config.h .
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{bin,lib/nn/help,share/man/{man1,man8}}
  DESTDIR="$pkgdir/" ./inst n
  install -D -m644 "${srcdir}/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 debian/nnbatch.1 $pkgdir/usr/share/man/man1/nnbatch.1
  rm -rf $pkgdir/usr/share/man/man8 \
         $pkgdir/usr/share/man/man1/nn*.1m* \
         $pkgdir/usr/bin/{nnadmin,nnstats,nnusage,nnact}
}

