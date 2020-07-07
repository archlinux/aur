# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=meterbridge
pkgver=0.9.3
pkgrel=3
pkgdesc="Collection of Audio meters for the JACK audio server"
arch=('x86_64')
url="http://plugin.org.uk/meterbridge/"
license=('GPL2')
groups=('pro-audio')
makedepends=('mesa')
depends=('jack' 'sdl_image' 'libglvnd')
source=("http://plugin.org.uk/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-asneeded.patch"
        "${pkgname}-${pkgver}-cflags.patch"
        "${pkgname}-${pkgver}-gcc41.patch"
        "${pkgname}-${pkgver}-setrgba.patch"
        "${pkgname}-${pkgver}-xinitthreads.patch")
sha512sums=('19c49a584ab71a4fbe4a0d3f05382ce464c3c5f3e37a6dbd42b4920a18577d66464d8e1277d32c34cf9248a945da05fda17a3ecd35e770fdd8af6e9f691ab52a'
            'b3877c523b8c4f666fe5435882e6603abe448e53485939048b3f0ae617cae8634218aba553afdc3f97e03406c1a5a924b9a487930dfe62256f9155a26d39cba7'
            '4a7fe804884feb05fe2af8f0c4cf83b89324ab10e1dad834e3ebcca403223b0c29b8050cbaac3652e64c18f4d1a7b800406431974187839483dbb07f85f9af87'
            'df259114e25efb486ad980b44449b8c33b3afe87a726a5c40641831810d0de30a56c671bbcc5fdbe2fec05b860a3b2ed1439947240c967f938c6771e91d5907e'
            '2bb8e4c26d33a0383f3867459dcc15f5d7500adbbb5cdc230d7fba1d45c9ba4f0ba46731770c5ef25f6adc8121efbef9ecd0ecdac53ed3c3ced840010e3164d4'
            'c25f58c8390d0485a78242af991b6381cfddbe3dac9057bfcc909385b07bbbab6fe3953c0c9290926a3e5547422f7aed883b1d48c4acd25a0327b31189a967c8')

prepare() {
  cd "${pkgname}-${pkgver}"
  # patches taken from gentoo ebuild:
  # https://packages.gentoo.org/packages/media-sound/meterbridge
  patch -Np1 -i "../${pkgname}-${pkgver}-asneeded.patch"
  patch -Np1 -i "../${pkgname}-${pkgver}-cflags.patch"
  patch -Np1 -i "../${pkgname}-${pkgver}-gcc41.patch"
  patch -Np1 -i "../${pkgname}-${pkgver}-setrgba.patch"
  # allow multiple meters:
  # https://bugs.archlinux.org/task/61530
  patch -Np1 -i "../${pkgname}-${pkgver}-xinitthreads.patch"
  autoreconf -vfi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -vDm 644 {AUTHORS,ChangeLog} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
