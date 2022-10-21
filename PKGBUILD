# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=ibutils
pkgver=1.5.7
_pkgver_subver=0.2
_pkgver_commit=gbd7e502
pkgrel=2
pkgdesc='OpenFabrics Alliance InfiniBand network diagnostic and testing utilities'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('opensm' 'tk' 'perl')
source=(
"https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}.${_pkgver_commit}.tar.gz"
"ibutils-1.5.7-tk86.patch"
"ibutils-1.5.7-format-security.patch"
"add-ibdev2netdev.patch"
"ibutils-1.5.7-gcc10.patch")
sha256sums=(
'67a3b417c8d0820400045dd7143674824086c6793a40ded333be50e498d9a703'
'dd9f1932b8b6cb1ea1efacf9a44daf82bd20b913a4a8ef689060093449d67324'
'ebc03537554605ddd41a079fa3b0975c229f646ed7d0f626fea7965a3bf8ad07'
'c813833cc450e5e0ee23b30add62c5a047cea87fcbda2474ea595f63b1df6507'
'1cdac515114e532a12d810d63880dfb869c528b48a6fa4a5bdb4d1930dc6734c')
#Patch0: ibutils-1.5.7-tk86.patch
#Patch1: ibutils-1.5.7-format-security.patch
#Patch2: add-ibdev2netdev.patch
#Patch3: ibutils-1.5.7-gcc10.patch

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man \
              --with-tk-lib=/usr/lib/libtk8.6
  make
}

prepare() {
  patch -d "$pkgname-$pkgver" -p1 -i ../ibutils-1.5.7-tk86.patch
  patch -d "$pkgname-$pkgver" -p1 -i ../ibutils-1.5.7-format-security.patch
  patch -d "$pkgname-$pkgver" -i ../add-ibdev2netdev.patch
  patch -d "$pkgname-$pkgver" -p1 -i ../ibutils-1.5.7-gcc10.patch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # No reason this should be going into /usr/bin
  rm -f "${pkgdir}/usr/bin/git_version.tcl"
}
