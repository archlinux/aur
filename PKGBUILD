# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=amule-daemon
pkgver=r11121
_pkgcomm=d6693fb
pkgrel=4
pkgdesc='An eMule-like client for the eD2k and Kademlia p2p networks. (Only Daemon, CLI tools and Webserver)'
url='http://www.amule.org'
arch=('x86_64' 'armv7h')
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # ld-linux-x86-64.so libc.so libm.so
  'wxwidgets-common' 'libwx_baseu-3.2.so' 'libwx_baseu_net-3.2.so'
  'crypto++' # libcryptopp.so
  'libupnp' 'libixml.so' 'libupnp.so'
  'libpng' 'libpng16.so'
  'boost-libs'
  'binutils' 'libsframe.so'
  'readline' 'libreadline.so'
  'perl'
  'zstd' 'libzstd.so'
  'zlib' 'libz.so'
)
makedepends=('boost')
conflicts=('amule')
optdepends=('amulegui: AmuleGUI')
source=(
  "aMule-SVN-${pkgver}.tar.bz2::http://repo.or.cz/w/amule.git/snapshot/${_pkgcomm}.tar.gz"
  'https://patch-diff.githubusercontent.com/raw/amule-project/amule/pull/298.diff'
  'https://patch-diff.githubusercontent.com/raw/amule-project/amule/pull/387.diff'
  'amuled.service'
  'amuled@.service'
  'amuleweb.service'
  'amule.sysuser'
  'amule.tmpfiles'
)
sha256sums=(
  'f1371c1915fd01214a80d9aae3c414ecafc2fb40bbdeb1553c541133ce041dc2'
  '548ad7468888c49ecbbaf47ac745e38ed24c70967d12d5592f6b3d59fbdf01b1'
  '3c89d0bc01e2acff700fe89a2333a87dc60ad40ad8a4908b5c560e6a18d81519'
  '339d59211bd914dfa43c6c54b68e2715f9648de3220d712c01c004eda19a5b7a'
  'a6bd8616cfc2dd2191a379252d815ace6296cddc993b0ba176cc65bf5a49c2ae'
  'f50c46605d3ae977913f4dcf0c7405e0bdc84322d1fc877ae851706f0e1ae5fd'
  'bc870ebde3c5e009605ca76435790ea260a848160db643bf37e4f9de48b5e56c'
  '6af2edd8a1a9cc270f7d79e332e54d84c01e1c0b88f0ee72a13df879facc8df4'
)
install=amule-daemon.install

prepare() {
  mkdir -p build

  cd "amule-${_pkgcomm}"

  # allow to build with autoconf 2.70 and later
  patch -p1 -i "${srcdir}/298.diff"
  # [PATCH] Fix build with Boost 1.87 that removes deprecated asio methods
  patch -p1 -i "${srcdir}/387.diff"

  ./autogen.sh
}

build() {
  cd build
  CPPFLAGS+=" -DwxHAS_LARGE_FILES=1" \
  ../"amule-${_pkgcomm}/configure" \
    --prefix=/usr \
    --disable-monolithic \
    --enable-alcc \
    --enable-amule-daemon \
    --enable-amulecmd \
    --enable-fileview \
    --enable-optimize \
    --enable-upnp \
    --enable-webserver \
    --enable-mmap \
    --with-boost \
    --with-toolkit=base \
    --with-wx-config=/usr/lib/wx/config/base-unicode-3.2

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm755 build/src/utils/fileview/mulefileview "${pkgdir}/usr/bin/mulefileview"
  install -Dm755 "amule-${_pkgcomm}/src/utils/scripts/mldonkey_importer.pl" "${pkgdir}/usr/share/amule/mldonkey_importer.pl"
  install -Dm755 "amule-${_pkgcomm}/src/utils/scripts/kadnodescreate.pl" "${pkgdir}/usr/share/amule/kadnodescreate.pl"

  install -Dm644 "${srcdir}/amuled.service" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -Dm644 "${srcdir}/amuled@.service" "${pkgdir}/usr/lib/systemd/user/amuled.service"
  install -Dm644 "${srcdir}/amuleweb.service" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
  install -Dm644 "${srcdir}/amule.sysuser" "${pkgdir}/usr/lib/sysusers.d/amule.conf"
  install -Dm644 "${srcdir}/amule.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/amule.conf"

  rm -fr "${pkgdir}/usr/share/"{pixmaps,applications}
}
