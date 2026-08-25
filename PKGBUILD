# Maintainer: robertfoster

pkgname=libshout-idjc-git
epoch=1
pkgver=r771.74990fe
pkgrel=1
pkgdesc="Library for accessing a shoutcast/icecast server (with IDJC customizations)"
arch=('x86_64')
url="https://idjc.sourceforge.io/"
license=('LGPL-2.0-or-later')
depends=('libvorbis' 'libtheora' 'speex' 'openssl')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'pkgconf')
provides=("libshout-idjc=${pkgver}")
conflicts=('libshout-idjc')
options=('!emptydirs')
source=('libshout-idjc::git+https://git.code.sf.net/p/idjc/libshoutidjc/code'
        'icecast-m4::git+https://gitlab.xiph.org/xiph/icecast-m4.git'
        'icecast-common::git+https://gitlab.xiph.org/xiph/icecast-common.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd libshout-idjc
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd libshout-idjc
  # Submodules are declared with relative URLs that do not resolve on
  # SourceForge; point them at the upstream Xiph repositories instead.
  git submodule init
  git config submodule.m4.url "${srcdir}/icecast-m4"
  git config submodule.src/common.url "${srcdir}/icecast-common"
  git -c protocol.file.allow=always submodule update
  ./autogen.sh
}

build() {
  cd libshout-idjc
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static
  make
}

package() {
  cd libshout-idjc
  make DESTDIR="${pkgdir}" install
}
