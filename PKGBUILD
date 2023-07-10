# Contributor: Patrick Hanckmann <hanckmann at gmail.com>
# Maintainer: Patrick Hanckmann <hanckmann at gmail.com>
pkgname=zyre-git
pkgver=20161108
pkgrel=1
pkgdesc="Zyre - an open-source framework for proximity-based peer-to-peer applications (ZeroMQ)"
arch=(i686 x86_64)
url="https://github.com/zeromq/zyre"
license=('LGPL')
depends=('czmq-git')
makedepends=('autoconf' 'automake' 'gcc' 'git' 'libtool' 'make' 'pkg-config')
source=(git+https://github.com/zeromq/zyre)
sha256sums=('SKIP')
provides=(zyre)
conflicts=(zyre)
epoch=1
provides=("zyre=$pkgver")

pkgver() {
  cd ${pkgname%-git}

  # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]')

  # Format git-based version for pkgver
  # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
  echo "${_gitversion}" | sed \
      -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
      -e 's|\([0-9]\+-g\)|r\1|' \
      -e 's|-|.|g'
}

build() {
  cd ${pkgname%-git}

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/zyre \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/zyre \
    --localstatedir=/var/lib/zyre \
    --disable-zmakecert \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
