# Maintainer: Jumping Bean
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# Contributor: steabert <steabert@member.fsf.org>
# Contributor: Ricardo Honorato Z.

pkgname=vmd
pkgver=2.0.1a1
pkgrel=2
pkgdesc="Visual Molecular Dynamics (official binary build)"
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
# VMD 2.0.1a1 for RHEL 8+ Linux, 64-bit Intel x86 (x86_64), RTX RTRT
source=("local://${pkgname}-${pkgver}.bin.LINUXAMD64.tar.gz"
        "vmd.desktop"
        "vmd.install"
        "vmd.png")
sha256sums=("138f152362967979475a43846acc15ffc016a11fcac82a4641e5562124fe5acd"
            "4c27322fe473b57157f33b9e3a685fa80e981362cc26c361ffb9cc4c5c9ff3ab"
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
  sed -i '2i unsetenv WAYLAND_DISPLAY' "${pkgdir}/usr/bin/vmd"

  install -Dm644 ${srcdir}/vmd.desktop ${pkgdir}/usr/share/applications/vmd.desktop
  install -Dm644 ${srcdir}/vmd.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/vmd.png
}
