# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=xperia-flashtool
_realname=flashtool
pkgver=0.9.20.0
pkgrel=1
pkgdesc="A S1 protocol flashing software for Sony Xperia phones"
arch=('i686' 'x86_64')
url="http://www.flashtool.net/"
license=('unknown')
depends=('libselinux')
makedepends=('p7zip')
source=("https://dl.dropboxusercontent.com/u/99802211/External_Sources/Xperia%20Flashtool/flashtool-${pkgver}-linux.tar.7z"
        "${pkgname}.sh")
sha256sums=('6bb153e5c8af31f260e80aad38bb8a04d4d9213423288c018e9b29df8c0d9cde'
            'b6b91cec623461e7b31bc3250045071350237962388ecd6df46bb437bc536803')
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
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -rt "${pkgdir}/usr/lib/${pkgname}" FlashTool/*
  # Install launcher scripts
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
