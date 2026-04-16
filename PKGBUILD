#
# PKGBUILD for unified-floppy-tool
#
# Maintainer: Uffe Jakobsen: microtop _.at._ starion _.dot._ dk
#

pkgname=unified-floppy-tool
_pkgname=UnifiedFloppyTool
pkgver=4.1.2
pkg_name_ver="${_pkgname}-${pkgver}"
pkgrel=1
pkgdesc="Toolkit for preserving and recovering vintage floppy disks - including flux imaging support (Greaseweazle/KryoFlux)"
arch=('x86_64')
url="https://github.com/Axel051171/UnifiedFloppyTool"
license=('GPL-2.0-or-later')
depends=('qt6-base' 'qt6-serialport' 'libglvnd' 'glibc' 'libgcc' 'libstdc++')
makedepends=()
provides=("unified-floppy-tool")
conflicts=("unified-floppy-tool")
source=("https://github.com/Axel051171//${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("b93011ae5b26777af1a8fc9302d71c89545e3652b166295685c21322eea716d0")

#pkgver() {
#  cd "${srcdir}/${pkg_name_ver}"
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare()
{
  cd "${srcdir}/${pkg_name_ver}"

  # apply patches
  patch -p0 < "${startdir}/src_formats_amiga_ext_snprintf_c.diff"

  mkdir -p  _build.out;
  cd _build.out;
  qmake6 ../UnifiedFloppyTool.pro CONFIG+=release
}

build()
{
  cd "${srcdir}/${pkg_name_ver}"
  cd _build.out;
  make
}

check()
{
  cd "${srcdir}/${pkg_name_ver}"
  #cmake -S . -B _test.out
  #cmake --build _test.out
  #cd _test.out
  #ctest
}

package()
{
  cd "${srcdir}/${pkg_name_ver}"
  cd _build.out

  # TODO: report proper PREFIX/DESTDIR usage upstream
  make INSTALL_ROOT="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/bin"
  mv "${pkgdir}/opt/UnifiedFloppyTool/bin/UnifiedFloppyTool" "${pkgdir}/usr/bin/"
  rmdir -p "${pkgdir}/opt/UnifiedFloppyTool/bin/" || true
}

#
# EOF
#
