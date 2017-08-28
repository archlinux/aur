# Maintainer: Archimede Pitagorico <archimede.pitagorico@mail.com>

pkgname=megasync-headless
pkgver=v3.1.9.0.g4edf31a8
pkgrel=2
pkgdesc="Daemon, fuse and cli client. Sync local directory with MEGA.nz account. Original mega SDK (git)."
arch=('x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
source=('git+https://github.com/meganz/sdk.git#tag=v3.1.9'
        'megasyncd@.service'
        'megasync.conf'
        )
install=$pkgname.install
backup=('usr/lib/systemd/system/megasyncd@.service'
        'etc/conf.d/megasync.conf'
       )
conflicts=('megasync'
	   'megasync-git'
           'megatools'
           )
depends=('c-ares'
         'curl'
         'crypto++'
	 'zlib'
	 'openssl'
         )
makedepends=('git'
             )
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          )
options=('!buildflags'
        )

pkgver() {
  cd sdk
  echo "$(git describe --long --tags | tr - . | tr _ .)"
}

prepare() {
  cd sdk
  ./autogen.sh 

  ./configure \
    --without-freeimage \
    --without-sodium \
    --without-sqlite
}

build() {
    cd sdk
    make examples/megacli
    make examples/megasimplesync
}

package() {
   install -Dm644 megasyncd@.service "${pkgdir}/usr/lib/systemd/system/megasyncd@.service"
   install -Dm600 megasync.conf "${pkgdir}/etc/conf.d/megasync.conf"

   cd sdk
   make DESTDIR=${pkgdir} install
   # we do not need the include files
   rm -rf ${pkgdir}/usr/local/include 
   install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   mkdir -p "${pkgdir}/srv/mega"
   mkdir -p "${pkgdir}/var/mega"
   chmod 0700 "${pkgdir}/var/mega"
}
