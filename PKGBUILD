# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# This package is a clusterfuck. It will take a damn long time to get this
# sorted out. There is litterally no build instructions.

# Consider this a work in progress. Any help is appreciated.

# TODO: TableGeneration does not compile.

_pkgname=kraken
pkgname=kraken-gsm-git
pkgver=r32.368a837
pkgrel=2
pkgdesc="This open source software allows the 'cracking' of A5/1 keys used to secure GSM 2G calls and SMS."
arch=('i686' 'x86_64')
url="https://opensource.srlabs.de/projects/a51-decrypt"
license=('unknown')
depends=('python')
makedepends=('git')
optdepends=( 'osmocombb-git: for capturing GSM radio packets'
              'airprobe-git: for capturing GSM radio packets'
)
provides=('kraken-gsm')
conflicts=('kraken-gsm')
replaces=('kraken-gsm')
install=${_pkgname}.install
source=("${pkgname}::git://git.srlabs.de/kraken")
sha256sums=( SKIP )

##CONFIG OPTIONS##
_use_ati=no
## END CONFIG ##

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  # Whoops, someone forgot a line
  sed -i '1s/^/#include <unistd.h>\n/' Kraken/ServerCore.cpp
  sed -i '1s/^/#include <unistd.h>\n/' Kraken/Kraken.cpp
  sed -i '1s/^/#include <unistd.h>\n/' a5_cpu/a5cpu_test.cpp
}

ati_card_compile() {
  ## this only works if you have an ati video card
  cd a5_ati
  make
  mv A5Ati.so ../Kraken
  cd ..
}
build() {
  cd "$pkgname"
  [ $_use_ati == "yes" ] && ati_card_compile
  cd Kraken
  ./build.sh
  cd ..
  #this is broken
  #cd TableGeneration
  #make
  #cd ..
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 "Kraken/kraken" "${pkgdir}/opt/kraken/kraken"
  install -Dm 755 "a5_cpu/a5cpu_test" "${pkgdir}/opt/kraken/a5cpu_test"
  install -Dm 755 "Kraken/A5Cpu.so" "${pkgdir}/opt/kraken/A5Cpu.so"
  [ $_use_ati == "yes" ] && \
      install -Dm 755 "Kraken/A5Ati.so" "${pkgdir}/opt/kraken/A5Ati.so"
  true
}

