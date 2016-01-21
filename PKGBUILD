# Maintainer: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=j8-git
pkgver=8.04.15.20160121
pkgrel=4
pkgdesc='J is a modern, high-level, general-purpose, high-performance programming language'
arch=('i686' 'x86_64')
url='http://www.jsoftware.com'
license=('GPL3'  'LGPL')
depends=('xdg-utils' 'qt5-webkit' 'qt5-websockets' 'qt5-multimedia')
optdepends=('wget: for web/gethttp addon'
            'expat: for api/expat addon'
            'fftw: for math/fftw addon'
            'lapack: for math/lapack addon')
source=('jsource.zip::http://www.jsoftware.com/gitlist/jsource.git/zipball/master'
        'qtide.zip::http://www.jsoftware.com/gitlist/qtide.git/zipball/master'
        'jenv.tar.gz::http://www.databaserossoverde.it/jsoftware/j804_env_20160121.tar.gz')
md5sums=('SKIP' 'SKIP' 'f157ca86bba79f5ae620cb19b163d5e8')
install=j8-git.install
if [ "${CARCH}" = x86_64 ]; then
_xarch=x86_64
_jarch=j64
else
_xarch=x86
_jarch=j32
fi

pkgver() {
cd "${srcdir}"
echo "$(head -c 7 jenv/usr/lib/j8/system/config/version.txt)"."$(date +%Y%m%d)"
} 

prepare() {
cd "${srcdir}"
echo '#define jversion "804"' > jsrc/jversion.h
echo '#define jplatform "linux"' >> jsrc/jversion.h
echo '#define jtype "build"' >> jsrc/jversion.h
echo '#define jlicense "GPL3"' >> jsrc/jversion.h
echo '#define jbuilder "www.jsoftware.com"' >> jsrc/jversion.h
sed -i "s@jgit=~/gitdev/jsource@jgit=${srcdir}@" make/jvars.sh
sed -i "s@jbld=~/jbld@jbld=${srcdir}/jbld@" make/jvars.sh
sed -i "s@cd ~@cd ${srcdir}@" make/build_jconsole.sh
sed -i "s@cd ~@cd ${srcdir}@" make/build_libj.sh
sed -i "s@cd ~@cd ${srcdir}@" make/domake.sh
cp make/jvars.sh ./
}

build() {
# jsource
cd "${srcdir}"
rm -rf "${srcdir}/jbld"
mkdir -p "${srcdir}/jbld/jout"
mkdir "${srcdir}/jbld/${_jarch}"
cp -r "${srcdir}"/jlibrary/* "${srcdir}/jbld/${_jarch}"
"${srcdir}"/make/build_jconsole.sh "${_jarch}"
"${srcdir}"/make/build_libj.sh "${_jarch}"
# qtide
cd "${srcdir}/lib"
qmake && make
cd "${srcdir}/main"
qmake && make
}

package() {
cd "${srcdir}"
cp -a jenv/* "${pkgdir}"/
cp -a jbld/"${_jarch}"/bin/{jconsole,libj.so} "${pkgdir}"/usr/lib/j8/bin/
cp -a bin/linux-"${_xarch}"/release/*  "${pkgdir}"/usr/lib/j8/bin/
echo "${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz (Arch Linux package)" > ${pkgdir}/usr/lib/j8/bin/installer.txt
}
