# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgbase=tmtv
groups=(tmtv)
pkgname=(
  tmtv
  tmtv-server
)

pkgver=2.0.2
pkgrel=1
pkgdesc='Instant terminal sharing'
arch=(x86_64 aarch64)

url='https://github.com/sa3lej/tmtv'
license=('ISC')
depends=(glibc msgpack-c ncurses libssh libevent)
makedepends=(bison libutf8proc libutempter libbsd)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/v$pkgver.tar.gz"
  implicit-function-declaration.patch
  tmtv-server.env
  tmtv-server.service
  tmtv-server-genkeys.service
  tmtv-server.tmpfiles
)
sha256sums=('e297a3790ac156c3923f2373e7ed0fb50f68e428bbfced5647889772e7e85304'
            'b965e959b76d5b30e444531a556c6d693da7266fa99b0d361582acccbc356ff1'
            '0380456813c8962b0a226f1f44851fd6e8b81f2351c1b37120cfd43e9c3f40fc'
            '9150147914c9bed3b784a5fed53361c75f01bbb06bdd0007fc750b9ccb966736'
            'be45547cda2bf8c1928c0c78c6c1af413fc4da5f241112318330e0c6d55a02bc'
            '965e0f3049b7d92896b1d2638d2e05063f131942d38cb84b0be4c2296f117acb')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/implicit-function-declaration.patch"
}

build() {
  cd "$pkgname-$pkgver"

  sh autogen.sh
  ./configure --enable-sixel --prefix=/usr
  make
}

package_tmtv() {
  depends+=(libbsd)
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_tmtv-server() {
  depends+=(openssl)
  backup=(etc/$pkgbase/$pkgname.env)

  # Systemd
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$pkgname-genkeys.service" "$pkgdir/usr/lib/systemd/system/$pkgname-genkeys.service"
  install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # Config
  # Systemd
  install -dm755 "$pkgdir/etc/$pkgbase"
  install -Dm644 "$pkgname.env" "$pkgdir/etc/$pkgbase/$pkgname.env"

  cd "$pkgbase-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
