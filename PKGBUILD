# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Contributor: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=veracrypt-git
pkgver=20160821
pkgrel=1
pkgdesc="Disk encryption with strong security based on TrueCrypt"
arch=('i686' 'x86_64')
depends=('device-mapper' 'fuse' 'libsm' 'wxgtk')
makedepends=('binutils' 'make' 'nasm' 'pkg-config')
optdepends=('desktop-file-utils: update desktop database')
url="https://github.com/veracrypt/VeraCrypt"
license=('custom:TrueCrypt')
source=(${pkgname%-git}::git+https://github.com/veracrypt/VeraCrypt
        no-exec-stack.patch)
sha256sums=('SKIP'
            '736b31fa86be40e9dd8352b2fd52ed4845730fdaab7c810c6a72765ce9c2b882')
provides=('veracrypt')
conflicts=('veracrypt')
install=veracrypt.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}/src

  msg2 'Disabling sfx archive pkging step...'
  sed -i '/makeself/d' Main/Main.make

  msg2 'Patching ASM...'
  patch -p0 < "$srcdir/no-exec-stack.patch"
}

build() {
  cd ${pkgname%-git}/src

  msg2 'Building...'
  make PKG_CONFIG_PATH=/usr/lib/pkgconfig \
    WX_CONFIG=/usr/bin/wx-config \
    TC_EXTRA_LFLAGS+="-ldl ${LDFLAGS}" \
    TC_EXTRA_CXXFLAGS="${CXXFLAGS}" \
    TC_EXTRA_CFLAGS="${CFLAGS}"
}

package() {
  cd ${pkgname%-git}/src

  msg2 'Installing license...'
  install -Dm 644 License.txt -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing documentation...'
  install -Dm 644 Readme.txt -t "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg2 'Installing...'
  install -Dm 755 Main/veracrypt -t "$pkgdir/usr/bin"

  msg2 'Installing desktop files...'
  install -Dm 644 Resources/Icons/VeraCrypt-48x48.xpm \
    "$pkgdir/usr/share/pixmaps/veracrypt.xpm"
  install -Dm 644 Setup/Linux/veracrypt.desktop \
    -t "$pkgdir/usr/share/applications"
}
