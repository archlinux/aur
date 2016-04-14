# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-cvs
pkgver=2014.07.15
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Toolchest of standard UNIX utilities, derived from original UNIX tools."
url="http://heirloom.sourceforge.net/tools.html"
license=('GPL' 'LGPL' 'custom:"lucent"' 'custom:"opensolaris"' 'custom')
depends=('heirloom-sh-cvs' 'heirloom-devtools-cvs')
makedepends=('cvs' 'bc')
source=('000-config.diff' '001-staticdep.diff' '002-nowhat.diff' 'makefile.patch')
md5sums=('f9be8f1cc57f87425b39414a7db06543'
         '115355b6058592f9ba16a1c011f27ecd'
         '7394fc957b4fe5a58e4f43d7e283e96b'
         '9112b52fddffa66cd464eeecd0109a21')
sha1sums=('bac6f6a125e87d02f6221628e4264c56a4020600'
          'd073d0c2e9a09453e5768f0732e605a11e624543'
          '92e47507e839c102873d61ff8ba6feceb07e1287'
          '622353a7c4f4a9595c885ed215bc60a9c5c6720b')
sha256sums=('fff4800193c75b065efd85d70c88e9b85ed40bddf9fe7a742b7c8a2727a75d44'
            'faa06d65c6fddfce6b3a44f4747c3111f5d4165e195d976bc8d01ec87972f0f8'
            '0116a8bb3c1e89c073c3dc7a4b3006c69978d80998c5e9d0ae8c5aa35fcd1dae'
            '9936108bf2e226ad99d66a213649eb35ea16ccee5e2594b84c328ba4eafa2ad2')

prepare() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom
  rm -rf $srcdir/build
  cd "$srcdir/${pkgname%-*}"
  patch -p1 < ../000-config.diff
  patch -p1 < ../001-staticdep.diff
  patch -p1 < ../002-nowhat.diff
  patch makefile -i ../makefile.patch
}

build() {
  cd "$srcdir/${pkgname%-*}"
  make -j1
}

package() {
  cd "$srcdir/${pkgname%-*}"
  make install ROOT="$pkgdir"
  cd "$srcdir/${pkgname%-*}"
  cd "LICENSE/"
  for i in COPYING COPYING.LGPL LICENSE LUCENT OPENSOLARIS.LICENSE README; do
    install -Dm0644 $i ${pkgdir}/usr/share/licenses/${pkgname%-*}/$i
  done
}

