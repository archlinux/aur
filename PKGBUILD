# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Contributor: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=veracrypt-git
_pkgname=VeraCrypt
pkgver=20200311
pkgrel=1
pkgdesc='Disk encryption with strong security based on TrueCrypt'
url='https://www.veracrypt.fr/'
arch=('i686' 'x86_64')
license=('custom:TrueCrypt')
depends=('fuse2>=2.8.0' 'wxgtk3>=3.0' 'libsm' 'device-mapper')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
makedepends=('git' 'yasm')
source=("${pkgname%-git}::git+https://github.com/veracrypt/VeraCrypt.git"
	no-makeself.patch
        veracrypt.desktop)
sha512sums=('SKIP'
            '40c269859bb97fbcceb443e5f457788bac650271ed118ec79d34f56fc340ad6e613114fe905ec5aba8c4d171c51c9a6865f97e9fa1ba01fa98ef18be4e97bbe1'
            'f689ca64bac7042030de7714aed8cc89f2c5f87b407444b1b121491c1d89c147babaaa454ddc2a93b70ae20d4da59f96ad64f01b04bea9017d658c377faeb75d')
provides=('veracrypt')
conflicts=('veracrypt')

pkgver() {
  cd $srcdir/${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

prepare() {
  cd $srcdir/${pkgname%-git}/src

  chmod -R u+w . # WAT award
  patch -Np1 < "${srcdir}/no-makeself.patch"
}

build() {
  cd $srcdir/${pkgname%-git}/src
  make PKG_CONFIG_PATH=/usr/lib/pkgconfig \
    WX_CONFIG=/usr/bin/wx-config-gtk3 \
    TC_EXTRA_LFLAGS+="-ldl ${LDFLAGS}" \
    TC_EXTRA_CXXFLAGS="${CXXFLAGS} ${CPPFLAGS}" \
    TC_EXTRA_CFLAGS="${CFLAGS} ${CPPFLAGS}"
}

package() {
  cd $srcdir/${pkgname%-git}/src

  install -Dm 755 Main/${pkgname%-git} "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm 644 "${srcdir}/veracrypt.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 644 Resources/Icons/VeraCrypt-256x256.xpm "${pkgdir}/usr/share/pixmaps/veracrypt.xpm"
  install -Dm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
}
