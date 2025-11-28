#
# PKGBUILD for c64_tap_tool-git
#
# Maintainer: Uffe Jakobsen: microtop _.at._ starion _.dot._ dk
#

pkgname=c64_tap_tool-git
_pkgname=c64_tap_tool
pkgver=r32.2d8c8a5
pkgrel=1
pkgdesc="command tool, for handling with c64 tap files"
arch=('x86_64')
url="https://github.com/ThKattanek/c64_tap_tool"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=('git+https://github.com/ThKattanek/c64_tap_tool.git')
sha256sums=('SKIP')

pkgver()
{
  #cd "${srcdir}/${_pkgname}-${_pkgver}"
  cd "${srcdir}/${_pkgname}"
  set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${_pkgname}"
  cmake -S . -B _build.out -DCMAKE_BUILD_TYPE=Release
  cmake --build _build.out
}

package()
{
  cd "${srcdir}/${_pkgname}"
  cmake --install _build.out --prefix "${pkgdir}"
  install -D _build.out/c64_tap_tool "${pkgdir}/usr/bin/c64_tap_tool"
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m 0644 doc/TAP.TXT "${pkgdir}/usr/share/doc/${_pkgname}/TAP.TXT"
}

#
# EOF
#
