# Maintainer: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=j9-git
pkgver=9.02.03.20200604
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
sed -i "s@jgit=~/git/jsource@jgit=${srcdir}/jsource-master@" make/jvars.sh
sed -i "s@jbld=~/jbld@jbld=${srcdir}/jsource-master/jbld@" make/jvars.sh
sed -i "s@cd ~@cd ${srcdir}/jsource-master@" make/build_jconsole.sh
sed -i "s@-l:libedit.so.2@-ledit@" make/build_jconsole.sh
sed -i "s@cd ~@cd ${srcdir}/jsource-master@" make/build_libj.sh
sed -i "s@-mavx -DC_AVX=1@-mavx -march=native -DC_AVX=1@" make/build_libj.sh
sed -i "s@cd ~@cd ${srcdir}/jsource-master@" make/domake.sh
sed -i "s@else if(_isnan(@// else if(_isnan(@" jsrc/f2.c
cd ${srcdir}/qtide-master
sed -i "s@#include <QPainter>@#include <QPainter>\n#include <QPainterPath>@" lib/wd/isigraph2.h
}

build() {
# jsource
cd ${srcdir}/jsource-master
rm -rf jbld
mkdir -p jbld/jout
mkdir jbld/j64
cp -r jlibrary/* jbld/j64
. make/jvars.sh
make/build_jconsole.sh j64
make/build_libj.sh j64
# qtide
cd ${srcdir}/qtide-master/lib
qmake && make
cd ${srcdir}/qtide-master/main
qmake && make
}

package() {
cd ${srcdir}
cp -a jenv/* ${pkgdir}/
cp -a jsource-master/jbld/j64/bin/jconsole ${pkgdir}/usr/lib/j9/bin/jconsole
cp -a jsource-master/jbld/j64/bin/libj.so ${pkgdir}/usr/lib/j9/bin/libj.so
cp -a qtide-master/bin/linux-x86_64/release/*  ${pkgdir}/usr/lib/j9/bin/
echo "${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz (Arch Linux package)" > ${pkgdir}/usr/lib/j9/bin/installer.txt
}
