# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=libao-jack
pkgver=1.2.2
pkgrel=1
pkgdesc="Cross-platform audio output library and plugins - patched with JACK support"
url="http://xiph.org/ao/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('alsa-lib')
makedepends=('libpulse' 'jack' 'git')
backup=('etc/libao.conf')
#source=("http://downloads.xiph.org/releases/ao/libao-${pkgver}.tar.gz"
source=("git+https://git.xiph.org/libao.git#commit=3f4b02f046550aca54d7f11a5d9c56ac421f0b66"
        "https://trac.xiph.org/raw-attachment/ticket/2083/libao-jack-plugin.tgz"
        "https://trac.xiph.org/raw-attachment/ticket/2083/0001-jack-plugin.patch"
        'libao.conf'
        'no-circular-dependency.patch')
noextract=('libao-jack-plugin.tgz')
sha256sums=('SKIP'
            '05dad2e84127f730996c11facdb8db3cce00463f6ecca897a5dce606b4ad0758'
            '0bc8d4375ca9255d4a97ed7357e053bffe1260c5df4583a290018a86f341a934'
            'c6cde8eaa3516ab6a2e6f154a70961b3f448f4b739491a82e0c512f2740525af'
            'df5a6ba10efaa3c476c26a675c7a4f9492f6e341e126eed55a6bd28d5d13c0f8')

conflicts=('libao' 'libao-pulse')
provides=("libao=${pkgver}-${pkgrel}" "libao-pulse=${pkgver}-${pkgrel}")

prepare() {
#  cd "${srcdir}/libao-${pkgver}"
  cd "${srcdir}/libao"

  bsdtar xf "${srcdir}/libao-jack-plugin.tgz"
  patch -p1 < "${srcdir}/0001-jack-plugin.patch"
  # This change is analogous to 651e2fa2a35e86b31816729063e01e18d4bdbbcc
  patch -Np1 < "${srcdir}/no-circular-dependency.patch"
  ./autogen.sh
}

build() {
#  cd "${srcdir}/libao-${pkgver}"
  cd "${srcdir}/libao"

  ./configure \
    --prefix=/usr \
    --enable-alsa-mmap \

  make
}

package() {
#  cd "${srcdir}/libao-${pkgver}"
  cd "${srcdir}/libao"

  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/libao.conf" "${pkgdir}/etc/libao.conf"
}
