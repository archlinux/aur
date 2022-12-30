# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=lokinet-bin
_pkgname=lokinet
pkgver=0.9.11
pkgrel=1
pkgdesc='Anonymous, decentralized and IP based overlay network for the internet. [LOKI, OXEN]'
#url='https://github.com/oxen-io/loki-network'
url='https://oxen.rocks/oxen-io/loki-network'
arch=('x86_64')
license=('GPL3')
depends=('libuv' 'libsodium' 'curl' 'zeromq' 'unbound' 'sqlite')
conflicts=('lokinet')
install='lokinet.install'
source=("${_pkgname}-$pkgver.tar.xz::$url/${_pkgname}-linux-amd64-v$pkgver.tar.xz"
        'lokinet.conf'
        'lokinet.service'
        'lokinet-vpn.service'
        'lokinet-bootstrap.service'
        'lokinet-default-config.service'
        'lokinet-resume.service'
        'lokinet.sysusers'
        'lokinet.tmpfiles'
        'lokinet.pkla'
        'lokinet.rules'
        "https://raw.githubusercontent.com/oxen-io/lokinet/dev/LICENSE")
sha256sums=('f268cbebb4fac23432ff0e0cda3cc7d4caad469e8dc255d18949d1d5d18fbb5c'
            'SKIP'
            '41f02f6ca693cd596165a7431795f36a2559504361857063278d31f833b3b7b1'
            'cb31c1783998ec11d3d6eb4e5e4e138a8d423ee1aeb0ae2ebe66a52b0f87b642'
            '21c9bc83f8466ab17fa927561d7f24f930f97c996a8aa0fbbbbb2b65cb97b342'
            '6ef779170b72856bbb8df40c34a808acffddd156684bdb66a55e71d50cf95841'
            'bcf4bd7b38d2f054e25cc243353d3c9a56d1948b42ad07ee5c0260de06e8dd6c'
            '137cf7eeebc8737d62f3ccfad2398fb1c442a91cb9db7d650429b218dd949a00'
            '53837c9cfc90b93d55558045108a5d1d7a8b8a75a266af264d7f9101363d043f'
            'e37178d0edaca5b764ed2381e4c670cb4a8c3565c6ab59533f2a783155fe1efc'
            '6ea4d917ce2e46b2c31af31b8c8c28054c5f977bab5b050c44e2029ab3248713'
            '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 lokinet.conf "$pkgdir/usr/lib/systemd/resolved.conf.d/00-lokinet.conf"

  # install binaries on system
  cd ${_pkgname}-linux-amd64-v$pkgver
  install -D -m 755 lokinet "$pkgdir/opt/${_pkgname}/lokinet"
  install -D -m 755 lokinet-vpn "$pkgdir/opt/${_pkgname}/lokinet-vpn"
  #install -D -m 644 bootstrap.signed "$pkgdir/var/lib/${_pkgname}/bootstrap.signed"
  install -D -m 644 bootstrap.signed "$pkgdir/opt/${_pkgname}/bootstrap.signed"

  # install configuration files
  install -D -m 644 "$srcdir/lokinet.conf"                   "$pkgdir/etc/conf.d/lokinet"
  install -D -m 644 "$srcdir/lokinet.service"                "$pkgdir/usr/lib/systemd/system/lokinet.service"
  install -D -m 644 "$srcdir/lokinet-vpn.service"            "$pkgdir/usr/lib/systemd/system/lokinet-vpn.service"
  install -D -m 644 "$srcdir/lokinet-bootstrap.service"      "$pkgdir/usr/lib/systemd/system/lokinet-bootstrap.service"
  install -D -m 644 "$srcdir/lokinet-default-config.service" "$pkgdir/usr/lib/systemd/system/lokinet-default-config.service"
  install -D -m 644 "$srcdir/lokinet-resume.service"         "$pkgdir/usr/lib/systemd/system/lokinet-resume.service"
  install -D -m 644 "$srcdir/lokinet.sysusers"               "$pkgdir/usr/lib/sysusers.d/lokinet.conf"
  install -D -m 644 "$srcdir/lokinet.tmpfiles"               "$pkgdir/usr/lib/tmpfiles.d/lokinet.conf"
  install -D -m 644 "$srcdir/lokinet.pkla"                   "$pkgdir/var/lib/polkit-1/localauthority/10-vendor.d/lokinet.pkla"
  install -D -m 644 "$srcdir/lokinet.rules"                  "$pkgdir/usr/share/polkit-1/rules.d/lokinet.rules"

  # links scripts to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet-vpn "${pkgdir}/usr/bin"
}
