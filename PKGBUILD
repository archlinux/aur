# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=graclus
pkgver=1.2
pkgrel=1
pkgdesc="Efficient Graph Clustering Software."
arch=('i686' 'x86_64')
url="http://www.cs.utexas.edu/users/dml/Software/graclus.html"
license=('GPL')
depends=('gcc-libs')
conflicts=('metis')
source=("http://www.cs.utexas.edu/users/dml/Software/${pkgname}${pkgver}.tar.gz")
md5sums=('7e6a81037632f11d52e6800f7212ab2d')

prepare() {
    cd "${pkgname}${pkgver}"

    sed -i '13 i \
../libmultilevel.so: $(OBJS)\
	gcc -shared -Wl,-soname,libmultilevel.so.1 -o $@  $(OBJS)' multilevelLib/Makefile

    sed -i '22 i \
../libmetis.so: $(OBJS)\
	gcc -shared -Wl,-soname,libmetis.so.1 -o $@  $(OBJS)' metisLib/Makefile

    sed -i 's/libmetis\.a/libmetis\.so/' programs/Makefile
    sed -i 's/libmultilevel\.a/libmultilevel\.so/' programs/Makefile

    if [ "$CARCH" = "x86_64" ]; then
        sed -i 's/-DNUMBITS=32/-DNUMBITS=64/' Makefile.in
    fi
}

build() {
	cd "${pkgname}${pkgver}"
	make
}

package() {
    cd "${pkgname}${pkgver}"
    install -D -t "${pkgdir}/usr/bin" graclus
    install -D -t "${pkgdir}/usr/lib" libmetis.so libmultilevel.so
    install -D -t "${pkgdir}/usr/include/metis" metisLib/*.h
}
