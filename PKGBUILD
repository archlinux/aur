# Maintainer: Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Kristoffer Fossgård <kfs1@online.no>

_pkgname=terminus-font
pkgname=${_pkgname}-td1
pkgver=4.40
pkgrel=1
pkgdesc="A superb, monospace bitmap font (for X11 and console) with td1 patch (centered ascii tilde)"
arch=('any')
url='http://sourceforge.net/projects/terminus-font/'
license=('GPL2' 'custom:OFL')
makedepends=('xorg-bdftopcf' 'fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
optdepends=('xorg-fonts-alias')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install='terminus-font-td1.install'
backup=('etc/fonts/conf.d/75-yes-terminus.conf')
conflicts=('terminus-font')
provides=('terminus-font')
replaces=('xserver-terminus-fonts')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('64f52c24d3f1c1e39f21e6c43077a9be3e21d4384f176f5766c00558ba670711')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

  chmod +x "configure"
}


build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

  patch < alt/td1.diff

  ./configure --prefix=/usr \
              --x11dir=/usr/share/fonts/misc \
              --psfdir=/usr/share/kbd/consolefonts

  make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "75-yes-terminus.conf" \
  	             "${pkgdir}/etc/fonts/conf.avail/75-yes-terminus.conf"

  install -Dm644 "OFL.TXT" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/etc/fonts/conf.d"
  cd "${pkgdir}/etc/fonts/conf.d"
  ln -s ../conf.avail/75-yes-terminus.conf
}

# vim:set ts=2 sw=2 et:
