# Maintainer:  Rubin Simons <me@rubin55.org>

# Do HEAD by default. You can specify a specific commit hash here.
_commit=HEAD
_pkgname=marsdev
pkgname=${_pkgname}-git
pkgver=r161.3318d3f
pkgrel=2
pkgdesc="Cross-platform Sega Mega Drive / Super 32X / Sharp X68000 toolchain"
arch=('x86_64')
url="https://github.com/andwn/${_pkgname}"
makedepends=('boost' 'texinfo' 'wget' 'java-environment>=11')
depends=('java-environment>=11')
provides=('marsdev' 'x68k-tools' 'sik-tools' 'flamewing-tools' 'sgdk')
license=('MIT')
optdepends=('python-pyelftools: for elf2x.py')
source=("git+$url#commit=$_commit")

sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # GCC 15's libcody/libcpp trips over char8_t under C++20; disable it.
  export CFLAGS="$CFLAGS -fno-char8_t"
  export CXXFLAGS="$CXXFLAGS -fno-char8_t"

  # libcpp's macro.cc/expr.cc passes non-literal formats with no args to
  # fprintf-style functions; keep -Wformat but drop -Werror.
  export CFLAGS="${CFLAGS//-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS//-Werror=format-security/}"

  # Statically link host-side libstdc++/libgcc into the cross-compiler and
  # host tools, so the resulting package doesn't depend on host ABI.
  export LDFLAGS="$LDFLAGS -static-libstdc++ -static-libgcc"

  # Set installation location.
  export MARS_INSTALL_DIR="${pkgdir}/opt/marsdev"

  # Specify / select a specific SGDK version. Normally not needed.
  #export SGDK_VER="v2.11"
  
  # Update git sub-modules.
  git submodule update --init

  # Make wget a little bit more log-friendly.
  sed -i 's/^\t@wget /\t@wget -nv /' m68k-gcc-toolchain/Makefile sh-gcc-toolchain/Makefile
}

build() {
  cd "${srcdir}/${_pkgname}"
  make m68k-toolchain-newlib
  make sh-toolchain-newlib
  make x68k-tools
  make sik-tools
  make flamewing-tools
  make sgdk
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install
  cp -Rpd "${srcdir}/${_pkgname}/examples" "${pkgdir}/opt/marsdev/examples";
  sed -i "s|${pkgdir}||g" "${pkgdir}/opt/marsdev/mars.sh"
  mv "${pkgdir}/opt/marsdev/mars.sh" "${pkgdir}/opt/marsdev/marsdev.sh"
}
