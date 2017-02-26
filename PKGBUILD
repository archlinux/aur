# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributors:
#	* olive
#	* mirrr
#	* GUiHKX
#	* alessiofachechi <alessio.fachechi@gmail.com>
#	* jeremy33
#	* jstitch
#	* plv
#	* Scimmia
#	* lorenzo.bandieri

pkgname=cnijfilter-mp250
pkgver=3.40.1
pkgrel=5.1
_pkgrealver=3.40
_pkgrealrel=1
pkgdesc="Canon IJ Printer Driver (MP250 series)"
url="http://support-au.canon.com.au/contents/AU/EN/0100302002.html"
arch=('i686' 'x86_64')
license=('custom')
depends=(
    'libcups'
    'cups'
    'popt'
    'ghostscript'
    'gsfonts'
    'atk>=1.9.0'
    'gtk2>=2.8.0'
    'pango>=1.12.3'
    'libpng>=1.2.8'
    'libtiff'
    'cairo>=1.0.2'
    'libxml2>=2.6.24'
    'fontconfig>=2.3.0'
    'libxinerama'
)
makedepends=(
    'autoconf>=2.13'
    'automake>=1.6'
    'tar'
    'make'
    'gcc'
)
conflicts=('cnijfilter-common')
install=cnijfilter-mp250.install
source=(
    'http://gdlp01.c-wss.com/gds/0/0100003020/01/cnijfilter-source-3.40-1.tar.gz'
    'fix.patch'
    'libpng.patch'
    'automake_fix.patch'
)
md5sums=(
    '609975a05d6050fcca88f312d3f35c6a'
    'ba9c7ec49e76bf74cc50702e362aba7b'
    '15e417cd427a920c83e4f28e225e428e'
    '07f698d8987632d9bb427d3f4a42a29a'
)


prepare() {
  cd "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/"
  patch -p0 < "${srcdir}/fix.patch"
  patch -p0 < "${srcdir}/libpng.patch"
#  patch -p0 < "${srcdir}/automake_fix.patch"
}


build() {

  cd "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/libs"
  ./autogen.sh --prefix=/usr --program-suffix=mp250
  make 

  for dir in {cngpij,cnijfilter,pstocanonij,lgmon,backend,backendnet}
  do
    cd "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/${dir}"
    ./autogen.sh --prefix=/usr --program-suffix=mp250 --enable-progpath=/usr/bin
    make
  done


  cd "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/ppd"
  ./autogen.sh --prefix=/usr --program-suffix=mp250
  make 

  cd "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/cngpijmon/cnijnpr"
  ./autogen.sh --prefix=/usr --program-suffix=mp250 --enable-progpath=/usr/bin LIBS="-ldl"
  make 

}


package() {
  cd "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/libs"
  make DESTDIR="${pkgdir}" install

  for dir in {cngpij,cnijfilter,pstocanonij,lgmon,ppd,cngpijmon/cnijnpr,backend,backendnet}
  do
    cd "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/${dir}"
    make DESTDIR="${pkgdir}" install
  done


  cp "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}"/cnijfilter/src/config* \
    "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}"/lgmon/src/
  cp "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}"/cnijfilter/src/config* \
    "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}"/cngpijmon/cnijnpr/cnijnpr/


  cd "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}"
  install -d "${pkgdir}/usr/lib/bjlib"
  install -m 755 356/database/* "${pkgdir}/usr/lib/bjlib"

  if [ "$CARCH" == "x86_64" ]; then  
    libdir=libs_bin64
  else
    libdir=libs_bin32
  fi
  
  install -m 755 "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/356/${libdir}/libcnbpcmcm356.so.8.0.1" \
    "${pkgdir}/usr/lib/"
  install -m 755 "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/356/${libdir}/libcnbpcnclapi356.so.3.5.0" \
    "${pkgdir}/usr/lib/"
  install -m 755 "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/356/${libdir}/libcnbpcnclbjcmd356.so.3.3.0" \
    "${pkgdir}/usr/lib/"
  install -m 755 "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/356/${libdir}/libcnbpcnclui356.so.3.6.0" \
    "${pkgdir}/usr/lib/"
  install -m 755 "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/356/${libdir}/libcnbpess356.so.3.3.3" \
    "${pkgdir}/usr/lib/"
  install -m 755 "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/356/${libdir}/libcnbpess356.so.3.3.3" \
    "${pkgdir}/usr/lib/"
  install -m 755 "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/356/${libdir}/libcnbpo356.so.1.0.2" \
    "${pkgdir}/usr/lib/"
  install -m 755 "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/com/${libdir}/libcnnet.so.1.2.0" \
    "${pkgdir}/usr/lib/"

  cd "${pkgdir}/usr/lib/"
  ln -s libcnbpcmcm356.so.8.0.1 libcnbpcmcm356.so
  ln -s libcnbpcnclapi356.so.3.5.0 libcnbpcnclapi356.so
  ln -s libcnbpcnclbjcmd356.so.3.3.0 libcnbpcnclbjcmd356.so
  ln -s libcnbpcnclui356.so.3.6.0 libcnbpcnclui356.so
  ln -s libcnbpess356.so.3.3.3 libcnbpess356.so
  ln -s libcnbpo356.so.1.0.2 libcnbpo356.so
  ln -s libcnnet.so.1.2.0 libcnnet.so

  cd "${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}"
  install -D "LICENSE-cnijfilter-${_pkgrealver}EN.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${_pkgrealver}EN.txt"

}
