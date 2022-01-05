# derived from postsrsd-git PKGBUILD maintained by
#   Radek Podgorny <radek@podgorny.cz>
#   Thomas Haider <t.haider@deprecate.de>
# maintainer: fordprefect <fordprefect@dukun.de>
# contributors: bertptrs, Asuranceturix

pkgname=postsrsd
pkgver=1.11
pkgrel=1
pkgdesc="Provides the Sender Rewriting Scheme (SRS) via TCP-based lookup tables for Postfix"
arch=('i686' 'x86_64' 'armv7h')
depends=('glibc')
makedepends=('cmake' 'help2man')
backup=('etc/postsrsd/postsrsd')
url="https://github.com/roehling/postsrsd"
install=postsrsd.install
license=(GPL2)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/roehling/postsrsd/archive/${pkgver}.tar.gz"
        "${pkgname}.install" "sysusers.d-postsrsd.conf" "tmpfiles.d-postsrsd.conf")
md5sums=('5585ff7685ad5f0331ac6dde6304ca4b'
         '4b12fbf341433767850a571128199bad'
         'cee1be46359eb9b6a44d1fac3cbc718b'
         'bb1644c030c69054a9d083a6f1245d50')

check() {
  cd "$srcdir/postsrsd-$pkgver/build"
  make test
}

build() {
  cd "$srcdir/postsrsd-$pkgver"
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DGENERATE_SRS_SECRET=OFF -DCONFIG_DIR=/etc/postsrsd
  make all
}

package() {
  cd "$srcdir/postsrsd-$pkgver/build"
  make DESTDIR="$pkgdir/" install

  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
  sed -e 's/^\(RUN_AS=\)nobody/#\1postsrsd/;s/\(\/etc\/postsrsd\)\(\.secret\)/\1\/postsrsd\2/' \
      -e 's/^\(# is \).*$/\1localhost\.localdomain/'< postsrsd.default > "$pkgdir/etc/postsrsd/postsrsd"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/sysusers.d-postsrsd.conf" "$pkgdir/usr/lib/sysusers.d/postsrsd.conf"
  install -Dm644 "$srcdir/tmpfiles.d-postsrsd.conf" "$pkgdir/usr/lib/tmpfiles.d/postsrsd.conf"

  # fix systemd unit location
  mkdir -p "$pkgdir"/usr/lib/systemd/system/
  mv "$pkgdir"/etc/systemd/system/postsrsd.service "$pkgdir"/usr/lib/systemd/system/

}
