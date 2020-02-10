# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=icu52
_pkgname=icu
pkgver=52.2
pkgrel=3
pkgdesc="International Components for Unicode library"
arch=(i686 x86_64)
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs>=4.7.1-5' 'sh')
#provides=("$_pkgname==$pkgver")
source=(https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz
	icu.8198.revert.icu5431.patch
	icu.clang.float128.patch)
sha512sums=('b104ef9bb45f1ba93ab2f1d59cd886882e4271dc3736b5a04d912901e37583b91a1782a4fcff440c2e738af3cc8430104c8701fe14622ad56d52cab315e7dbdb'
            'f672a81ff5436ca8827ed904c23738e3629e0cbadc9933a07e7ec3519f970570d2c63fd1811e55284dc99602a1ebc93a365a934ef6dbee43223ab790f6d78969'
            '2cb3c96ecba1f685bf64e41e44fccdba3ed6fb6a31bac434d1af41d026fcf2c6eac54def78488dc87b8248e62e9b7d0563b8a483d7c98af94e94ec52427ac031')

prepare() {
  cd icu/source
  # fix Malayalam encoding https://bugzilla.redhat.com/show_bug.cgi?id=654200
  patch -Rp3 -i ${srcdir}/icu.8198.revert.icu5431.patch
  patch -p1 -i ${srcdir}/icu.clang.float128.patch
}

build() {
  cd icu/source
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--sbindir=/usr/bin
  make
}

package() {
  cd icu/source
  make -j1 DESTDIR=${pkgdir} install

  # Install license
  install -Dm644 ${srcdir}/icu/license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html

  # Only keep versioned libraries
  cd "$pkgdir/usr"
  for dir in bin include lib/pkgconfig share/man; do
    rm -rf $dir
  done
  cd lib
  rm *.so icu/{current,Makefile.inc,pkgdata.inc}
}
