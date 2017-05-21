# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=xperia-flashtool
_realname=flashtool
pkgver=0.9.23.1
pkgrel=2
pkgdesc="A S1 protocol flashing software for Sony Xperia phones"
arch=('i686' 'x86_64')
url="http://www.flashtool.net/"
license=('unknown')
depends=('libselinux' 'libsystemd' 'glib2')
makedepends=('p7zip')
source=("http://url.muflone.com/${pkgname}-${pkgver}-linux.tar.7z"
        "${pkgname}.sh")
sha256sums=('254ed7e992b5a3617c95b00d539251f5eb1476d5bd5e16cd03eaf092249b042c'
            'b6b91cec623461e7b31bc3250045071350237962388ecd6df46bb437bc536803')
options=('!strip')

build() {
  tar xf "${_realname}-${pkgver}-linux.tar"
}

package() {
  # Remove useless files for the selected architecture
  pushd "FlashTool/x10flasher_lib" > /dev/null
  if [ "$CARCH" == "x86_64" ]; then
    rm -r "adb.linux.32" "fastboot.linux.32" "unyaffs.linux.32" \
      "linjre32" "linux/lib32" "swtlin/x86"
  else
    rm -r "adb.linux.64" "fastboot.linux.64" "unyaffs.linux.64" \
      "linjre64" "linux/lib64" "swtlin/x86_64"
  fi
  popd > /dev/null
  # Install all the program files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -rt "${pkgdir}/usr/lib/${pkgname}" FlashTool/*
  # Install launcher scripts
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
