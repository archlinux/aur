# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Dominic Brekau <aur@dominic.brekau.de>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ccrtp-openssl1.1
pkgver=2.1.2
pkgrel=4
pkgdesc="An implementation of RTP, the real-time transport protocol from the IETF"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/ccrtp/"
license=('GPL' 'custom')
depends=('ucommon>=6.2.2' 'libgcrypt')
optdepends=("texinfo: handle and view info files")
source=(
    "https://ftp.gnu.org/gnu/ccrtp/ccrtp-$pkgver.tar.gz"{,.sig}
    "https://www.openssl.org/source/openssl-1.0.2u.tar.gz"
    )
sha256sums=('f035ca0e1b5d37b78e358f07a25b05c5cdaf2c85c4b31cf29f6be17f288a349e'
            'SKIP'
            'cf3098950cb4d853ad95c0841f1f9c6d3dc102dccfcacd521d93925208b76ac8')
validpgpkeys=('5CF995AAD5CC1E4079F76C38B1732A9CB37C87BA')

build_openssl() {
    cd openssl-1.0.2u
    ./config --prefix="$srcdir/openssl-static" no-shared  # 静态编译，安装到临时目录
    make -j$(nproc)
    make install_sw  # 仅安装库文件（不安装文档）
    cd -
}

build() {
  build_openssl
  cd ccrtp-${pkgver}
  export CFLAGS+=" -I$srcdir/openssl-static/include"
  export CXXFLAGS+=" -I$srcdir/openssl-static/include"
  export LDFLAGS+=" -L$srcdir/openssl-static/lib -l:libssl.a -l:libcrypto.a -ldl -lpthread"
  ./configure --prefix=/usr
  make -j$(nproc)
}

package() {
  cd ccrtp-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING.addendum "$pkgdir/usr/share/licenses/ccrtp/LICENSE"
}
