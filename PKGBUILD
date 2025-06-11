#
# PKGBUILD for mcuviewer
#
# Maintainer: uffe _.at._ uffe _.dot._ org
#

_pkg_name="MCUViewer"

pkgname="mcuviewer"
pkgver=1.2.1
pkgrel=2
pkgdesc="Real-time embedded variable & trace viewer "


pkg_name_ver="${_pkg_name}-${pkgver}"

url="https://github.com/klonyyy/MCUViewer"
arch=("i686" "x86_64")
license=("GPL-3.0-only")
makedepends=("cmake" "spdlog")
depends=("libusb" "glfw" "gtk3" "glib2")
optdepends=()
source=(${pkgname}.src.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
conflicts=("mcuviewer-git")
provides=("mcuviewer")
sha256sums=('d29889a31ad7dacab21c4f9219c9c68025ca18019949b49dbf37f0823c0dc03e')


prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
}

build()
{
  cd "${srcdir}/${pkg_name_ver}"

  # HACK
  if ! test -f .git/HEAD; then
      mkdir .git
      touch .git/HEAD
      echo 'static constexpr const char* GIT_HASH = "stable";' > src/gitversion.hpp
  fi

  # option -Wno-dev to suppress warning that devels need to fix in Cmakefiles
  cmake -S . -B _build.out -DCMAKE_INSTALL_PREFIX="/usr" -Wno-dev
  cmake --build _build.out
}

package()
{
  cd "${srcdir}/${pkg_name_ver}"

  #DESTDIR="${pkgdir}" cmake --prefix="usr" --install _build.out
  DESTDIR="${pkgdir}" cmake --install _build.out

  mkdir -p "${pkgdir}/usr/local/bin"
  ln -s ../MCUViewer/MCUViewer "${pkgdir}/usr/local/bin/"
}

# vim: ts=2 sw=2 et:
#
# EOF
#
