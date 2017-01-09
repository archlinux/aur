# Maintainer: bartus <aur@bartus.33mail.com>
pkgname=meshlab-git
pkgver=2016.12.r10.g781a39a5
pkgrel=2
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning (qt5 version)"
arch=('i686' 'x86_64')
url="http://www.meshlab.net"
conflicts=('meshlab')
provides=('meshlab')
license=('GPL2') depends=('bzip2' 'muparser' 'levmar' 'lib3ds' 'desktop-file-utils' 'glu' 'mpir' 'openssl' 'qt5-base' 'qt5-declarative' 'qt5-script')
#also create openctm(aur) jhead-lib structuresynth-lib to handle last dep
makedepends=('git' 'chrpath')
install="${pkgname}.install"
source=("git+https://github.com/cnr-isti-vclab/meshlab.git"
        "git+https://github.com/cnr-isti-vclab/vcglib.git#branch=devel"
        "plugin_dir.patch"
        "shaders_dir.patch"
        "external.patch"
        "3ds.patch"
        "levmar.patch"
        "muparser.patch"
        "bzip2.patch"
        "meshlabserver_GLU.patch"
        "cpp11_abs.patch"
        "mpir.patch"
        "rpath.patch"
        "meshlab.desktop")
md5sums=('SKIP'
         'SKIP'
         'f13d58ca07fa74b3d7c8f7f9d4ee6a93'
         '753dd4753081ddb428f4db8eaefe9009'
         '038494125d7bd422074fc5635c5579ca'
         'e51b027eb9d78b82de73c4724b3928cf'
         '9eb027efe2d8584c693a4314db9e5bb5'
         '64caafa96bef4208d641e889099eba26'
         '616b0dcf018f46a490867028d6ddc533'
         'ca962601b06fac1fb2b6bf0b408777ad'
         '76e48d239b21c23dcea9198c69864f69'
         '5df295c21de5bac8d6073528823d975a'
         '78bf780b3353fe212a77eb91db6f6b6c'
         '18aed0a21276a22325bf8c32166fb110')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"

  # remove bundled headers and libraries
  rm -fr meshlab/src/external/{inc,lib}

  msg "truncate external lib"
  patch -Np0 -i external.patch
  msg "fix rpath"
  patch -Np0 -i rpath.patch
  msg "fix meshalbserver missing -lGLU"
  patch -Np0 -i meshlabserver_GLU.patch
  msg "fix cpp11 abs()"
  patch -Np0 -i cpp11_abs.patch
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
  msg "put plugins in /usr/lib/mashlab"
  patch -Np0 -i plugin_dir.patch
  msg "put shaders in /usr/shade/meshlab"
  patch -Np0 -i shaders_dir.patch
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
# The QMAKE_RPATHDIR stuff puts in the path to the compile-time location
# of libcommon, which won't work at runtime, so we change the rpath here.
# Ideally upstream would rename the library to libmeshlab, libmeshlabcommon,
# or the like, so that we could put it in the system library directory
# and avoid rpath entirely. 
## <from fedora build script>
  chrpath -r /usr/lib/meshlab distrib/{meshlab,meshlabserver}
}

package() {
  cd ${srcdir}/meshlab/src/distrib

  # install meshlab
  install -d -m755 ${pkgdir}/usr/bin
  install -d -m755 ${pkgdir}/usr/lib/meshlab
  install -d -m755 ${pkgdir}/usr/share/meshlab
  install -t ${pkgdir}/usr/bin meshlab*
  install -t ${pkgdir}/usr/lib/meshlab libcommon*

  cp -a plugins  ${pkgdir}/usr/lib/meshlab 
  cp -a shaders  ${pkgdir}/usr/share/meshlab
  cp -a textures ${pkgdir}/usr/share/meshlab
  cp -a sample   ${pkgdir}/usr/share/meshlab

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
