pkgname=xperia-flashtool
_realname=flashtool
pkgver=0.9.19.3
pkgrel=1
pkgdesc="A S1 protocol flashing software for Sony Xperia phones"
arch=('i686' 'x86_64')
url="http://www.flashtool.net/"
license=('unknown')
makedepends=('p7zip')
source=("https://dl.dropboxusercontent.com/u/99802211/External_Sources/Xperia%20Flashtool/flashtool-${pkgver}-linux.tar.7z"
        "${pkgname}.sh")
sha256sums=('ffb34cacb5d40ac20f0d16b87e47b8a3881e363df58121363e4c40af63d3f355'
            'de578c79aa5c9a94c93e461d1d16bed3affbb5728fbc42fe5f2c97ff7cb07d9e')
options=('!strip')

build() {
  tar xf "${_realname}-${pkgver}-linux.tar"
}

package() {
  # Remove useless files for the selected architecture
  pushd "FlashTool/x10flasher_lib" > /dev/null
  if [ "$CARCH"=="x86_64" ]; then
    rm -rf "adb.linux.x86" "fastboot.linux.x86" "unyaffs.linux.x86" \
      "linjre32" "linux/lib32" "swtlin/swt32.jar"
  else
    rm -rf "adb.linux.x64" "fastboot.linux.x64" "unyaffs.linux.x64" \
      "linjre64" "linux/lib64" "swtlin/swt64.jar"
  fi
  popd > /dev/null
  # Install all the program files
  install -m 755 -d "${pkgdir}/usr/share/java/${pkgname}"
  cp -rt "${pkgdir}/usr/share/java/${pkgname}" FlashTool/*
  # Install launcher scripts
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
