# Maintainer: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=veracrypt
_pkgname=VeraCrypt
pkgver=1.16
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="Disk encryption with strong security based on TrueCrypt"
arch=('i686' 'x86_64' 'armv6h')
url="http://veracrypt.codeplex.com/"
license=('custom')
depends=('fuse' 'wxgtk>=3.0.0' 'libsm' 'device-mapper')
makedepends=('nasm')
install='veracrypt.install'
source=("${pkgname}_${pkgver}_Source.tar.bz2::http://sourceforge.net/projects/${pkgname}/files/${_pkgname} ${pkgver}/${pkgname}_${pkgver}_Source.tar.bz2/download"
	"no_makeself.patch"
        "veracrypt.desktop"
        "veracrypt.install")
sha1sums=('54467b063609d854dd8f1b780201378e706f452f'
          '0cbe9f7875ab52be125cc575533f76fab60314a5'
          'ebdd450e719fe3cff5e459f027856cbaf03db13a'
          '14dceabf658a7e3505c855c2862aa86e343fcda5')

build() {
  cd ${srcdir}/src

  msg2 "Applying patch..."
  patch -Np1 -i ../no_makeself.patch  # disable sfx archive
  # build
  export WX_CONFIG=/usr/bin/wx-config
  make LFLAGS+="-ldl"
}

package() {
  cd ${srcdir}/src
  install -D -m755 Main/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 Resources/Icons/VeraCrypt-48x48.xpm "${pkgdir}/usr/share/pixmaps/veracrypt.xpm"
  install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
