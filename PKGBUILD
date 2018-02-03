# maintainer: so wieso <sowieso@dukun.de>
pkgname=stuntman
pkgver=1.2.13
pkgrel=1
pkgdesc="STUN server and client"
url="http://www.stunprotocol.org/"
license=("Apache")
arch=("i686" "x86_64")
depends=("openssl-1.0")
optdepends=()
makedepends=("boost")
conflicts=("stuntman-git")
source=("https://github.com/jselbie/stunserver/archive/version1.2.13.zip"
        "stuntman.service"
       )
sha256sums=("bb7cd1f3a70344907dae1e945e0fd02801d259d51494ba14de2506641d69f55f"
            "941a3c547e907c4bb07628f343c34477ce61ae5bfe3fce44345b0a5343872b15"
           )

build() {
  cd "${srcdir}/stunserver-version${pkgver}"
  sed -i 's|^#OPENSSL_INC.*|OPENSSL_INCLUDE := -I/usr/include/openssl-1.0|' common.inc
  sed -i -E 's|^CRYPTO_LIBS(.*)|CRYPTO_LIBS\1 -L/usr/lib/openssl-1.0|' common.inc
  make
}

package() {
  cd "${srcdir}/stunserver-version${pkgver}"
  install -D -m0755 -t "$pkgdir/usr/bin/" stun{client,server}
  install -D -m0644 -t "$pkgdir/usr/share/doc/${pkgname}" HISTORY README
  install -D -m0644 <(./stunclient --help | gzip) "$pkgdir/usr/share/man/man1/stunclient.1.gz"
  install -D -m0644 <(./stunserver --help | gzip) "$pkgdir/usr/share/man/man1/stunserver.1.gz"
  install -D -m0644 ../stuntman.service "$pkgdir/usr/lib/systemd/system/stuntman.service"
}
