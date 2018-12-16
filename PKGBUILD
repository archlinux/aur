# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=meshlab-git
pkgver=42ef8f6.r0.g42ef8f6c
pkgrel=1
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning (qt5 version)"
arch=('i686' 'x86_64')
url="http://www.meshlab.net"
conflicts=('meshlab')
provides=('meshlab')
license=('GPL2')
depends=('bzip2' 'desktop-file-utils' 'glu' 'openssl-1.0' 'qt5-base' 'qt5-declarative' 'qt5-script' 'qt5-xmlpatterns')
makedepends=('git' 'muparser' 'levmar' 'lib3ds' 'mpir')
optdepends=('u3d: for U3D and IDTF file support'
            'lib3ds: for Autodesk`s 3D-Studio r3 and r4 .3DS file support'
            'levmar: for isoparametrization and mutualcorrs plugins'
            'muparser: for filer_func plugins'
            'mpir: for Constructive Solid Geometry operation filters')
#also create openctm(aur) jhead-lib structuresynth-lib to handle last dep
install="${pkgname}.install"
source=("git+https://github.com/cnr-isti-vclab/meshlab.git"
        "git+https://github.com/cnr-isti-vclab/vcglib.git#branch=devel"
        "plugin_dir.patch"
        "shaders_dir.patch"
        "external.patch"
        "3ds.patch"
        "levmar.patch"
        "muparser.patch"
        "meshlabserver_GLU.patch"
        "mpir.patch"
        "rpath.patch"
        "import_bundle_out.patch"
        "qt5.11.patch"
        "meshlab.desktop")
md5sums=('SKIP'
         'SKIP'
         'c1167629f7cebe025ba2cf29846462fd'
         'ad6d2259bd491859834bd42cec92f245'
         '0ac7701c703d3d88a9295f8fb39beeb9'
         '473a1af178e0ea2e92441e5dc29a3842'
         '32581c7128c8e544705c39e59647ab10'
         'f1efa4f1400cc0952fdcd44adc11174b'
         'a4f7548978564637e502ecdbd2b537e0'
         '726e5aeee66681b586150c08cafbe3f1'
         'eb89ce7e86bba52ca4ad4aa173d3f8a2'
         '3fc5cafa9792a89807b51c5a1859d152'
         'fc06e29d2f91b01a768ab29707a65725'
         '18aed0a21276a22325bf8c32166fb110')

pkgver() {
  cd ${srcdir}/${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname%-git}

  # remove bundled headers and libraries
  rm -fr meshlab/src/external/{inc,lib}

  msg "truncate external lib"
  patch -Np1 -i ../external.patch
  msg "fix rpath"
  patch -Np1 -i ../rpath.patch
  msg "fix meshalbserver missing -lGLU"
  patch -Np1 -i ../meshlabserver_GLU.patch
  msg "using system mpir lib"
  patch -Np1 -i ../mpir.patch
  msg "using system muparser lib"
  patch -Np1 -i ../muparser.patch
  msg "using system levmar lib"
  patch -Np1 -i ../levmar.patch
  msg "using system 3ds lib"
  patch -Np1 -i ../3ds.patch
  msg "put plugins in /usr/lib/mashlab"
  patch -Np1 -i ../plugin_dir.patch
  msg "put shaders in /usr/shade/meshlab"
  patch -Np1 -i ../shaders_dir.patch
  msg "qt(5.11) compatibility"
  patch -Np1 -i ../qt5.11.patch
  cd ${srcdir}/vcglib
  msg "fix import bundler/nvm"
  patch -Np1 -i ../import_bundle_out.patch
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
  
  # add xml symlinks to propper show info in "help>plugin info" dialog
  cd ${pkgdir}/usr/lib/meshlab/plugins
  for xml in *.xml ; do ln -s $xml lib${xml} ; done
}

# vim:set ts=2 sw=2 et:
