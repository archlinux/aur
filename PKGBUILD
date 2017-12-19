# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Contributor: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=veracrypt-git
pkgver=20170809
pkgrel=2
pkgdesc="Disk encryption with strong security based on TrueCrypt"
arch=('i686' 'x86_64')
depends=('device-mapper' 'fuse2' 'libsm' 'wxgtk3')
makedepends=('binutils' 'make' 'pkg-config' 'yasm')
optdepends=('desktop-file-utils: update desktop database'
            'sudo: mount encrypted volumes as non-root user')
url="https://github.com/veracrypt/VeraCrypt"
license=('custom:TrueCrypt')
source=(${pkgname%-git}::git+https://github.com/veracrypt/VeraCrypt)
sha256sums=('SKIP')
provides=('veracrypt')
conflicts=('veracrypt')
install=veracrypt.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}/src

  msg2 'Disabling sfx archive pkging step...'
  sed -i '/makeself/d' Main/Main.make
}

build() {
  cd ${pkgname%-git}/src

  msg2 'Building...'
  make PKG_CONFIG_PATH=/usr/lib/pkgconfig \
    WX_CONFIG=/usr/bin/wx-config-gtk3 \
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
