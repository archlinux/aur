# Maintainer:  yjun <jerrysteve1101 at gmail dot com>

_features=(wlink)

pkgname=riscv-openocd-wch
pkgver=1.60
pkgrel=2
pkgdesc='Snapshots of customised riscv-openocd versions as used in MounRiver Studio for WCH / CH32 chips.'
arch=('x86_64' 'aarch64')
url='http://www.mounriver.com/'
license=('GPL')
depends=('libftdi-compat' 'libusb-compat' 'hidapi' 'libudev.so')
source=("${pkgname}-v${pkgver}::git+https://github.com/Seneral/riscv-openocd-wch#branch=riscv-wch"
	"git+https://github.com/msteveb/jimtcl#commit=70b007b63669a709b0e8aef34a22658047815cc2"
	"wch-riscv.cfg"
	"wch-arm.cfg")
sha512sums=('SKIP'
            'SKIP'
            'd8301ee062bacab49fa2fd9d07334bf683d2154304aed585d8e90484f5e86619eeb5ca72c7708c48c5b5f02e361252ec8ab86e912baaf648528d8d29aae282b7'
            'a80f4c581840057d7409923b2f30b72cdc3f8bc820879c47d96750f9317709e183481bc483bc787f19dd4873414bdae166b352536eb0dd89061a6f30500a6577')
_pkgdatadir="/usr/share/riscv-openocd-wch"

prepare() {
  cd "$srcdir/${pkgname}-v${pkgver}"

  sed -i 's|GROUP="plugdev", ||g' contrib/60-openocd.rules
  git submodule init
  git config submodule.jimtcl.url "$srcdir/jimtcl"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/${pkgname}-v${pkgver}"

  # rename info file so we don't clash with a normal openocd install
  sed -i 's/openocd.info/riscv-openocd-wch.info/' doc/openocd.texi

  #libtoolize -vif
  #autoreconf -vif
  ./bootstrap
  ./configure \
  	--prefix=/usr \
	--program-prefix=riscv- \
	--program-suffix=-wch \
	--disable-werror \
	--disable-jlink \
	${_features[@]/#/--enable-}

  make pkgdatadir="$_pkgdatadir"
}

package() {
  cd "$srcdir/${pkgname}-v${pkgver}"

  make pkgdatadir="$_pkgdatadir" DESTDIR="$pkgdir" install

  install -Dm 644 contrib/60-openocd.rules "$pkgdir"/usr/lib/udev/rules.d/60-riscv-openocd-wch.rules

  install -Dm 644 ${srcdir}/wch-riscv.cfg -t "$pkgdir"/usr/share/riscv-openocd-wch/scripts/interface/
  install -Dm 644 ${srcdir}/wch-arm.cfg   -t "$pkgdir"/usr/share/riscv-openocd-wch/scripts/interface/


  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/riscv-openocd-wch-arm" << EOF
#!/bin/env bash
exec riscv-openocd-wch -s /usr/share/riscv-openocd-wch/scripts -f interface/wch-arm.cfg "\$@"

EOF

  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/riscv-openocd-wch-riscv" << EOF
#!/bin/env bash
exec riscv-openocd-wch -s /usr/share/riscv-openocd-wch/scripts -f interface/wch-riscv.cfg "\$@"

EOF
}
