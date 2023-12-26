# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=mautrix-googlechat
pkgver=0.5.1
pkgrel=1
pkgdesc="A Matrix-Google Chat puppeting bridge."
url="https://github.com/mautrix/googlechat"
depends=(python
         python-aiohttp
         python-asyncpg
         python-commonmark
         python-magic
         python-mautrix
         python-olm
         python-protobuf
         python-pycryptodome
         python-ruamel-yaml
         python-unpaddedbase64
         python-yarl)
makedepends=(python-setuptools)
license=(AGPLv3)
arch=(any)
install="${pkgname}.install"
source=("https://github.com/mautrix/googlechat/archive/refs/tags/v${pkgver}.tar.gz"
        "mautrix-googlechat-registration"
        "mautrix-googlechat.service"
        "mautrix-googlechat.sysusers"
        "mautrix-googlechat.tmpfiles"
        "log-path.patch")
backup=("etc/${pkgname}/config.yaml")
sha256sums=('6310fe5c7a97b6337ab846066828c90f034e8f9469260389e1a8157b240603e7'
            'a24774abbdf132a18b89709734a58cf14c674176121cb6e9a5f28d39a73c8bc2'
            '0bbaf8d7cec830e86bf65e7d1f01822f3ab3e057fa805c9f17ee91f99f8a11cf'
            '6653023ceb1bfcfed001f0c722ef82c2584d1a84100d7d38a1641d47b23e544a'
            'a3c993e32ad5710ba2d0d24c9355a3d4fcd58fa01fe396ee9b0a9870f3592f99'
            'dd838686f7dac3130b83e8b8ffbb54c36097470018466102bc0c609385d9b472')

prepare() {
  cd googlechat-${pkgver}
  patch -p1 -i "${srcdir}/log-path.patch"
}

build() {
  cd googlechat-${pkgver}
  python setup.py build
}

package() {
  cd googlechat-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 ${pkgdir}/usr/example-config.yaml ${pkgdir}/etc/mautrix-googlechat/config.yaml
  rm ${pkgdir}/usr/example-config.yaml
  install -Dm755 ${srcdir}/mautrix-googlechat-registration ${pkgdir}/usr/bin/mautrix-googlechat-registration
  install -Dm644 ${srcdir}/mautrix-googlechat.service ${pkgdir}/usr/lib/systemd/system/mautrix-googlechat.service

  install -Dm644 "$srcdir/mautrix-googlechat.sysusers" "$pkgdir/usr/lib/sysusers.d/mautrix-googlechat.conf"
  install -Dm644 "$srcdir/mautrix-googlechat.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-googlechat.conf"
}
