# Maintainer: Andriy Mykhaylyk <erp dot lsf at gmail dot com>
# Maintainer: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=j9-git
pkgver=9.02.03.20201214
pkgrel=1
pkgdesc='J is a modern, high-level, general-purpose, high-performance programming language'
arch=('x86_64')
url='http://www.jsoftware.com'
license=('GPL3'  'LGPL')
depends=('qt5-webengine' 'qt5-websockets' 'qt5-multimedia' 'qt5-svg')
optdepends=('wget: for web/gethttp addon'
            'expat: for api/expat addon'
            'fftw: for math/fftw addon'
            'lapack: for math/lapack addon')
makedepends=('clang')
            source=('jsource.zip::https://github.com/jsoftware/jsource/archive/master.zip'
        'qtide.zip::https://github.com/jsoftware/qtide/archive/master.zip'
        'jenv.tar.gz::http://www.databaserossoverde.it/jsoftware/j902_env_20200604.tar.gz')
md5sums=('SKIP' 'SKIP' '97d95a813d13ff4c4242f701dd6c6a2f')
install=j9-git.install

pkgver() {
cd ${srcdir}
echo "$(head -c 7 jenv/usr/lib/j9/system/config/version.txt)"."$(date +%Y%m%d)"
} 

prepare() {
cd ${srcdir}/jsource-master
echo '#define jversion "902"' > jsrc/jversion.h
echo '#define jplatform "linux"' >> jsrc/jversion.h
echo '#define jtype "build"' >> jsrc/jversion.h
echo '#define jlicense "GPL3"' >> jsrc/jversion.h
echo '#define jbuilder "www.jsoftware.com"' >> jsrc/jversion.h
sed -i "s@-Werror@-Werror -Wno-return-local-add@" make2/build_jnative.sh 
sed -i "s@-Werror@-Werror -Wno-return-local-add@" make2/build_libj.sh 
sed -i "s@-Werror@-Werror -Wno-return-local-add@" make2/build_tsdll.sh 
sed -i "s@-Werror@-Werror -Wno-return-local-add@" make2/build_jconsole.sh 
cd ${srcdir}/qtide-master
sed -i "s@#include <QPainter>@#include <QPainter>\n#include <QPainterPath>@" lib/wd/isigraph2.h
}

build() {
# jsource
cd ${srcdir}/jsource-master
make2/build_all.sh
make2/cpbin.sh
# qtide
cd ${srcdir}/qtide-master/lib
qmake && make
cd ${srcdir}/qtide-master/main
qmake && make
}

package() {
cd ${srcdir}
cp -a jenv/* ${pkgdir}/
cp -a jsource-master/jlibrary/bin/jconsole ${pkgdir}/usr/lib/j9/bin/jconsole
cp -a jsource-master/jlibrary/bin/libj.so ${pkgdir}/usr/lib/j9/bin/libj.so
cp -a jsource-master/jlibrary/bin/libtsdll.so ${pkgdir}/usr/lib/j9/bin/libtsdll.so
cp -a qtide-master/bin/linux-x86_64/release/*  ${pkgdir}/usr/lib/j9/bin/
echo "${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz (Arch Linux package)" > ${pkgdir}/usr/lib/j9/bin/installer.txt
}
