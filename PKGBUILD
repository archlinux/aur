# Maintainer: bartus <aur@bartus.33mail.com>
pkgname=meshlab-git
pkgver=2016.12.r177.g70b9dd7f
pkgrel=1
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning (qt5 version)"
arch=('i686' 'x86_64')
url="http://www.meshlab.net"
conflicts=('meshlab')
provides=('meshlab')
license=('GPL2') depends=('bzip2' 'muparser' 'levmar' 'lib3ds' 'desktop-file-utils' 'glu' 'mpir' 'openssl' 'qt5-base' 'qt5-declarative' 'qt5-script')
#also create openctm(aur) jhead-lib structuresynth-lib to handle last dep
makedepends=('git')
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
        "meshlab.desktop")
md5sums=('SKIP'
         'SKIP'
         'f13d58ca07fa74b3d7c8f7f9d4ee6a93'
         '753dd4753081ddb428f4db8eaefe9009'
         '038494125d7bd422074fc5635c5579ca'
         '0b338147c8c222cc4681d804bb4e7ae0'
         'fedc40ddd411a7e41d4be57dbb452262'
         '543c52237d91c1f6012b34579c4f0c74'
         'ca962601b06fac1fb2b6bf0b408777ad'
         'cb5a75c2f2cdf154ad61f753439f226f'
         '07da2fc11c1667e6c6a07f0042a2757d'
         '765a59b64dd05b74f6a4bdf3962a1d93'
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
  msg "using system mpir lib"
  patch -Np0 -i mpir.patch
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
  msg "fix import bundler/nvm"
  patch -Np0 -i import_bundle_out.patch
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
}

# vim:set ts=2 sw=2 et:
