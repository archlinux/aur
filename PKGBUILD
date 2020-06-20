# Maintainer: Daniel Haß <aur@hass.onl>
# Contributor: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname=vpcs
pkgver=0.8
pkgrel=5
pkgdesc="Simple virtual PC simulator"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/vpcs/"
license=('BSD')
makedepends=('make' 'gcc' 'git')
source=("https://github.com/GNS3/${pkgname}/archive/v${pkgver}beta1.tar.gz"
        '0001-getopts.patch'
        '0002-gcc10-extern.patch')
sha256sums=('769358f29353001f6eb374a49fe6569b36b46b2730166e8e11633c6dbdaaff92'
            'cf21daa782d400dd47d66368b28a8e45923b3408a0fee36dbf34eda52867448f'
            '82c20736eef5163527a16a46da83434c1fdb6a9588dba776f0d5cc1a2aa0ca45')

prepare(){
   patch -p1 -d "./${pkgname}-${pkgver}beta1/" < "./0001-getopts.patch"
   # workaround until version including https://github.com/GNS3/vpcs/issues/23 gets released
   patch -p1 -d "./${pkgname}-${pkgver}beta1/" < "./0002-gcc10-extern.patch"
}

build(){
   cd "${srcdir}/${pkgname}-${pkgver}beta1/src"

   ./mk.sh $(getconf LONG_BIT)
}

package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 "${srcdir}/${pkgname}-${pkgver}beta1/src/${pkgname}" ${pkgdir}/usr/bin/${pkgname}
   install -Dvm644 "${srcdir}/${pkgname}-${pkgver}beta1/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   install -dm755 "$pkgdir/usr/share/man/man1/"
   gzip "${srcdir}/${pkgname}-${pkgver}beta1/man/vpcs.1" -cv --best > "$pkgdir/usr/share/man/man1/vpcs.1.gz"
}
