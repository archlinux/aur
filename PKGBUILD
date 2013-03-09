# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
pkgver=0.3.1
pkgrel=4
pkgdesc="X.Org Openchrome drivers"
arch=(i686 x86_64)
license=('custom')
url="http://www.openchrome.org"
depends=('libdrm' 'libxvmc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=14' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.14.0' 'X-ABI-VIDEODRV_VERSION<14' 'X-ABI-VIDEODRV_VERSION>=15' 'xf86-video-via' 'xf86-video-unichrome' 'openchrome' 'unichrome-dri')
replaces=('openchrome' 'xf86-video-via')
groups=('xorg-drivers' 'xorg')
options=('!libtool' '!emptydirs' '!makeflags')
source=(http://xorg.freedesktop.org/archive/individual/driver/${pkgname}-${pkgver}.tar.bz2
        fix_system_lock.diff)
sha1sums=('89e56dcfe851345f72c61a95b4fa5ab6ad7e0d83'
          '539ba65df1755af97799f49410e4091b8d222eca')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # https://bugs.freedesktop.org/show_bug.cgi?id=53307
  patch -Np1 -i ${srcdir}/fix_system_lock.diff
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
