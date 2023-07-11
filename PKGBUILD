# Maintainer: Valerii Huz <ghotrix at gmail dot com>

pkgname=stockfish-git
pkgver=r5442.gcb9c2594
pkgrel=1
pkgdesc="A free UCI chess engine derived from Glaurung 2.1 (git version)"
arch=('i686' 'x86_64')
url="http://stockfishchess.org/"
license=('GPL3')
optdepends=('polyglot: for xboard support')
makedepends=('git')
provides=('stockfish')
conflicts=('stockfish')
install=stockfish.install
source=("$pkgname::git+https://github.com/official-stockfish/Stockfish.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname/src"

  if [[ "$CARCH" == "armv7h" ]]; then
    _arch=armv7
  elif [[ "$CARCH" == "aarch64" ]]; then
    _arch=armv8
  elif [[ "$CARCH" == "i686" ]]; then
    _arch=x86-32
  elif grep -wq avx512dq /proc/cpuinfo && grep -wq avx512vl /proc/cpuinfo && grep -wq avx512_vnni /proc/cpuinfo; then
    # 256 bit operands are faster on most hardware
    _arch=x86-64-vnni256
  elif grep -wq avx512f /proc/cpuinfo && grep -wq avx512bw /proc/cpuinfo; then
    _arch=x86-64-avx512
  elif grep -wq bmi2 /proc/cpuinfo; then
    if grep -wq GenuineIntel /proc/cpuinfo; then
      _arch=x86-64-bmi2
    elif grep -wq AuthenticAMD /proc/cpuinfo && [[ "$(grep --max-count=1 'cpu family' /proc/cpuinfo | sed -e 's/^.*: //')" -ge 25 ]]; then
      _arch=x86-64-bmi2
    else
      # On AMD, bmi2 is emulated before Zen 3, so that using it is a slowdown
      _arch=x86-64-avx2
    fi
  elif grep -wq avx2 /proc/cpuinfo; then
    _arch=x86-64-avx2
  elif grep -wq sse4_1 /proc/cpuinfo && grep -wq popcnt /proc/cpuinfo; then
    _arch=x86-64-sse41-popcnt
  elif grep -wq ssse3 /proc/cpuinfo; then
    _arch=x86-64-ssse3
  elif grep -wq pni /proc/cpuinfo && grep -wq popcnt /proc/cpuinfo; then
    _arch=x86-64-sse3-popcnt
  else
    _arch=x86-64
  fi

  make ARCH="$_arch" profile-build
}

package() {
  cd "$pkgname/src"
  make PREFIX="$pkgdir/usr" install
}

# vim:set sts=2 sw=2 et:
