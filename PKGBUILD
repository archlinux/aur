# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=lokinet-bin
_pkgname=lokinet
pkgver=0.8.4
pkgrel=1
pkgdesc='Anonymous, decentralized and IP based overlay network for the internet. [LOKI, OXEN]'
url='https://github.com/oxen-io/loki-network'
arch=('x86_64')
license=('GPL3')
depends=('libuv' 'libsodium' 'curl' 'zeromq' 'unbound' 'sqlite')
conflicts=('lokinet')
install='lokinet.install'
source=("${_pkgname}-$pkgver.tar.xz::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64-v$pkgver.tar.xz"
        'lokinet.conf'
        'lokinet.service'
        'lokinet-vpn.service'
        'lokinet-bootstrap.service'
        'lokinet-default-config.service'
        'lokinet-resume.service'
        'lokinet.sysusers'
        'lokinet.tmpfiles'
        "https://raw.githubusercontent.com/oxen-io/loki-network/dev/LICENSE.txt")
sha256sums=('44dd1c445f8cfdf12fac165ffe37e6cbcf51c2f037273bd6eca48687e1ab0e2a'
            'SKIP'
            '41f02f6ca693cd596165a7431795f36a2559504361857063278d31f833b3b7b1'
            'cb31c1783998ec11d3d6eb4e5e4e138a8d423ee1aeb0ae2ebe66a52b0f87b642'
            '21c9bc83f8466ab17fa927561d7f24f930f97c996a8aa0fbbbbb2b65cb97b342'
            '6ef779170b72856bbb8df40c34a808acffddd156684bdb66a55e71d50cf95841'
            'bcf4bd7b38d2f054e25cc243353d3c9a56d1948b42ad07ee5c0260de06e8dd6c'
            '137cf7eeebc8737d62f3ccfad2398fb1c442a91cb9db7d650429b218dd949a00'
            '53837c9cfc90b93d55558045108a5d1d7a8b8a75a266af264d7f9101363d043f'
            '253084dd08255e13b1c0b8c9ad3a517dd8a341cba61f87de600fffeb6b79092f')

build() {
  tar -xf ${_pkgname}-$pkgver.tar.xz
}

package() {
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 lokinet.conf "$pkgdir/usr/lib/systemd/resolved.conf.d/00-lokinet.conf"

  # install binaries on system
  cd ${_pkgname}-linux-amd64-v$pkgver
  install -D -m 755 lokinet "$pkgdir/opt/${_pkgname}/lokinet"
  install -D -m 755 lokinet-bootstrap "$pkgdir/opt/${_pkgname}/lokinet-bootstrap"
  install -D -m 755 lokinet-vpn "$pkgdir/opt/${_pkgname}/lokinet-vpn"

  # install configuration files
  install -D -m 644 "$srcdir/lokinet.conf"                   "$pkgdir/etc/conf.d/lokinet"
  install -D -m 644 "$srcdir/lokinet.service"                "$pkgdir/usr/lib/systemd/system/lokinet.service"
  install -D -m 644 "$srcdir/lokinet-vpn.service"            "$pkgdir/usr/lib/systemd/system/lokinet-vpn.service"
  install -D -m 644 "$srcdir/lokinet-bootstrap.service"      "$pkgdir/usr/lib/systemd/system/lokinet-bootstrap.service"
  install -D -m 644 "$srcdir/lokinet-default-config.service" "$pkgdir/usr/lib/systemd/system/lokinet-default-config.service"
  install -D -m 644 "$srcdir/lokinet-resume.service"         "$pkgdir/usr/lib/systemd/system/lokinet-resume.service"
  install -D -m 644 "$srcdir/lokinet.sysusers"               "$pkgdir/usr/lib/sysusers.d/lokinet.conf"
  install -D -m 644 "$srcdir/lokinet.tmpfiles"               "$pkgdir/usr/lib/tmpfiles.d/lokinet.conf"

  # links scripts to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet-bootstrap "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet-vpn "${pkgdir}/usr/bin"
}
