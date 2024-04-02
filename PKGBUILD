# Maintainer: Marco Pompili
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=steghide
pkgver=0.5.1
pkgrel=10
pkgdesc='Embeds a message in a file by replacing some of the least significant bits'
arch=('x86_64')
url='http://steghide.sourceforge.net'
license=('GPL')
depends=('libmcrypt' 'gcc-libs' 'mhash' 'libjpeg' 'zlib')
source=("steghide-${pkgver}.tar.gz::https://sourceforge.net/projects/steghide/files/steghide/${pkgver}/steghide-${pkgver}.tar.gz/download"
        'buildsystem.patch'
        'gcc-4.2.patch'
         "${pkgname}-climits.patch"
         steghide-gcc6.patch)
sha256sums=('78069b7cfe9d1f5348ae43f918f06f91d783c2b3ff25af021e6a312cf541b47b'
            '52b050ad027dc0720e2d73ce90fcc0e8fa1a857c70b0650e0bffe1c717dd0e85'
            'fcdb292b634b2b4ecb866bd7b72d1eb86d4d3fdff12b6b2456fa5e458669f8c1'
            'c1489d23a91b29d6eb74dfb167b7454957e9ae1058b0485fe053d0b7279bf728'
            '8c716ac3e2952934d23017c3258959afb89304c77f25dec2d20f0ffd249da1cf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < ../buildsystem.patch

  # this patch courtesy gentoo bug tracker #178134
  patch -Np1 -i ../gcc-4.2.patch
  patch -Np1 -i ../steghide-climits.patch

  patch -p1 -i ../steghide-gcc6.patch # Fix build with GCC 6

  # touch files needed by GNU Autotools
  touch NEWS AUTHORS ChangeLog

  # autoreconf -i
  ./configure --prefix=/usr --mandir=/usr/share/man

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
