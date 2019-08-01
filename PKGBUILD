# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Kristoffer Fossgård <kfs1@online.no>
# Contributor: clonejo <clonejo@shakik.de>
# Contributor: Daniel Micay <danielmicay@gmail.com>

_pkgname=terminus-font
pkgname=${_pkgname}-td1
pkgver=4.48
pkgrel=1

pkgdesc='Monospace bitmap font (for X11 and console) with td1 patch (centered ascii tilde)'
url='http://sourceforge.net/projects/terminus-font/'
arch=('any')
license=('GPL2' 'custom:OFL')

makedepends=('xorg-bdftopcf' 'fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir' 'python3')
optdepends=('xorg-fonts-alias')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')

conflicts=('terminus-font')
provides=('terminus-font')

source=("https://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        fix-75-yes-terminus.patch)
sha256sums=('34799c8dd5cec7db8016b4a615820dfb43b395575afbb24fc17ee19c869c94af'
            'ddd86485cf6d54e020e36f1c38c56e8b21b57c23a5d76250e15c1d16fed9caa5')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  chmod +x configure
  patch -p1 < "$srcdir"/fix-75-yes-terminus.patch
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

  patch < alt/td1.diff

  ./configure \
    --prefix=/usr \
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
