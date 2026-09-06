# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgbase=tmtv
groups=(tmtv)
pkgname=(
  tmtv
  tmtv-server
)

pkgver=2.0.4
pkgrel=1
pkgdesc='Instant terminal sharing'
arch=(x86_64 aarch64)

url='https://github.com/sa3lej/tmtv'
license=('ISC')
depends=(glibc msgpack-c ncurses libssh libevent)
makedepends=(bison libutf8proc libutempter libbsd)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/v$pkgver.tar.gz"
  tmtv-server.env
  tmtv-server.service
  tmtv-server-genkeys.service
  tmtv-server.tmpfiles
)
sha256sums=('d5c1616357cab5338c0d877619811cb5637b2b734dbc8da44662197157f3f1f8'
            '0380456813c8962b0a226f1f44851fd6e8b81f2351c1b37120cfd43e9c3f40fc'
            '9150147914c9bed3b784a5fed53361c75f01bbb06bdd0007fc750b9ccb966736'
            'be45547cda2bf8c1928c0c78c6c1af413fc4da5f241112318330e0c6d55a02bc'
            '965e0f3049b7d92896b1d2638d2e05063f131942d38cb84b0be4c2296f117acb')

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
