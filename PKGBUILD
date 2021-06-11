# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-lib-a52pcm
pkgver=1.2.5
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support (with workaround for a52 digital surround PCM)"
arch=('x86_64')
url="https://git.harting.dev/IdleGandalf/alsa-lib/commit/646bc80a63b0220300678a38e0c26a9a13af6fc0"
license=('LGPL2.1')
depends=('glibc' 'alsa-topology-conf' 'alsa-ucm-conf')
provides=('libasound.so' 'libatopology.so' alsa-lib=$pkgver)
conflicts=(alsa-lib=$pkgver)
source=("https://www.alsa-project.org/files/pub/lib/${pkgname%-a52pcm}-$pkgver.tar.bz2"
        "pcm-config-parsing-workaround.patch"
        "${pkgname}-1.2.5-load_all_cards.patch::https://github.com/alsa-project/alsa-lib/commit/ddfc32abf5697de1618b9e7ffdf57a0f97013090.patch"
        "${pkgname}-1.2.5-private_device_prefix1.patch::https://github.com/alsa-project/alsa-lib/commit/0e4ba2ea8c0402f12a645032a14693eb9b1278e6.patch"
        "${pkgname}-1.2.5-private_device_prefix2.patch::https://github.com/alsa-project/alsa-lib/commit/9621d0bff2e60b43e329ffa5059ab19f2914ec14.patch")
sha512sums=('d9b53484737a3684aac7e08b4b18400aac10fec1a78a8bf9101944bea2c50710bc7355e9bb0012541b067e2d5ee7b1b818bf1bdbffbb2b2d7ad0eb15efe49725'
            '2de27b4059c3acae13550e9cd2499f51edff48b73a57876d3521619693f343bee817e3d8e29be209c4286131a51164c80ab9823cb2a3fdf1412a2809c94ad7ce'
            'c5ee4d27001c31772c24595051424869961e1b39b45565256650b63471e2be1236b17cdec5e66e182f1894ef8b09b5f6f959b8f8c6e46a2a0131a8512a9d2516'
            'dfe42b349bfc73682158dfeebe97c3f43d28cdccad307a239b2ed1e30d289cfe9b1577799c34917b07ac98f48b28939aba9c6e8b0db322fc6dd36bdb96d56208'
            '294b79947cbbb00208495ada2baffdaef5e7aa4ea6b49d94733b86bcde59eef7589b87d2d856991405bcb5df8ca48f13c4e89c0a0c163f1abff98aad2c52cd88')

prepare() {
  cd "${pkgname%-a52pcm}-$pkgver"
  # fix loading of multiple cards
  # https://github.com/alsa-project/alsa-lib/issues/143
  patch -Np1 -i ../"${pkgname}-1.2.5-load_all_cards.patch"
  # probably fix issues with pipewire:
  # https://github.com/alsa-project/alsa-lib/issues/142
  patch -Np1 -i ../"${pkgname}-1.2.5-private_device_prefix1.patch"
  patch -Np1 -i ../"${pkgname}-1.2.5-private_device_prefix2.patch"
  # Work around broken config parsing in a52 pcm plugin
  patch -Np1 < ../pcm-config-parsing-workaround.patch
  autoreconf -vfi
}

build() {
  cd "${pkgname%-a52pcm}-$pkgver"
  ./configure --prefix=/usr \
              --without-debug
  make
}

check() {
  cd "${pkgname%-a52pcm}-$pkgver"
  export LD_LIBRARY_PATH="${PWD}/src/.libs/:${LD_LIBRARY_PATH}"
  make -k check
}

package() {
  cd "${pkgname%-a52pcm}-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C doc
  install -vDm 644 {MEMORY-LEAK,TODO,NOTES,ChangeLog,doc/asoundrc.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
