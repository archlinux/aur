# Maintainer: Jah Way <jahway603 at protonmail dot com>
pkgname=lokinet-bin
_pkgname=lokinet
pkgver=0.9.11
pkgrel=2
pkgdesc='Anonymous, decentralized and IP based overlay network for the internet. [LOKI, OXEN]'
#url='https://github.com/oxen-io/loki-network'
url='https://oxen.rocks/oxen-io/loki-network'
arch=('x86_64')
license=('GPL3')
depends=('libuv' 'libsodium' 'zeromq' 'unbound' 'sqlite' 'jemalloc' 'systemd-libs' 'nlohmann-json' 'spdlog' 'fmt')
conflicts=('lokinet')
install='lokinet.install'
source=("${_pkgname}-$pkgver.tar.xz::$url/${_pkgname}-linux-amd64-v$pkgver.tar.xz"
        'lokinet.conf'
        'https://raw.githubusercontent.com/oxen-io/lokinet/makepkg/contrib/archlinux/lokinet.service'
        'https://raw.githubusercontent.com/oxen-io/lokinet/makepkg/contrib/archlinux/lokinet-vpn%40.service'
        'https://raw.githubusercontent.com/oxen-io/lokinet/makepkg/contrib/archlinux/lokinet-default-config.service'
        'https://raw.githubusercontent.com/oxen-io/lokinet/makepkg/contrib/archlinux/lokinet-resume.service'
        'https://raw.githubusercontent.com/oxen-io/lokinet/makepkg/contrib/archlinux/lokinet.sysusers'
        'https://raw.githubusercontent.com/oxen-io/lokinet/makepkg/contrib/archlinux/lokinet.tmpfiles'
        'https://raw.githubusercontent.com/oxen-io/lokinet/dev/contrib/systemd-resolved/lokinet.pkla'
        'https://raw.githubusercontent.com/oxen-io/lokinet/dev/contrib/systemd-resolved/lokinet.rules'
        "https://raw.githubusercontent.com/oxen-io/lokinet/dev/LICENSE"
        'https://raw.githubusercontent.com/oxen-io/lokinet/dev/contrib/bootstrap/mainnet.signed')
sha256sums=('f268cbebb4fac23432ff0e0cda3cc7d4caad469e8dc255d18949d1d5d18fbb5c'
            'SKIP'
            '452bbb735d81fd92cb1a2cd2afafe99e05c0f2b4c08b05c5ca9c0f2c529c346c'
            'e5a679cc7c47390e8cea285401ebafcd9859f806833ef568463112d875572ccf'
            '894deb2fe8a7c2e21403ef4390570efc959a8f96572220bb8bb8313ffb6ec45e'
            'bcf4bd7b38d2f054e25cc243353d3c9a56d1948b42ad07ee5c0260de06e8dd6c'
            'a657cb735e8d6528e4b11adec8eb84e1fb49f239d9ada98f5990009b80d9a863'
            'e753f96eb15cdd1891631ae1e06a1f8f247306eadf9d9de593e295decdf70ce4'
            '37e11549c21cf6e056cca1af0b9fd24a03fda6033ec0be1858ebbbd4e143a6bc'
            'c9e64d54114d0197a82cde941f25585bc3552f4674f62780965778ccc84478d2'
            '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b'
            'bbac67115e5694ba5d6e1197ccecd976f704296758c538ca5eeafe4cb52522f6')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  #install -Dm755 lokinet.conf "$pkgdir/usr/lib/systemd/resolved.conf.d/00-lokinet.conf"

  # install binaries on system
  cd ${_pkgname}-linux-amd64-v$pkgver
  install -Dm755 lokinet "$pkgdir/opt/${_pkgname}/lokinet"
  install -Dm755 lokinet-vpn "$pkgdir/opt/${_pkgname}/lokinet-vpn"

  # install configuration files directly from Lokinet devs
  install -Dm644 "$srcdir/mainnet.signed"                 "$pkgdir/var/lib/lokinet/bootstrap.signed"
  #install -D -m 644 "$srcdir/lokinet.conf"                   "$pkgdir/etc/conf.d/lokinet"
  install -Dm644 "$srcdir/lokinet.service"                "$pkgdir/usr/lib/systemd/system/lokinet.service"
  install -Dm644 "$srcdir/lokinet-vpn%40.service"         "$pkgdir/usr/lib/systemd/system/lokinet-vpn@.service"
  install -Dm644 "$srcdir/lokinet-default-config.service" "$pkgdir/usr/lib/systemd/system/lokinet-default-config.service"
  install -Dm644 "$srcdir/lokinet-resume.service"         "$pkgdir/usr/lib/systemd/system/lokinet-resume.service"
  install -Dm644 "$srcdir/lokinet.sysusers"               "$pkgdir/usr/lib/sysusers.d/lokinet.conf"
  install -Dm644 "$srcdir/lokinet.tmpfiles"               "$pkgdir/usr/lib/tmpfiles.d/lokinet.conf"
  install -Dm644 "$srcdir/lokinet.pkla"                   "$pkgdir/var/lib/polkit-1/localauthority/10-vendor.d/lokinet.pkla"
  install -D -m 750 -d "$pkgdir/usr/share/polkit-1/rules.d"
  install -Dm644 "$srcdir/lokinet.rules"                  "$pkgdir/usr/share/polkit-1/rules.d/lokinet.rules"
  install -D -m 750 -d "$pkgdir/etc/loki"

  # link binaries to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet-vpn "${pkgdir}/usr/bin"
}
