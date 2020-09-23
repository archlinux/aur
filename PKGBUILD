# Maintainer: Patrick Wozniak <hello@patwoz.de>
# Maintainer: Davide Depau <davide@depau.eu>

# The boards array is used to generate the pkgnames and package functions.
# It needs to be updated from the `build` script if any new boards show up.
# The build script included in the sources cannot be used since it does stuff as root.

_boards=("orangepir1" "orangepizero" "orangepipc" "orangepipcplus" "orangepiplus2e" "orangepione" "orangepilite" "orangepiplus" "orangepizeroplus2h3" "orangepizeroplus" "orangepipc2" "orangepiprime" "orangepizeroplus2h5" "orangepiwin" "orangepiwinplus" "orangepi3" "orangepilite2" "orangepioneplus" "orangepi4" "orangepirk3399" "orangepizero2")
_pkgbase="wiringop"
_suffix="-git"

pkgname=()
for board in "${_boards[@]}"; do
  pkgname+=("${_pkgbase}-${board}${_suffix}")
done


pkgbase="${_pkgbase}${_suffix}"
pkgver=2.46.r39.39e6dce
pkgrel=1
pkgdesc="This is a modified WiringPi for OrangePi. We call it WiringOP. (git-version)"

arch=('aarch64' 'armv7h')
url="https://github.com/orangepi-xunlong/wiringOP"
license=('LGPL3')

depends=()
optdepends=()
makedepends=(
  'gcc'
  'git'
)

source=(
  "${_pkgbase}::git+${url}.git"
  "0001-Remove-unnecessary-name-after-struct.patch"
)
sha256sums=(
  'SKIP'
  'd56b191cc60300b310242e87513dce930011087bbb6749f991216232be79607f'
)

_subprojects=("wiringPi" "devLib" "gpio")

declare -A _board_vars=(
  ["orangepir1"]="orangepir1-h2"
  ["orangepizero"]="orangepizero-h2"
  ["orangepipc"]="orangepipc-h3"
  ["orangepipcplus"]="orangepipcplus-h3"
  ["orangepiplus2e"]="orangepiplus2e-h3"
  ["orangepione"]="orangepione-h3"
  ["orangepilite"]="orangepilite-h3"
  ["orangepiplus"]="orangepiplus-h3"
  ["orangepizeroplus"]="orangepizeroplus-h5"
  ["orangepizeroplus2h3"]="orangepizeroplus-h5"
  ["orangepizeroplus2h5"]="orangepizeroplus-h5"
  ["orangepipc2"]="orangepipc2-h5"
  ["orangepiprime"]="orangepiprime-h5"
  ["orangepiwin"]="orangepiwin-a64"
  ["orangepiwinplus"]="orangepiwinplus-a64"
  ["orangepi3"]="orangepi3-h6"
  ["orangepilite2"]="orangepilite2-h6"
  ["orangepioneplus"]="orangepioneplus-h6"
  ["orangepi4"]="orangepi4"
  ["orangepirk3399"]="orangepirk3399"
  ["orangepizero2"]="orangepizero2-h616"
)

pkgver() {
  cd "${_pkgbase}"
  ver="$(<VERSION)"
  printf "%s.r%s.%s" "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgbase}"
  patch -p1 < ../0001-Remove-unnecessary-name-after-struct.patch
  sed -i 's|$(DESTDIR)/lib|$(DESTDIR)$(PREFIX)/lib|g' */Makefile
  
  # To avoid building the packages in package we create a copy of the source tree for each
  # individual board
  
  cd "${srcdir}"
  for board in "${_boards[@]}"; do
    [ -d "$board" ] && rm -Rf "$board"
    cp -a "$_pkgbase" "$board"
  done
}

build() {
  cd "${srcdir}"

  for board in "${_boards[@]}"; do
    msg2 "Building for $board"
    export BOARD="${_board_vars[$board]}"
    pushd "$board"

    for subproject in "${_subprojects[@]}"; do
      pushd "$subproject"
      make
      popd
    done

    popd
  done
}

_package() {
  local board="$1"

  export BOARD="${_board_vars[$board]}"
  cd "${srcdir}/${board}"

  # Makefiles are broken, prepare directories first
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib"
  install -dm755 "${pkgdir}/usr/include"

  for subproject in "${_subprojects[@]}"; do
    pushd "$subproject"
    make DESTDIR="${pkgdir}" PREFIX="/usr" LDCONFIG=true install
    popd
  done
}

for board in "${_boards[@]}"; do
  eval "package_${_pkgbase}-${board}${_suffix}() {
    pkgdesc='This is a modified WiringPi for OrangePi. We call it WiringOP (built for $board)'
    provides=('${_pkgbase}-${board}' 'wiringop' 'wiringpi')
    conflicts=('${_pkgbase}-${board}' 'wiringop' 'wiringpi')
    _package '${board}'
  }"
done

