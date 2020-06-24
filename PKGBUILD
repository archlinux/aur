# Maintainer: David Runge <dvzrv@archlinux.org>
pkgname=non-sequencer
pkgver=1.9.5
pkgrel=3
pkgdesc="A powerful, lightweight, real-time, pattern-based MIDI sequencer"
arch=('x86_64')
url="https://non.tuxfamily.org/"
license=('GPL3')
groups=('non-daw' 'pro-audio')
depends=('cairo' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libjack.so'
'liblo.so' 'libntk.so' 'libntk_images.so' 'libsigc++' 'libx11')
makedepends=('waf')
source=("$pkgname-$pkgver.tar.gz::https://git.tuxfamily.org/non/non.git/snapshot/${pkgname}-v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/original-male/non/d958df0486c7397c243f5ac36bf4acbc461a1e50/tools.waf/ntk_fluid.py")
sha512sums=('1c7537586671293c6f4463f00a6848d3ae5528aabbea82084b9b82e043790bebcea5ec877cacd88c31a953807a19db4b4027ad763a1f869e0725e677a89d2162'
            '9f45474fa51a8c3eed672d633a77d968ddee6b841589764378f08386f711ae1a6801c795c19d8987f1af9a36b5a6bcdaab2230db5359004ad73e791dbac50bc4')

prepare() {
  mv -v "${pkgname}-v${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  mkdir -pv tools
  # ntk_fluid.py is not published in 1.2.0:
  # https://github.com/original-male/non/issues/253
  ln -sv "${srcdir}/ntk_fluid.py" tools/
  touch __init__.py
  sed -e "s/load('ntk_fluid'/load('ntk_fluid', tooldir='tools'/g" \
      -i wscript
}

build() {
  cd "${pkgname}-${pkgver}"
  waf configure --prefix=/usr --project=sequencer
  waf
}

package() {
  cd "$pkgname-$pkgver"
  waf --destdir="${pkgdir}" install
}
