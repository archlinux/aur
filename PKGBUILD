# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>
# Contributor: Lucky <archlinux@builds.lucky.li>
## Based on libtorrent [community]

pkgname='libtorrent-git'
_pkgbase="${pkgname%-git}"
pkgver=0.15.2.r33.gc9ee12b6
pkgrel=1
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

  autoreconf --verbose --force --install --symlink
  #export CXXFLAGS+=" ${CPPFLAGS} ${LDFLAGS}"
  
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
