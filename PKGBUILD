# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: ekse <ekse.0x[AT]gmail[DOT]com>
# Maintainer: mirandir <mirandir[AT]orange[DOT]fr>

pkgname=jumpnbump
pkgver=1.55
pkgrel=6
pkgdesc="You, as a bunny, have to jump on your opponents to make them explode. It's a true multiplayer game which can't be played alone. It has network support. This program is a Unix port of the old DOS game by brainchilddesign."
arch=('i686' 'x86_64')
url="http://freecode.com/projects/jumpnbump"
license=('GPL')
depends=('sdl_mixer' 'sdl_net')
optdepends=('jumpnbump-levels: more levels for jumpnbump' 'jumpnbump-menu: a launcher for jumpnbump')
source=("http://mirandir.pagesperso-orange.fr/files/${pkgname}-${pkgver}.tar.gz" "jnb.patch" "exit-fullscreen.patch" "format-security.patch" "handle-SDL-quit-event.patch" "NetPacket_buffer_size.patch" "no-springs.patch" "remove-outdated-network-info.patch" "remove-XF86Config-information.patch" "safe-temporary-files.patch")
sha256sums=('95e9ec8c3148a996bd46ffea21393aa0e0868706325d5947bc932b4ba46eafcf'
            '16d4363944d8279e7da77588085f7c103afa743f977c1ea9c742959f6140253d'
            'dd8477ce5cb52de888d5e05290f3773550aabe6a213010981b9678b119efedbc'
            'c883804700bcaf602bdec6882fefe945519e18dfc430f05cffca34ec86c81290'
            'c8ae29440efdadbc219cb2157912342a1c44ba1456407163156df0bba5e63959'
            'c1ba56fbb95495cdc2212e0dd3a67e572894785c2e8efe2629324d7c5a1ea8a2'
            'a06d0cb309e985e3ba78dd8495955b83805e67f43906634d7e782f0580b5343a'
            'dcaadc60cf7210ec5ed87a630a7da2856b6ab483f2ea6608bc07c120bb55140b'
            '17877cafcd9d8440a0f2c9e8da80136a9c4c5eeebb633e7dd748a05cd0d1b6e0'
            'f99113c04b988d2e2048b79bb58bfeba26b3aeea3937936b97b06334d34a5c4c')

build() {
  cd "${srcdir}/${pkgname}-1.50/"
  
  for i in 'exit-fullscreen.patch' 'format-security.patch' 'handle-SDL-quit-event.patch' 'NetPacket_buffer_size.patch' 'no-springs.patch' 'remove-outdated-network-info.patch' 'remove-XF86Config-information.patch' 'safe-temporary-files.patch'
  do
     patch -p1 < ${srcdir}/$i
  done
  
  cd "${srcdir}/${pkgname}-1.50/sdl/"
  patch -lp0 < ../../jnb.patch || return 1
  
  cd "${srcdir}/${pkgname}-1.50"
  
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-1.50"
  make DESTDIR="${pkgdir}" install
}
