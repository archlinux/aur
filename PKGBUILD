# Maintainer: AFT <aft.power.2014@gmail.com>
pkgname=freefem-cs
pkgver=21.1
pkgrel=1
pkgdesc='An integrated environment for FreeFEM'
arch=('x86_64')
url='https://www.ljll.math.upmc.fr/lehyaric/ffcs/'
license=('LGPL')
makedepends=( 'fakeroot' 'gcc' 'patch' 'cmake'
    'make' 'libglvnd' 'libxt' 'glu' 'libxpm' 'autoconf'
    'fltk' 'bison' 'suitesparse' 'arpack' 'rsync' )
depends=( 'libglvnd' 'suitesparse' 'arpack' 'libxpm' )
source=("https://www.ljll.math.upmc.fr/lehyaric/ffcs/packs/ffcs-21.1-source.tgz"
        "https://www.vtk.org/files/release/6.3/VTK-6.3.0.tar.gz"
        "vtk_gcc.patch"
        "examples.patch"
        "freefem-cs"
        "freefem-cs.desktop")
options=(staticlibs)
sha512sums=(  '8dea4cd99b02d8e5cef18cb21e8a96e12acb3afb8a029651f22db6c5de4d41aed811340f94395ffba42f8597bf5f70d7c7378c185b3a13c0be9108ac02f15d86'
              'a05598ed2a70fae9f07a8d9172cb963194cf75d0fcd995c9ebb614a488d4272988212494b1e9aa87272c0ed732161bba8ff97a0cf6874391c1c5fcf7dc22c309'
              '3ef8abc42d4b111bb507fd41dd8e889027be18a67665596f9852d02504310c67534b0a1d1be24b34aa68ed3d4354633008b7e2e9f49ce8397fc06c9d60d309ca'
              'f98c6124e782726c39b8ecac4ee9849484c761f18add6928e9e172f1b31306883291f53a8c29ad30ea5430906f66d44beb2e6149a71c170f332a6b1e9d79f0fb'
              'c5cb8979ef96d8b1759f99f19863f5d47b91a310cf50d88e2282ec2b16801408441925d29d409e779b2995993e7c95a2234a69545a1a8b42bd8be50da537394b'
              '4ebbfb0ca1957f9f5ed01b3b40c0aa9fb5bd70cf4b47ad1dc55f8ab7394fe7e2120aec8839bc2146861ef021f62f340b3f028ba39bf7f57bd0ce4f1c6b59394f')

prepare() {
  # Patch VTK6 to work with newwer versions of GCC
  cd "${srcdir}"/VTK-6.3.0
  patch -Np1 -i "${srcdir}"/vtk_gcc.patch

  # Patch the examples installation script as it causes problems 
  # for when it tries to delete directories that aren't there
  cd "${srcdir}"/ffcs
  patch -Np1 -i "${srcdir}"/examples.patch

}

build() {
  mkdir -p "${srcdir}"/vtk-build
  cd "${srcdir}"/vtk-build

  # Build VTK6 with c++11 because newer standards raise errors
  cmake -Wno-dev -DCMAKE_CXX_STANDARD=11 "${srcdir}"/VTK-6.3.0
  make -j8

  # Install VTK6 to a temporary directory to be used by FF-cs
  make DESTDIR="${srcdir}"/vtk-install -j8 install
  
  # Configure and build FF-cs
  cd "${srcdir}"/ffcs
  ./configure --with-vtk-libdir="${srcdir}/vtk-install/usr/local/lib" --with-vtk-includedir="${srcdir}/vtk-install/usr/local/include/vtk-6.3/" --with-vtk-major="6.3"
  make -j8

}


package() {
  # Install the package files to /opt
  install -dv "${pkgdir}/opt"
  cp -r "${srcdir}/ffcs/pack/work" "${pkgdir}/opt/ffcs"
  install -Dm755 "${srcdir}/freefem-cs" "${pkgdir}/usr/bin/freefem-cs"

  # Install license
  install -Dm644 "${srcdir}/ffcs/COPYING" "${pkgdir}/usr/share/licenses/FreeFem-cs/COPYING"

  # Install the desktop entry
  install -Dm644 "${srcdir}/freefem-cs.desktop" "${pkgdir}/usr/share/applications/freefem-cs.desktop"

}
