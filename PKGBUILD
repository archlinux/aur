# Maintainer: bartus <aur@bartus.33mail.com>
pkgname=meshlab-svn
pkgver=1.3.3_r7021
pkgrel=1
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning"
arch=('i686' 'x86_64')
url="http://meshlab.sourceforge.net/"
conflicts=('meshlab')
provides=('meshlab')
license=('GPL2')
depends=('bzip2' 'muparser' 'levmar' 'lib3ds' 'desktop-file-utils' 'glu' 'mpir' 'openssl' 'qt5-base' 'qt5-declarative' 'qt5-script')
#also create openctm(aur) jhead-lib structuresynth-lib to handle last dep
makedepends=('git' 'subversion')
install="${pkgname}.install"
source=("svn+svn://svn.code.sf.net/p/meshlab/code/trunk/meshlab"
        "git+https://github.com/cnr-isti-vclab/vcglib.git#branch=devel"
        "external.patch"
        "3ds.patch"
        "levmar.patch"
        "muparser.patch"
        "bzip2.patch"
        "meshlabserver_GLU.patch"
        "remove_filter_harmonic.patch"
        "cpp11_abs.patch"
        "fix_locale.patch"
        "mpir.patch"
        "nullptr.patch"
        "rpath.patch"
        "meshlab.desktop")
md5sums=('SKIP'
         'SKIP'
         'e7c45c73829afe804e1c7f6cd19856c9'
         'e51b027eb9d78b82de73c4724b3928cf'
         'f1c1d99c92ff296edf9a8f346dd07b3a'
         '64caafa96bef4208d641e889099eba26'
         '616b0dcf018f46a490867028d6ddc533'
         '5d87f00356539f84f37f873f304eb11e'
         '97d598563cd552a1c90413477f8728e2'
         'c1cfb910d20db49ec195d9918036e3c3'
         '5b59b23cf66e42f8b3d3eabe466b3eaa'
         'bee3a1ea8bf98200314029330b537e58'
         '4c3c6e337f0fb38d07bb73828e56a0de'
         '2cc1246fc1b01029ae762c82a7dbf364'
         '18aed0a21276a22325bf8c32166fb110')

pkgver() {
  cd meshlab
  local ver="$(svnversion)"
  printf "1.3.3_r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}"

  # remove bundled headers and libraries
  rm -fr meshlab/src/external/{inc,lib}

  msg "truncate external lib"
  patch -Np0 -i external.patch
  msg "fix use of bool to return null pointer"
  patch -Np0 -i nullptr.patch
  msg "fix rpath"
  patch -Np0 -i rpath.patch
  msg "fix meshlab/src/plugins_experimental/io_TXT/ case sensitive path"
  mv meshlab/src/plugins_experimental/io_TXT/io_txt.pro meshlab/src/plugins_experimental/io_TXT/io_TXT.pro
  msg "fix meshalbserver missing -lGLU"
  patch -Np0 -i meshlabserver_GLU.patch
  msg "remove filter_harmonic plugin"
  patch -Np0 -i remove_filter_harmonic.patch
  msg "fix cpp11 abs()"
  patch -Np0 -i cpp11_abs.patch
  msg "fix decimal separator problem"
  patch -Np0 -i fix_locale.patch
  msg "using system mpir lib"
  patch -Np0 -i mpir.patch
  msg "using system bzip2 lib"
  patch -Np0 -i bzip2.patch
  msg "using system muparser lib"
  patch -Np0 -i muparser.patch
  msg "using system levmar lib"
  patch -Np0 -i levmar.patch
  msg "using system 3ds lib"
  patch -Np0 -i 3ds.patch
}

build() {
  cd "${srcdir}/meshlab/src"

  msg "build external libraries"
  cd external
  qmake external.pro -r 
  make

  msg "build meshlab"
  cd ..
  qmake meshlab_full.pro -r 
  make
}

package() {
  cd "${srcdir}/meshlab/src"

  # install meshlab
  install -d -m755 "${pkgdir}/opt"
  cp -a distrib "${pkgdir}/opt/meshlab"

  # add symbolic links for executables
  install -d -m755 "${pkgdir}/usr/bin"
  ln -s ../../opt/meshlab/meshlab "${pkgdir}/usr/bin/meshlab"
  ln -s ../../opt/meshlab/meshlabserver "${pkgdir}/usr/bin/meshlabserver"

  # install man pages
  install -d -m755 "${pkgdir}/usr/share/man/man1"
  install -m644 "${srcdir}/meshlab/docs/meshlab.1" "${pkgdir}"/usr/share/man/man1
  install -m644 "${srcdir}/meshlab/docs/meshlabserver.1" "${pkgdir}"/usr/share/man/man1

  # install icons
  install -d -m755 "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}/meshlab/src/meshlab/images/eye_cropped.png" "${pkgdir}/usr/share/pixmaps/meshlab.png"

  # install desktop entry
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/meshlab.desktop" "${pkgdir}/usr/share/applications"
  sed -i "s#Version=.*#Version=$pkgver#" "${pkgdir}/usr/share/applications/meshlab.desktop"
}

# vim:set ts=2 sw=2 et:
