# Maintainer: Eric Berquist <eric DOT berquist AT gmail>
# Contributor: steabert <steabert@member.fsf.org>
# Contributor: Ricardo Honorato Z.

pkgname=vmd
pkgver=1.9.4a38
pkgrel=3
pkgdesc="Visual Molecular Dynamics"
url="http://www.ks.uiuc.edu/Research/vmd/"
license=('custom')
arch=('x86_64')
depends=('tcsh' 'perl' 'libxi' 'tcl' 'libxinerama' 'libgl' 'glu')
makedepends=('make')
optdepends=('netcdf: MMTK and AMBER 9 trajectories support'
            'openbabel: additional file formats support'
            'sqlite: dmsplugin')
install=vmd.install
provides=('vmd')
conflicts=('vmd-src')
# You MUST download the package from the VMD url and put it in the PKGBUILD folder!
# Current download should be:
# LINUX_64 OpenGL, CUDA, OptiX RTX, OSPRay (Linux (RHEL 6.7+) 64-bit Intel/AMD x86_64 SSE, with CUDA 9.x, OptiX6 RTX, OSPRay)
source=("local://${pkgname}-${pkgver}.bin.LINUXAMD64-CUDA10-OptiX600-RTX-OSPRay170.opengl.tar.gz"
        "vmd.desktop"
        "vmd.install"
        "vmd.png")
sha256sums=("cc6e6fa4f262c86fc0d2bd7b161f37ac5eb3ae05793731709f8d834ef1e5432c"
            "942b752e2c9c1d6e3adb55ccdee14d1794640c341ddb7d8d70fb02396dafe81a"
            "f703f8de14eb277dc72cc837086fbd55f5d772049a44200686c8ae76348f6614"
            "d83f568615ad954f582d986975997186fdacfd8f79c30f49d6aaf07ba2eb6aa7")

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

  export VMDINSTALLBINDIR="${pkgdir}/usr/bin"
  export VMDINSTALLLIBRARYDIR="${pkgdir}/usr/lib/vmd"
  ./configure
  cd src; make install
  sed -i 's|set defaultvmddir=.*|set defaultvmddir=/usr/lib/vmd|' "${pkgdir}/usr/bin/vmd"

  install -Dm644 ${srcdir}/vmd.desktop ${pkgdir}/usr/share/applications/vmd.desktop
  install -Dm644 ${srcdir}/vmd.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/vmd.png
}
