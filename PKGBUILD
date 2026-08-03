# Maintainer: Thomas Pellissier-Tanon <thomas at pellissier-tanon dot fr>

pkgname=valgrind-codspeed
pkgver=3.26.0_0codspeed12
pkgrel=1
_capstone_ver=5.0.9
pkgdesc='Fork of Valgrind to be used in Codspeed'
arch=('x86_64')
license=('GPL-2.0-or-later')
url='https://github.com/CodSpeedHQ/valgrind-codspeed'
depends=('glibc' 'perl' 'debuginfod')
makedepends=('docbook-xsl' 'gdb')
checkdepends=('procps-ng')
provides=('valgrind')
conflicts=('valgrind')
replaces=('valgrind')
options=('!emptydirs' '!strip' '!lto')
source=(
  https://github.com/CodSpeedHQ/valgrind-codspeed/archive/refs/tags/${pkgver//_/-}.tar.gz
  capstone-${_capstone_ver}.tar.gz::https://github.com/capstone-engine/capstone/archive/refs/tags/${_capstone_ver}.tar.gz
)
sha256sums=('486bfcf880e5d6c084a2e55533026791511ab3be015b129e730931ec85ef17b0'
            '0619da31af08152600af95c481527ef6d756c0a8404fca7544a4fdf6dfc2c0f9')

prepare() {
  cd valgrind-codspeed-${pkgver//_/-}
  cp -a "${srcdir}/capstone-${_capstone_ver}/." third_party/capstone/
  # Preserve path mapping in the custom Capstone compile rule.
  sed -i 's/$(CC) $(capstone_cppflags)/$(CC) $(filter -fcanon-prefix-map -ffile-prefix-map=%,$(CFLAGS)) $(capstone_cppflags)/' third_party/Makefile.am
  sed -i '/^AC_GCC_WARNING_SUBST_NO(\[alloc-size-larger-than=/c\AC_SUBST([FLAG_W_NO_ALLOC_SIZE_LARGER_THAN], [])' configure.ac
  # Callgrind's test libraries also need generated headers in separate builds.
  sed -i 's|-I$(top_srcdir)/include|-I$(top_builddir)/include -I$(top_srcdir)/include|g' callgrind/tests/Makefile.am
  # List suppression filenames without embedding the source directory.
  sed -i 's/echo "# " $(DEFAULT_SUPP_FILES)/echo "# " $(notdir $(DEFAULT_SUPP_FILES))/' Makefile.am
  autoreconf -ifv
}

build() {
  # Canonicalization must precede prefix maps to cover relative paths in LTO data.
  CFLAGS="-fcanon-prefix-map ${CFLAGS}"
  CXXFLAGS="-fcanon-prefix-map ${CXXFLAGS}"

  # A separate build directory makes source paths absolute for LTO prefix maps.
  mkdir -p valgrind-build
  cd valgrind-build
  "${srcdir}/valgrind-codspeed-${pkgver//_/-}/configure" \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --enable-lto=yes
  make
  make -C docs man-pages XSL_MAN_STYLES=/usr/share/xml/docbook/xsl-stylesheets/manpages/docbook.xsl
}

check() {
  cd valgrind-build

  VALGRIND_LIB="${PWD}/.in_place" ./coregrind/valgrind --error-exitcode=1 /bin/true

  # Keep path mapping when check targets rebuild production objects.
  local prefix_map="-fcanon-prefix-map -ffile-prefix-map=${srcdir}=/usr/src/debug/${pkgname}"
  make check CPPFLAGS= CFLAGS="${prefix_map}" CXXFLAGS="${prefix_map}" LDFLAGS=
}

package() {
  cd valgrind-build

  make DESTDIR="${pkgdir}" install
}
