# Maintainer: Gijs Vermeulen <gijsvrm at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-libshout
_pkgname=libshout
pkgver=2.4.6
pkgrel=6
epoch=1
pkgdesc="Library for accessing a shoutcast/icecast server (32 bit)"
arch=('x86_64')
depends=('lib32-libvorbis' 'lib32-libtheora' 'lib32-speex' 'lib32-openssl' 'libshout')
makedepends=('git')
url="https://www.icecast.org/"
options=('!emptydirs')
license=('LGPL')
source=("git+https://gitlab.xiph.org/xiph/icecast-libshout.git#tag=v${pkgver}"
        "git+https://gitlab.xiph.org/xiph/icecast-common.git"
        "git+https://gitlab.xiph.org/xiph/icecast-m4.git")
sha512sums=('758b779c67f1377ce4b3d1bced1a9de7702752365193931f0d75a0995957c9ea05479bacaef77321a94ff1f0cee1242962e7c0446d5f65a01f060609430e4b6a'
            'SKIP'
            'SKIP')

prepare() {
  cd icecast-${_pkgname}

  git submodule init
  git config submodule.m4.url "${srcdir}/icecast-m4"
  git config submodule.src/common.url "${srcdir}/icecast-common"
  git -c protocol.file.allow=always submodule update

  autoreconf -fiv
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cd icecast-${_pkgname}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib32
  make
}

package() {
  cd icecast-${_pkgname}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/usr/{bin,include,share}
}
