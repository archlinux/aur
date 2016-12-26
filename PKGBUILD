# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=meshlab
_realpkgname=MeshLab
pkgver=2016.12
pkgrel=1
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning (qt5 version)"
arch=('i686' 'x86_64')
url="http://www.meshlab.net/"
license=('GPL2')
depends=('bzip2' 'muparser' 'levmar' 'lib3ds' 'desktop-file-utils' 'glu' 'mpir' 'openssl' 'qt5-base' 'qt5-declarative' 'qt5-script')
makedepends=('git')
source=("git://github.com/cnr-isti-vclab/${pkgname}.git#tag=v2016.12"
        "git://github.com/cnr-isti-vclab/vcglib.git#commit=611341b754b08dd2b8d655b92d855de9dcce4a18"
        "cpp11_abs.patch"
        "rpath.patch"
        "meshlabserver_GLU.patch"
        "external.patch"
        "3ds.patch"
        "bzip2.patch"
        "levmar.patch"
        "mpir.patch"
        "muparser.patch"
        "meshlab.1"
        "meshlabserver.1"
        "meshlab.desktop")
md5sums=('SKIP'
         'SKIP'
         'c1cfb910d20db49ec195d9918036e3c3'
         '2cc1246fc1b01029ae762c82a7dbf364'
         '5d87f00356539f84f37f873f304eb11e'
         '038494125d7bd422074fc5635c5579ca'
         'e51b027eb9d78b82de73c4724b3928cf'
         '616b0dcf018f46a490867028d6ddc533'
         '1a53a92e12f74520b36e38d9a2311834'
         '5dbc0d45dd96a4439857d51c545dafb9'
         '64caafa96bef4208d641e889099eba26'
         '32a52b0a8dab1b4816b028b463e7fd9c'
         '0af205a93961dbfcb6b003765f79c4cf'
         '18aed0a21276a22325bf8c32166fb110')

prepare() {
  cd "${srcdir}/${pkgname}"

  # remove bundled headers and libraries
  rm -fr src/external/{inc,lib}
  # fix wrong case for io_TXT plugin project file
  mv src/plugins_experimental/io_TXT/io_txt.pro src/plugins_experimental/io_TXT/io_TXT.pro
  # fix C++11 abs()
  patch -Np1 -i "${srcdir}/cpp11_abs.patch"
  # fix rpath
  patch -Np1 -i "${srcdir}/rpath.patch"
  # add missing linking of GLU library for meshlabserver
  patch -Np1 -i "${srcdir}/meshlabserver_GLU.patch"
  # do not use bundled external libraries
  patch -Np1 -i "${srcdir}/external.patch"
  # use system 3ds library
  patch -Np1 -i "${srcdir}/3ds.patch"
  # use system bzip2 library
  patch -Np1 -i "${srcdir}/bzip2.patch"
  # use system levmar library
  patch -Np1 -i "${srcdir}/levmar.patch"
  # use system mpir library
  patch -Np1 -i "${srcdir}/mpir.patch"
  # use system muparser library
  patch -Np1 -i "${srcdir}/muparser.patch"
}

build() {
  cd "${srcdir}/${pkgname}/src"

  # build external libraries
  cd external
  qmake -recursive external.pro
  make

  # build meshlab
  cd ..
  qmake -recursive meshlab_full.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}/src"

  # install meshlab
  install -d -m755 "${pkgdir}/opt"
  cp -a distrib "${pkgdir}/opt/meshlab"

  # add symbolic links for executables
  install -d -m755 "${pkgdir}/usr/bin"
  ln -s ../../opt/meshlab/meshlab "${pkgdir}/usr/bin/meshlab"
  ln -s ../../opt/meshlab/meshlabserver "${pkgdir}/usr/bin/meshlabserver"

  # install man pages
  install -d -m755 "${pkgdir}/usr/share/man/man1"
  install -m644 "${srcdir}/meshlab.1" "${pkgdir}"/usr/share/man/man1
  install -m644 "${srcdir}/meshlabserver.1" "${pkgdir}"/usr/share/man/man1

  # install icons
  install -d -m755 "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}/meshlab/src/meshlab/images/eye_cropped.png" "${pkgdir}/usr/share/pixmaps/meshlab.png"

  # install desktop entry
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/meshlab.desktop" "${pkgdir}/usr/share/applications"
  sed -i "s#Version=.*#Version=$pkgver#" "${pkgdir}/usr/share/applications/meshlab.desktop"
}

# vim:set ts=2 sw=2 et:
