# Maintainer:
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Richard Petri <git@rpls.de>
# Contributor: Graham Edgecombe <gpe@grahamedgecombe.com>

_ARCHS=('ecp5' 'ice40' 'gowin' 'himbaechel' 'nexus' 'generic')

_pkgname="nextpnr"
pkgname="$_pkgname-git"
pkgver=0.7.r150.g284fb3e
pkgrel=1
pkgdesc='Portable FPGA place and route tool'
url='https://github.com/YosysHQ/nextpnr'
license=('ISC')
arch=('i686' 'x86_64')

depends=(
  'boost-libs'
  'python'
  'qt5-base'
)
makedepends=(
  'boost'
  'cmake'
  'eigen'
  'git'
  'ninja'
)

provides=("nextpnr=$pkgver")
conflicts=('nextpnr')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

_CONFIG=()
for _arch in ${_ARCHS[@]}; do
  case $_arch in
    ice40)
      makedepends+=(
        'icestorm' # AUR
      )
      _CONFIG+=('-DICESTORM_INSTALL_PREFIX=/usr')
      ;;
    ecp5)
      makedepends+=(
        'prjtrellis'
        'prjtrellis-db>=r269' # AUR
      )
      _CONFIG+=('-DTRELLIS_INSTALL_PREFIX=/usr')
      ;;
    nexus)
      makedepends+=(
        'prjoxide' # AUR
      )
      _CONFIG+=('-DOXIDE_INSTALL_PREFIX=/usr')
      ;;
    gowin)
      makedepends=(
        ${makedepends[@]//prjapicula/}
        'prjapicula' # AUR
      )
      _CONFIG+=('-DGOWIN_BBA_EXECUTABLE=/usr/bin/gowin_bba')
      ;;
    himbaechel)
      makedepends=(
        ${makedepends[@]//prjapicula/}
        'prjapicula' # AUR
      )
      _CONFIG+=('-DHIMBAECHEL_GOWIN_DEVICES=all')
      ;;
    generic)
      # NOOP
      ;;
    *)
      echo "Unhandled architecture: $_arch" >&2
      exit 1
      ;;
  esac
done

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # https://github.com/YosysHQ/nextpnr/issues/1429
  sed -E '/set.HIMBAECHEL_UARCHES/s&^(set\(HIMBAECHEL_UARCHES).*$&\1 "example;gowin")&' -i "$_pkgsrc/himbaechel/family.cmake"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DUSE_OPENMP=ON
    -DUSE_IPO=OFF
    -DBUILD_GUI=ON
    -DBUILD_TESTS=ON
    -Wno-dev

    -DARCH=$(
      IFS=';'
      echo "${_ARCHS[*]}"
    )
    "${_CONFIG[@]}"
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc"/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
