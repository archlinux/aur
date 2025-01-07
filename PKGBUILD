# Maintainer: Sterophonick
pkgname=ham-v2.71-linux-bin
_pkgname='ham-v2.71-linux-bin'
pkgbase=ham-v2.71-linux
pkgver=2.71
pkgrel=5
pkgdesc='Legacy Game Boy Advance development kit based on GCC 3.2.2'
url='http://ngine.de'
arch=(x86_64 i686)
makedepends=(p7zip unrar sed)
depends=(lib32-ncurses5-compat-libs wine)
source=(https://web.archive.org/web/20070708215529/http://www.ngine.de/download/ham-271-linux-full.rar 10-ham-sdk.conf gfx2gba)
noextract=(ham-271-linux-full.rar)
md5sums=('1e2e105a2a71a77036fbd8cafb041dd3'
         '300796835173e04a8f8cab11c1f272ac'
         'a89841ffcfcd14f6d566e9f21ad358cc')
license=('nonfree')
options=(!debug !strip)

prepare() {
  7z x ham-271-linux-full.rar -o$srcdir
}

package() {
  cd $srcdir

  # out of the box next to none of the executables are marked as executable
  chmod +x gcc-arm/bin/*
  chmod +x gcc-arm/arm-thumb-elf/bin/*
  chmod +x gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/cc1
  chmod +x gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/cc1plus
  chmod +x gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/collect2
  chmod +x gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/cpp0
  chmod +x gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/tradcpp0
  chmod +x tools/linux/elf_align
  chmod +x tools/linux/interflip
  chmod +x tools/linux/mb
  chmod +x tools/linux/vba
  chmod +x tools/linux/wav2gba
  chmod +x tools/linux/krawall/converter

  pushd tools/linux
  mv gfx2gba gfx2gba.bak
  popd

  cp ./gfx2gba tools/linux
  chmod +x tools/linux/gfx2gba


  # replicate the "runme_once.sh" to force everything in /opt/ham-gba/
  sed -i 's/HAMDIR = .*/HAMDIR = \/opt\/ham-gba/' system/master.mak
  sed -i 's/HAM_PLATFORM = .*/HAM_PLATFORM = linux/' system/master.mak

  mkdir -p $pkgdir/opt/ham-gba
  cp -r * $pkgdir/opt/ham-gba
  chmod -R 777 $pkgdir/opt/ham-gba
  rm $pkgdir/opt/ham-gba/ham-271-linux-full.rar # remove weird symlink
  rm $pkgdir/opt/ham-gba/10-ham-sdk.conf
  rm $pkgdir/opt/ham-gba/gfx2gba

  mkdir -p $pkgdir/etc/environment.d
  cp 10-ham-sdk.conf $pkgdir/etc/environment.d
}
