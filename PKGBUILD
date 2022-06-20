# Maintainer: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>
# Contributor: Lucky <archlinux@builds.lucky.li>
## Based on libtorrent [community]

pkgname='libtorrent-git'
_pkgbase="${pkgname%-git}"
pkgver=0.13.8.r20.g53596afc
pkgrel=2
pkgdesc='BitTorrent library with a focus on high performance and good code'
arch=('x86_64' 'i686')
url='https://github.com/rakshasa/libtorrent'
license=('GPL2')
depends=(
  'gcc-libs'
  'openssl'
  'zlib'
)
makedepends=(
  'cppunit'
  'git'
)
provides=("${_pkgbase}=${pkgver%.r*}")
conflicts=("${_pkgbase}")
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  # Generate git tag based version. Count only proper v#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags --match 'v[0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

  # Format git-based version for pkgver
  echo "${_gitversion}" | sed \
    -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
    -e 's|\([0-9]\+-g\)|r\1|' \
    -e 's|-|.|g'
}

prepare() {
  cd "${pkgname}"

  echo "Editing 'test/configure.ac': removing hardcoded 'cppunit' path (main configure script finds it via pkg-config)"
  sed '/AM_PATH_CPPUNIT/d' -i 'test/configure.ac'

  echo "Editing 'configure.ac': don't force-link 'cppunit' dependency to runtime libraries, needed only in 'make test'"
  sed -E 's/[    ]*\$CPPUNIT_CFLAGS[    ]*/ /g
          s/[    ]*\$CPPUNIT_LIBS[    ]*/ /g' \
          -i 'configure.ac'
  echo

  echo "Regenerating autoconf scripts and make files..."
  autoreconf --verbose --force --install --symlink
  echo

  printf 'Checking if debug is enabled in makepkg config... '
  if ! check_option "debug" "y"; then
    echo 'no'
  else
    echo 'yes'

    echo '-- Enabling debug options for build'
    export _extra_configure_options=('--enable-debug' '--enable-extra-debug')
  fi

  echo "Configuring the env vars for the build"
  echo '-- Adding CPPFLAGS to CXXFLAGS, otherwise the build scripts ignore it'
  echo '-- Adding LDFLAGS to CXXFLAGS, otherwise the build scripts ignore it'
  export CXXFLAGS+=" ${CPPFLAGS} ${LDFLAGS}"
  echo

  echo "Running 'configure' script..."
  ./configure "${_extra_configure_options[@]}" \
    --prefix='/usr' \
    --disable-silent-rules
}

build() {
  cd "${pkgname}"
  make
}

check() {
  cd "${pkgname}"
  make check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
