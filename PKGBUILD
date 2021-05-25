# Contributor: Bill Zhechuan Chen <chen.bill.bill(at)gmail.com>
# Contributor: taotieren <admin@taotieren.com>

pkgname=gstcisp
_pkgname=gSTCISP
pkgver=1.0
pkgrel=2
pkgdesc="gSTC-ISP is used to program the STC89C52RC by serial port in Linux"
arch=(x86_64 i686)
url="http://gstcisp.sourceforge.net/"
license=('GPLv3')
source=(http://sourceforge.net/projects/gstcisp/files/gSTC-ISP_v"$pkgver".tar.gz)
depends=("vte-legacy" "gtk2")
optdepends=("hex2bin: Converts Motorola and Intel hex files to binary."
            "hex2bin-bin: Converts Motorola and Intel hex files to binary.")
makedepends=("gcc")
sha256sums=('67344a08a64cc2b0fdcec5cf50d57d2f4755928fa90828be5dc4d1ec06d8388a')

build() {
  cd "${srcdir}/gSTC-ISP/src"
  cp  main.c main.c.bak
  sed -i 's/<vte\//<vte-0.0\/vte\//g' main.c
  sed -i 's/<gtk\//<gtk-2.0\/gtk\//g' main.c

  cd "${srcdir}/gSTC-ISP/"
  ./configure --prefix=/usr
  make
}

package() {
  install -Dm 755 "${srcdir}/gSTC-ISP/src/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/gSTC-ISP/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Version=${pkgver}
Name=${pkgname}
Comment=${pkgname}
Comment[zh_CN]="STC 串口下载工具"
GenericName=${pkgname}
GenericName[zh_CN]="STC 串口下载工具"
Exec=${pkgname}
Icon=${pkgname}.png
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF
}
