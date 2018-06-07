# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=pmount
pkgver=0.9.23
pkgrel=14
pkgdesc="mount removable devices as normal user"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://pmount.alioth.debian.org/"
backup=('etc/pmount.allow')
depends=('sysfsutils>=2.0.0-1' 'util-linux')
makedepends=('intltool')
source=(
  "https://alioth-archive.debian.org/releases/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
  "pmount-bash-completion" # From pmount-debian
  "0001-Fix-a-careless-segfault-in-debug-mode.patch"
  "pmount.exfat.patch"
)
sha256sums=('db38fc290b710e8e9e9d442da2fb627d41e13b3ee80326c15cc2595ba00ea036'
            '2f3983432533d453cb1217b8e6804264e22fa689a0e73a2a4d8d11f0b704bacc'
            'e19eda4987b41f1b76281b980b56239b386539938d70e5b4a40b286bff789b93'
            '6c90da5d992deea70334acaf6781df9d538887bd3d1b62e36a9449e0708006c0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/0001-Fix-a-careless-segfault-in-debug-mode.patch"
  patch -p1 < "${srcdir}/pmount.exfat.patch"
}

build() {
  # commented out in order to avoid *** Error in `/usr/bin/ld': corrupted double-linked list: 0x09e43ce8 ***
  #export CFLAGS="${CFLAGS} -fPIE -pie"
  #export CXXFLAGS="${CXXFLAGS} -fPIE -pie"

  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-hal \
    --with-cryptsetup-prog=/usr/bin/cryptsetup
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/pmount-bash-completion ${pkgdir}/usr/share/bash-completion/completions/pmount
  mkdir -p ${pkgdir}/media
}
