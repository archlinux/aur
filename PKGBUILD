# Maintainer: robertfoster
# Contributor: Marcin Kornat <rarvolt@rarvolt.net>
# Contributor: Romain Porte <microjoe@microjoe.org>

pkgname=sw4stm32
pkgver=2.9
pkgrel=1
pkgdesc="SystemWorkbench for STM32"
arch=('x86_64')
url="http://www.openstm32.org/System+Workbench+for+STM32"
license=('CUSTOM')
depends=("java-environment=8")
options=(!emptydirs !strip)
source=( 
  "http://www.ac6-tools.com/downloads/SW4STM32/install_sw4stm32_linux_64bits-v$pkgver.run"
  $pkgname
  $pkgname.png
  $pkgname.desktop
  auto-install.xml)
noextract=(install_sw4stm32_linux_64bits-v$pkgver.run)
optdepends=('arm-none-eabi-gcc: ARM compiler'
  'arm-none-eabi-gdb: ARM GDB'
  'arm-none-eabi-newlib: ARM bare metal files'
  'arm-none-eabi-binutils: ARM binutils'
  'openocd: firmware flashing tool')

package() {
  HOME="$pkgdir/usr/lib/sw4stm32"
  sed "s|@HOME@|$HOME|g" auto-install.xml >unattended.xml

  cd $srcdir
  chmod +x install_sw4stm32_linux_64bits-v$pkgver.run

  java -jar install_sw4stm32_linux_64bits-v$pkgver.run unattended.xml

  # Copy icon and desktop
  install -Dm644 "sw4stm32.png" "${pkgdir}/usr/share/pixmaps/sw4stm32.png"
  install -Dm644 "sw4stm32.desktop" "${pkgdir}/usr/share/applications/sw4stm32.desktop"

  # Copy bash executable to path
  install -Dm755 sw4stm32 "$pkgdir/usr/bin/sw4stm32"

  # Copy udev rule manually
  #for i in $(seq 1 3); do
  #	install -Dm644 "$HOME/.installation/49-stlinkv$i.rules" \
  #		"$pkgdir/etc/udev/rules.d/49-stlinkv$i.rules"
  #done

  # Extracting arm cross-compiler
  CROSSPATH="$HOME/plugins/fr.ac6.mcu.externaltools.arm-none.linux64_1.17.0.201812190825/tools/st-gnu-arm-gcc-7-2018-q2-update_gdb-5_4-2016q3-linux.tar.bz2"
  CROSSDEST=$(dirname $CROSSPATH)
  tar -xf $CROSSPATH -C $(dirname $CROSSPATH)
  rm $CROSSPATH
  chmod 755 -R $CROSSDEST

  # Clean the fakeroot
  rm -rf $HOME/{.installation,stlinkserver/st-stlink*,.desktop_shortcut.sh,uninstall.jar}

  # Change configuration folder
  echo "-Dosgi.configuration.area=@user.home/.sw4stm32" >>$HOME/eclipse.bin.ini
}

sha256sums=('SKIP'
            'b2fe312a41c77ab68bcbc0287998a32c66a72ca3a479d21e1ce563b05be9f781'
            '91b0300e815029c7f3fbb9ba5641804a140623865c21cfa703451697fd877076'
            'df786691de3e76d0ae66a74727ba3022c2bce76e8cfcb651418a1ae9e233c919'
            'f421475096cd4e1191b19c59f183776874379d7b73c8a399996c7a8a130d32f8')
