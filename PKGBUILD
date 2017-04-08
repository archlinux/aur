# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=dnaa
pkgver=0.1.2
pkgrel=4
pkgdesc='An analysis package for short reads from next-generation sequencing'
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/dnaa/"
license=('GPL2')
depends=('zlib' 'bzip2' 'r' 'perl')
conflicts=('dwgsim')

# Upstream doesn't provide a way to use already-installed bfast or samtools...
source=(
"http://downloads.sourceforge.net/project/bfast/bfast/0.7.0/bfast-0.7.0a.tar.gz"
"http://downloads.sourceforge.net/project/samtools/samtools/0.1.18/samtools-0.1.18.tar.bz2"
"http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
"ToUpper_build_fix.patch" # fix compile error
)

prepare() {
  patch -p1 < ToUpper_build_fix.patch
}

build() {
  cd ${pkgname}-${pkgver}
  [[ ! -L bfast ]] && ln -s ../bfast-0.7.0a bfast
  [[ ! -L samtools ]] && ln -s ../samtools-0.1.18 samtools
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

sha256sums=('ed8de49693165a87d5dbef352207c424b1bf6f670a83acf49a4f4f188444995e'
            'f3faaf34430d4782956562eb72906289e8e34d44d0c4d73837bdbeead7746b16'
            'e6549590066de19e7c5989404830fa3ea82607b864a25147ca16b20a28dd6b68'
            '7efc85235c49789b208b7b0b879241b608cccd16ec949fc2d7ad09800ea3ff8c')
