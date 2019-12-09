# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=meshlab-git
pkgver=2019.12.06.f8778c4.r0.gf8778c44
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
        "revert-external.patch"
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
        "qt5.11.patch"
        "meshlab.desktop")
sha256sums=('SKIP'
            'SKIP'
            'aeef11fabc93d3dc1b804a400081f35b428ed5cbe270282298dd84b831eb5b96'
            '0072605f6547f92f0d0c3abd18ec904d325185a5b6feac500ec0cb34e38b72b4'
            '736c7afac25bc7b23703082c4d79a9981782038d23e39b646adfeae345d44374'
            '21e9f2fc1c971fbd00cb9d40e773c07ba24de0482197fd1b4ca42908f2097fc9'
            '86d6c8c5133fc0823a11289ab9e19c850e4564535c2026787e2da00d7d2b184b'
            'e37a51fe244764b644764387a1d24dcd7262b6aee12386e1d9baa771bf4f8287'
            '7c048e5b70bb7be3530392dab606713b04878304ce0a6cde6156b9a84b3261f5'
            '48229a56e8b61b8a0c21062e1cfe0ae2417f7609aa1a2ad29debdd636cadae3d'
            '5a041c414777036ebd8925108a9bb51f66ab435324ff4671012bdcb806fcf400'
            '865b318f4196b1a34b17867dc18e116ef5f702b4905bb2d536609eb79af1c1bc'
            'c43cb14de251f369734330e1f93744f71527360e1894c93e9f9f8abe686db050'
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

  msg "revert upstram patch to external lib"
  patch -Np1 -i ${srcdir}/revert-external.patch
  msg "truncate external lib"
  patch -Np1 -i ${srcdir}/external.patch
  msg "fix rpath"
  patch -Np1 -i ${srcdir}/rpath.patch
  msg "fix meshalbserver missing -lGLU"
  patch -Np1 -i ${srcdir}/meshlabserver_GLU.patch
  msg "using system mpir lib"
  patch -Np1 -i ${srcdir}/mpir.patch
  msg "using system muparser lib"
  patch -Np1 -i ${srcdir}/muparser.patch
  msg "using system levmar lib"
  patch -Np1 -i ${srcdir}/levmar.patch
  msg "using system 3ds lib"
  patch -Np1 -i ${srcdir}/3ds.patch
  msg "put plugins in /usr/lib/mashlab"
  patch -Np1 -i ${srcdir}/plugin_dir.patch
  msg "put shaders in /usr/shade/meshlab"
  patch -Np1 -i ${srcdir}/shaders_dir.patch
  msg "qt(5.11) compatibility"
  patch -Np1 -i ${srcdir}/qt5.11.patch
  msg "fix muparser unicode string"
  patch -Np1 -i ${srcdir}/muparser_drop_unicode.patch
  cd ${srcdir}/vcglib
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
