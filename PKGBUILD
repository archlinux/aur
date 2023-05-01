pkgname=mldonkey-ed2kad-daemon-git
pkgver=3.1.7.2.15.ge136e743
pkgrel=1
pkgdesc="A multi-network P2P client. Daemon function, only ED2K/KAD. (GIT Version)"
arch=('x86_64')
url='http://mldonkey.sourceforge.net'
license=('GPL')
depends=('bzip2'
         'miniupnpc'
         'libnatpmp'
         'file'
         )
makedepends=('camlp4'
             'ocaml-num'
             'git'
             )
conflicts=('mldonkey')
provides=('mldonkey')
source=('git+https://github.com/ygrek/mldonkey.git'
        'https://patch-diff.githubusercontent.com/raw/ygrek/mldonkey/pull/66.diff'
        'https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/mldonkey-fix-build.patch'
        'mldonkey.logrotate'
        'mldonkey.service'
        'mldonkey@.service'
        'mldonkey.tmpfiles'
        'mldonkey.sysuser'
        )
sha256sums=('SKIP'
            '0b340b74babfd5a5d50f98538a4607879658d6346485eba98eb7cf5be65e4ca0'
            '333c3b0ad43b6d6f1786cdd780d4b66fadc638d192875df4422724176201ffdf'
            'fe6227ec1a54278226ca6d6a5b0e1bb23224bf7b90e2ea107f014cc9518b0ed3'
            '3a25e71992aa0ab5caabed81b96ebcf313f1d93ccd7a182b1c57bf3f9571b8e8'
            '2f84c31ff14587926d5dfbf63b61b3239376a822ee77ac05a900a46b43143562'
            '7a7d4d4c9eccadca24cf7970bd26847369c81a16163f8d15923011357e227990'
            'ef14b4c8dcb9e64a1026630463313139171d2682d4ad80965e4a39e5021b93a5'
            )
install=mldonkey-daemon.install

pkgver() {
  cd mldonkey
  echo "$(git describe --long --tags | tr - . | sed 's|release.||g')"
}

prepare() {
  patch -d mldonkey -p1 -i "${srcdir}/66.diff"
  patch -d mldonkey -p1 -i "${srcdir}/mldonkey-fix-build.patch"
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
    --enable-checks \
    --enable-pthread \
    --disable-rpath

  make depend
  make
  make utils
}

package() {
  cd mldonkey
  make DESTDIR="${pkgdir}" install

  install -Dm755 mld_hash "${pkgdir}/usr/bin/ed2k_hash"

  install -Dm644 "${srcdir}/mldonkey.service" "${pkgdir}/usr/lib/systemd/system/mldonkey.service"
  install -Dm644 "${srcdir}/mldonkey@.service" "${pkgdir}/usr/lib/systemd/user/mldonkey.service"
  install -Dm644 "${srcdir}/mldonkey.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mldonkey.conf"
  install -Dm644 "${srcdir}/mldonkey.sysuser" "${pkgdir}/usr/lib/sysusers.d/mldonkey.conf"

  install -Dm644 "${srcdir}/mldonkey.logrotate" "${pkgdir}/etc/logrotate.d/mldonkey"
}
