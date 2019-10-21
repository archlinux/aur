# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=meshlab-git
pkgver=2019.01.29.f6c6675.r2.g17d380b1
pkgrel=1
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning (qt5 version)"
arch=('i686' 'x86_64')
url="https://www.meshlab.net"
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
        "muparser_drop_unicode.patch"
        "meshlabserver_GLU.patch"
        "mpir.patch"
        "rpath.patch"
        "import_bundle_out.patch"
        "qt5.11.patch"
        "meshlab.desktop")
sha256sums=('SKIP'
            'SKIP'
            '0072605f6547f92f0d0c3abd18ec904d325185a5b6feac500ec0cb34e38b72b4'
            '736c7afac25bc7b23703082c4d79a9981782038d23e39b646adfeae345d44374'
            '4897153f5edc8e36961d4251d8ea0b4cf3514ebf1258f6ffd7a933f02d594162'
            'a2b539e42a2468b95ecf5d08c269f3bbc5d9672840e3743e5facbd7a90b9564c'
            'b2ae4862d98723c20be2312da2e5e73f3d59e9cc202f677b51e89270671bdf42'
            '8b14d074da7d037814ffc901b3c03e9a2fa91f1b44ec0d83b7aeef4f380aa185'
            '48229a56e8b61b8a0c21062e1cfe0ae2417f7609aa1a2ad29debdd636cadae3d'
            '5a041c414777036ebd8925108a9bb51f66ab435324ff4671012bdcb806fcf400'
            '865b318f4196b1a34b17867dc18e116ef5f702b4905bb2d536609eb79af1c1bc'
            'c43cb14de251f369734330e1f93744f71527360e1894c93e9f9f8abe686db050'
            'b3a72caff34d3c05840298bc7b758061dc353b662e1bb526dfb5463fa2a7cd18'
            '2236863292bf078b2e89d278bad834fd08563613d40e33ec471ae92588132a57'
            '030ab1dcafb7d793bed3bc455497208addadf1091a4619576fe7e044aed4231a')

pkgver() {
  cd ${srcdir}/${pkgname%-git}
  local date=$(git log --tags --simplify-by-decoration --pretty=format:"%ai" -1|cut -d' ' -f1|sed 's/-/\./g')
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^/${date}\./g"
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
  msg "fix muparser unicode string"
  patch -Np1 -i ../muparser_drop_unicode.patch
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
