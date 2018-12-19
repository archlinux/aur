# Maintainer: Kezi <keziolio123@gmail.com>

pkgname=picogw-hal-git
pkgver=0.2.2
pkgrel=1
pkgdesc="Host driver/HAL to build a LoRa Picocell Gateway which communicates through USB with a concentrator board based on Semtech SX1308 multi-channel modem and SX1257/SX1255 RF transceivers."
arch=('any')
url="https://github.com/Lora-net/picoGW_hal"
license=('unknown')
groups=()
depends=()
makedepends=('git' 'make' 'gcc')
provides=('')
conflicts=('')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()


_gitroot="https://github.com/Lora-net/picoGW_hal.git"
_gitname="picogw_hal"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone --recursive "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
  # I don't want to investigate why the gemeral makefile does not work, so I build every program
  cd "$srcdir/$_gitname-build/libloragw"
  make V=1
  
  cd "$srcdir/$_gitname-build/util_chip_id"
  make V=1

  cd "$srcdir/$_gitname-build/util_com_stress"
  make V=1

  cd "$srcdir/$_gitname-build/util_pkt_logger"
  make V=1
  
  cd "$srcdir/$_gitname-build/util_tx_continuous"
  make V=1
  
  cd "$srcdir/$_gitname-build/util_tx_test"
  make V=1
}

package() {
  cd "$srcdir/$_gitname-build/"
  mkdir -p $pkgdir/usr/bin

  cp util_chip_id/util_chip_id  $pkgdir/usr/bin/
  cp util_com_stress/util_com_stress $pkgdir/usr/bin/
  cp util_pkt_logger/util_pkt_logger  $pkgdir/usr/bin/
  cp util_tx_continuous/util_tx_continuous  $pkgdir/usr/bin/
  cp util_tx_test/util_tx_test  $pkgdir/usr/bin/

}
