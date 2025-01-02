# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname='pepecoin'
pkgver='1.1.0'
pkgrel=3
pkgdesc="The world's first fully decentralized and secure blockchain for Pepe."
arch=('x86_64')
url='https://github.com/pepecoinppc/pepecoin'
license=('MIT')
makedepends=(
  'boost'
  'git'
  'qt5-tools'
)
depends=(
  'abseil-cpp'
  'boost-libs'
  'db5.3'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libevent'
  'libminiupnpc.so'
  'libprotobuf.so'
  'libzmq.so'
  'openssl'
  'qrencode'
  'qt5-base'
)
source=("${pkgname}-${pkgver}::git+https://github.com/pepecoinppc/pepecoin.git#tag=v${pkgver}"
        'use-c++17.patch'
        'pepecoin.sysusers'
        'pepecoin.tmpfiles'
        'pepecoind.service'
        'pepecoin-qt.desktop'
        'pepecoin-qt.appdata.xml')
b2sums=('7c0ce6b1e00bbe422fd4e2726b1bb079d570c7304f778a84e828eece9755c67a6bfe2fc05847352fd175ed4d81a2fcee1b1ccf148a35ca73e8c146d246132e92'
        '9c1b5f7dc6bbbc3cc3cf983bbed61dd6aeb56f6b675688497b92e6c7aa6eb686b304c75a648111f6382a10663a2b13b8360e242fe83d8792a297ef40b272eea3'
        '920c4489e66cb84acecc6f76b13b866cf392bd27d634106257dc99195da8d9a301d65ddddfff964693fe31a7859b44762e9c0b2f5a0d026b39ae44df3b73c329'
        'a5354d82badf5abb7805375f579d9d85c9ae9a30a850b5cf73836c69362a34c5d044a5212e92951b20ae61df36af556f5ad8c7839a7923ea70d4247d2b5b8c1b'
        '37341a943e0ee3553908331a29f4ea7ff5cf65f5d66b6c3c75fc53f32cdddafdcae34ca727f9343f3035dbc0e43509883f078b44ff8255f7532297e7a469f10b'
        '18d4884a73603ed23222164c11a9ee5f022c142dc76db282045561168f7ae1f190fd1b5f277fc209e0014b54a97d2056a92bf14408d6ed3816bb0525319ad759'
        '17e0912047a06902f750b65cd2653ec013969e9674daca118eae2b205db194c9dafe218d80d673de250a269394b7e493977923fd60f085f48b9556c299923870')
backup=('etc/pepecoin/pepecoin.conf')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../use-c++17.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  ./autogen.sh

  #remove _FORTIFY_SOURCE from CXXFLAGS to prevent a duplicate definition warning as configure adds _FORTIFY_SOURCE itself
  CXXFLAGS=${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}
  ./configure --prefix=/usr --with-gui=qt5

  make -j$(nproc)
}

check() {
  cd "${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 ../pepecoind.service "${pkgdir}/usr/lib/systemd/system/pepecoind.service"
  install -Dm644 ../pepecoin.sysusers "${pkgdir}/usr/lib/sysusers.d/pepecoin.conf"
  install -Dm644 ../pepecoin.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/pepecoin.conf"
  install -Dm644 contrib/debian/examples/pepecoin.conf "${pkgdir}/etc/pepecoin/pepecoin.conf"

  install -Dm644 ../pepecoin-qt.desktop "${pkgdir}/usr/share/applications/pepecoin-qt.desktop"
  install -Dm644 ../pepecoin-qt.appdata.xml "${pkgdir}/usr/share/metainfo/pepecoin-qt.appdata.xml"

  install -Dm644 share/pixmaps/pepecoin256.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pepecoin-qt.svg"

  for i in 16 32 64 128 256; do
    install -Dm644 share/pixmaps/pepecoin${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/pepecoin-qt.png"
  done

  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
