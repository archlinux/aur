# Maintainer: Israël Hallé <isra017@gmail.com>
pkgname=malamute-git
pkgver=20180412
pkgrel=1
pkgdesc="The ZeroMQ Enterprise Messaging Broker"
arch=('x86_64')
depends=('libsodium' 'zeromq' 'czmq')
makedepends=('autoconf' 'automake' 'gcc' 'git' 'libtool' 'make' 'pkg-config')
url="https://github.com/zeromq/malamute"
license=('MPL2')
source=(git+https://github.com/zeromq/malamute)
sha256sums=('SKIP')
epoch=1
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")

pkgver() {
  cd "${pkgname%-git}"

  # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
  local _gitversion=$(git describe --long --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]')

  # Format git tag based version for pkgver
  # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
  echo "${_gitversion}" | sed \
      -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
      -e 's|\([0-9]\+-g\)|r\1|' \
      -e 's|-|.|g'
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/malamute \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/malamute \
    --localstatedir=/var/lib/malamute \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/malamute"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
