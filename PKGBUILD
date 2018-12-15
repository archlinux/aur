# Maintainer: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=j8-git
pkgver=8.07.20.20181215
pkgrel=2
pkgdesc='J is a modern, high-level, general-purpose, high-performance programming language'
arch=('i686' 'x86_64')
url='http://www.jsoftware.com'
license=('GPL3'  'LGPL')
depends=('qt5-webkit' 'qt5-multimedia' 'qt5-svg')
optdepends=('wget: for web/gethttp addon'
            'expat: for api/expat addon'
            'fftw: for math/fftw addon'
            'lapack: for math/lapack addon')
makedepends=('clang')
            source=('jsource.zip::https://github.com/jsoftware/jsource/archive/master.zip'
        'qtide.zip::https://github.com/jsoftware/qtide/archive/master.zip'
        'jenv.tar.gz::http://www.databaserossoverde.it/jsoftware/j807_env_20181215.tar.gz')
md5sums=('SKIP' 'SKIP' '9cf1c95f1d538b63ac6370e1aef62522')
install=j8-git.install
if [ "${CARCH}" = x86_64 ]; then
_xarch=x86_64
_jarch=j64
else
_xarch=x86
_jarch=j32
fi

pkgver() {
cd ${srcdir}
echo "$(head -c 7 jenv/usr/lib/j8/system/config/version.txt)"."$(date +%Y%m%d)"
} 

prepare() {
cd ${srcdir}/jsource-master
echo '#define jversion "807"' > jsrc/jversion.h
echo '#define jplatform "linux"' >> jsrc/jversion.h
echo '#define jtype "build"' >> jsrc/jversion.h
echo '#define jlicense "GPL3"' >> jsrc/jversion.h
echo '#define jbuilder "www.jsoftware.com"' >> jsrc/jversion.h
sed -i "s@jgit=~/git/jsource@jgit=${srcdir}/jsource-master@" make/jvars.sh
sed -i "s@jbld=~/jbld@jbld=${srcdir}/jsource-master/jbld@" make/jvars.sh
sed -i "s@cd ~@cd ${srcdir}/jsource-master@" make/build_jconsole.sh
sed -i "s@-l:libedit.so.2@-ledit@" make/build_jconsole.sh
sed -i "s@cd ~@cd ${srcdir}/jsource-master@" make/build_libj.sh
sed -i "s@cd ~@cd ${srcdir}/jsource-master@" make/domake.sh
sed -i "s@else if(_isnan(@// else if(_isnan(@" jsrc/f2.c
}

build() {
# jsource
cd ${srcdir}/jsource-master
rm -rf jbld
mkdir -p jbld/jout
mkdir jbld/${_jarch}
cp -r jlibrary/* jbld/${_jarch}
. make/jvars.sh
make/build_jconsole.sh ${_jarch}
make/build_libj.sh ${_jarch}
# qtide
cd ${srcdir}/qtide-master/lib
qmake && make
cd ${srcdir}/qtide-master/main
qmake && make
}

package() {
cd ${srcdir}
cp -a jenv/* ${pkgdir}/
cp -a jsource-master/jbld/${_jarch}/bin/jconsole ${pkgdir}/usr/lib/j8/bin/jconsole
cp -a jsource-master/jbld/${_jarch}/bin/libj.so ${pkgdir}/usr/lib/j8/bin/libj.so
cp -a qtide-master/bin/linux-${_xarch}/release/*  ${pkgdir}/usr/lib/j8/bin/
echo "${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz (Arch Linux package)" > ${pkgdir}/usr/lib/j8/bin/installer.txt
}
