# Maintainer:  yjun <jerrysteve1101 at gmail dot com>

_features=(wlink)

pkgname=riscv-openocd-wch
pkgver=1.60
pkgrel=1
pkgdesc='Snapshots of customised riscv-openocd versions as used in MounRiver Studio for WCH / CH32 chips.'
arch=('x86_64' 'aarch64')
url='http://www.mounriver.com/'
license=('GPL')
depends=('libftdi-compat' 'libusb-compat' 'hidapi' 'libudev.so')
source=("${pkgname}-v${pkgver}::git+https://github.com/Seneral/riscv-openocd-wch#branch=riscv-wch"
	"git+https://github.com/msteveb/jimtcl#commit=70b007b63669a709b0e8aef34a22658047815cc2")
sha512sums=('SKIP'
            'SKIP')

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

  make
}

package() {
  cd "$srcdir/${pkgname}-v${pkgver}"

  make DESTDIR="$pkgdir" install

  install -Dm 644 contrib/60-openocd.rules "$pkgdir"/usr/lib/udev/rules.d/60-riscv-openocd-wch.rules
}
