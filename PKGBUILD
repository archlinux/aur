# Maintainer: Alexander Phinikarides (alexisph -at- gmail -dot- com)

pkgname=microsoft-r-open
pkgver=3.3.1
pkgrel=1
_majorver=3.3
_mrandate=2016-07-01
pkgdesc="Language and environment for statistical computing and graphics, modified version by Microsoft"
arch=('x86_64')
license=('GPL')
url='https://mran.revolutionanalytics.com/open/'
provides=("r=${pkgver}")
conflicts=('r')
depends=('bzip2'
        'curl'
        'desktop-file-utils'
        'gcc-libs'
        'libjpeg'
        'libpng'
        'libpng12'
        'libtiff'
        'libxmu'
        'libxt'
        'ncurses'
        'pango'
        'pcre'
        'perl'
        'readline'
        'unzip'
        'xz'
        'zip'
        'zlib')
makedepends=('java-environment'
            'gcc-fortran'
            'tk'
            'rpmextract')
optdepends=('tk: tcl/tk interface'
            'texlive-bin: latex sty files')
backup=('etc/R/Makeconf'
        'etc/R/Renviron'
        'etc/R/ldpaths'
        'etc/R/repositories'
        'etc/R/javaconf')
options=('!makeflags' '!emptydirs')
install=microsoft-r-open.install
source=("https://mran.revolutionanalytics.com/install/mro/${pkgver}/microsoft-r-open-${pkgver}.tar.gz"
        'mro.desktop'
        'mro.png'
        'R.conf')
md5sums=('e0c50107acb08ec2aa7fee0d8076c4bd'
         '70e8f9d0b1eebeb1f0b45f4568bc0701'
         '8e0c51650b8a63f110fa7b09e699e9c4'
         '6c381ed007c2bfc97ab42f05bf50b57d')
sha512sums=('ba163cc29fa7c828f696f25bdec5c18dc235e58b4da0804c449510e1e7534245ef51e2ed0e5d880efdbdf4660eff2ee37cd95badbd31a128a623f109b30deeb4'
            '2b0221bd1e0fdd399284333e6f2020bb9ad11395ad39dd2fca688b7ebc68fbbc60de59a757e1898be8bcd9e2926afccc121043f38445e7693f177c3076f92b61'
            '1491b01d3d14b86d26c383e00e2305858a52ddd498158c9f7f6b33026ee01f246408b1676cffea73f7783c8c4cf546285705c43c0286adbd75ad77706918b5fe'
            '41e6779500748eee0fa785a20bcaf7323d4aa67000386243fdfe1681152023fb4a5dd4e1f078eeae24db18c223f86fa57afbbad391da226988b0a14eec75c986')

prepare() {
  cd ${pkgname}
  # extract rpms
  rpmextract.sh "rpm/${pkgname}-mro-${_majorver}.rpm"
  rpmextract.sh "rpm/${pkgname}-mkl-${_majorver}.rpm"
  rpmextract.sh "rpm/${pkgname}-foreachiterators-${_majorver}.rpm"
  mv usr/lib64 usr/lib
}

package() {
  cd ${pkgname}
  cp -r usr "${pkgdir}"

  # Install MKL libs
  install -d "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/backup/lib"
  mv ${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/lib/*.so "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/backup/lib"
  install -Dm644 "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/backup/lib/libR.so" "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/lib/libR.so"
  install -Dm644 ${pkgdir}/usr/lib/microsoft-r/${_majorver}/stage/mkl_install_stage/*.so "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/lib"
  rm -rf ${pkgdir}/usr/lib/microsoft-r/${_majorver}/stage

  # Link R binaries to system path
  install -d "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -s ../lib/microsoft-r/${_majorver}/lib64/R/bin/R
  ln -s ../lib/microsoft-r/${_majorver}/lib64/R/bin/Rscript

  # Install freedesktop.org compatibility
  install -Dm644 "${srcdir}/mro.desktop" "${pkgdir}/usr/share/applications/mro.desktop"
  install -Dm644 "${srcdir}/mro.png" "${pkgdir}/usr/share/pixmaps/mro.png"

  # Create etc config directory
  install -d "${pkgdir}/etc/R"
  cd "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/etc"
  for i in *; do
    mv -f ${i} "${pkgdir}/etc/R"
    ln -s /etc/R/${i} ${i}
  done
  # fix a typo
  sed -i "s|IMPLEMENTATIN|IMPLEMENTATION|g" "${pkgdir}/etc/R/Makeconf"

  # Ensure other applications can access the shared libs
  install -Dm644 "${srcdir}/R.conf" "${pkgdir}/etc/ld.so.conf.d/R.conf"
  sed -i "s/VERSION/${_majorver}/" "${pkgdir}/etc/ld.so.conf.d/R.conf"

  # Install pkgconfig file
  cd "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64"
  sed -i "s|rhome=.*$|rhome=/usr/lib/microsoft-r/${_majorver}/lib64/R|" pkgconfig/libR.pc
  sed -i "s|rincludedir=.*$|rincludedir=/usr/include/R|" pkgconfig/libR.pc
  sed -i "s|-L/builddir/vendor/build/lib||" pkgconfig/libR.pc
  install -Dm644 pkgconfig/libR.pc "${pkgdir}/usr/lib/pkgconfig/libR.pc"

  # Install header files
  install -d "${pkgdir}/usr/include/R"
  cp -r ${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/include/* "${pkgdir}/usr/include/R/"

  # Install man pages
  cd "${pkgdir}/usr/lib/microsoft-r/${_majorver}/share/man/man1"
  gzip -9 *
  install -Dm644 R.1.gz "${pkgdir}/usr/share/man/man1/R.1.gz"
  install -Dm644 Rscript.1.gz "${pkgdir}/usr/share/man/man1/Rscript.1.gz"
  gzip -d *

  # Install shared files
  install -d "${pkgdir}/usr/share/R"
  cp -r "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/share/dictionaries" "${pkgdir}/usr/share/R/"
  cp -r "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/share/encodings" "${pkgdir}/usr/share/R/"
  cp -r "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/share/java" "${pkgdir}/usr/share/R/"
  cp -r "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/share/licenses" "${pkgdir}/usr/share/R/"
  cp -r "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/share/make" "${pkgdir}/usr/share/R/"
  cp -r "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/share/R" "${pkgdir}/usr/share/R/"
  cp -r "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/share/Rd" "${pkgdir}/usr/share/R/"
  cp -r "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/share/sh" "${pkgdir}/usr/share/R/"
  # LaTeX templates
  cp -r "${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/share/texmf" "${pkgdir}/usr/share/"

  # Install docs
  install -d "${pkgdir}/usr/share/doc/R"
  cp -r ${pkgdir}/usr/lib/microsoft-r/${_majorver}/lib64/R/doc/* "${pkgdir}/usr/share/doc/R/"

  # Copy EULAs
  install -d "${pkgdir}/opt/${pkgname}/doc"
  install -m644 ${srcdir}/${pkgname}/*.txt "${pkgdir}/opt/${pkgname}/doc"
}

