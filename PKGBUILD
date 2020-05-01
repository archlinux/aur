# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: AkiraYB <brunoyb!yahoo,com,br>

pkgname=minbif
pkgver=1.0.5
pkgrel=8
pkgdesc='An IRC gateway to IM networks that uses libpurple.'
arch=('x86_64')
url='https://symlink.me/projects/minbif/wiki/'
license=('GPL2')
depends=('gnutls' 'libcaca' 'libpurple')
makedepends=('cmake')
optdepends=('xinetd: to run minbif through xinetd')
backup=('etc/minbif/minbif.conf'
        'etc/minbif/minbif.motd')
source=("https://symlink.me/attachments/download/148/${pkgname}-${pkgver}.tar.gz"
        'minbif-gcc-4.7.patch'
        'minbif-imlib.patch'
        'minbif.service'
        'minbif.sysusers.conf'
        'minbif.tmpfiles.conf')
md5sums=('00c5c1abbe2b8a9d900961832c7909a8'
         '2235c45d5bdb01e9ef4b11d2a41d49bb'
         'c94ea3152b7d279da25947e0d1deff14'
         'b34876e339a37dfb1dc6cd0b9d8edf9d'
         'f1a35ef1ab6cb2af5e5b1843b4b6a0d6'
         'a9835ad61bbb62b1b369b8710de05ffd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # build fixes
  patch -p1 -i ../minbif-gcc-4.7.patch
  patch -p1 -i ../minbif-imlib.patch

  make PREFIX=/usr CONF_PREFIX=/etc/minbif ENABLE_MINBIF=ON ENABLE_IMLIB=ON ENABLE_CACA=ON \
       ENABLE_VIDEO=OFF ENABLE_PLUGIN=OFF ENABLE_PAM=ON ENABLE_TLS=ON DEBUG=OFF
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm0644 "${srcdir}/minbif.service" "${pkgdir}/usr/lib/systemd/system/minbif.service"
  install -Dm0644 "${srcdir}/minbif.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/minbif.conf"
  install -Dm0644 "${srcdir}/minbif.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/minbif.conf"
}
