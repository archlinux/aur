pkgname=mldonkey-ed2kad-daemon-git
pkgver=3.1.4.249.gf8d595df
pkgrel=1
pkgdesc="A multi-network P2P client. Daemon function, only ED2K/KAD. (GIT Version)"
arch=('i686' 'x86_64')
url='http://mldonkey.sourceforge.net'
license=('GPL')
depends=('bzip2'
         'miniupnpc'
         'libnatpmp'
         'file'
         )
makedepends=('camlp4'
             'git'
             )
conflicts=('mldonkey')
provides=('mldonkey')
source=('git+http://repo.or.cz/r/mldonkey.git#branch=next'
        'mldonkey.logrotate'
        'mldonkey.service'
        'mldonkey@.service'
        'mldonkey.tmpfiles'
        'mldonkey.sysuser')
sha1sums=('SKIP'
          '489d9cd16885e85036b51103f56ea1413f293a1d'
          'b7f152e116eb98005df1e7aaf88378ac82b46372'
          '5384a01d909b45ea09112bbeca7b225efc90bed8'
          'c6e4bb5dbca6e3e0a2942e6e2483b0d688f7ecdb'
          'f7ca95475ae9c65260aa45d30ce7af4c6d2ef280')
install=mldonkey-daemon.install

pkgver() {
  cd mldonkey
  echo "$(git describe --long --tags | tr - . | sed 's|release.||g')"
}

build() {
  cd mldonkey
  ./configure \
    --prefix=/usr \
    --enable-minimum \
    --enable-upnp-natpmp \
    --enable-bzip2 \
    --enable-magic \
    --enable-donkeysui \
    --disable-rpath \
    --enable-checks \
    --enable-pthread
  make depend
  make -j1
  make utils
}

package() {
  cd mldonkey
  make DESTDIR="${pkgdir}" install

  install -Dm755 mld_hash "${pkgdir}/usr/bin/ed2k_hash"

  install -Dm644 ../mldonkey.service "${pkgdir}/usr/lib/systemd/system/mldonkey.service"
  install -Dm644 ../mldonkey@.service "${pkgdir}/usr/lib/systemd/system/mldonkey@.service"
  install -Dm644 ../mldonkey.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/mldonkey.conf"
  install -Dm644 ../mldonkey.sysuser "${pkgdir}/usr/lib/sysusers.d/mldonkey.conf"

  install -Dm644 ../mldonkey.logrotate "${pkgdir}/etc/logrotate.d/mldonkey"
}
