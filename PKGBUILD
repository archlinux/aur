# Maintainer: Tun Win Naing <twnaing(at)outlook(dot)com>
# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=softethervpn
pkgver=v4.20_9608
pkgrel=2
pkgdesc="Multi-protocol VPN Program from University of Tsukuba"
arch=('i686' 'x86_64')
source=('http://www.softether-download.com/files/softether/v4.20-9608-rtm-2016.04.17-tree/Source_Code/softether-src-v4.20-9608-rtm.tar.gz'
        'disable_sslv3.patch'
        'softethervpn-bridge.service'
        'softethervpn-client.service'
        'softethervpn-server.service')
sha1sums=('8fb5693818d8bde2dfff37582a4cdc1d0703e200'
          'ed10141565efe05dbe7ff9aae713dc4bef84e1c5'
          '12a3919aabcdd7531320056a4b43072892232925'
          'ba594c7defb52548369726c56e2cad633019abef'
          '06cd320553daf0dffdf6a81a22d630fbe211fc33')
license=('GPL')
makedepends=()
depends=('bash' 'openssl')
url="http://www.softether.org/"

build(){
  cd "${srcdir}/${pkgver//_/-}"

  if [ "${CARCH}" == "i686" ]; then 
    cp src/makefiles/linux_32bit.mak Makefile
  elif [ "${CARCH}" == "x86_64" ]; then 
    cp src/makefiles/linux_64bit.mak Makefile
  fi

  patch -Np1 --binary -i "${srcdir}/disable_sslv3.patch"
  make
}

package(){
  cd "${srcdir}/${pkgver//_/-}"

  install -Dm444 bin/vpnserver/hamcore.se2 "${pkgdir}"/usr/lib/softethervpn/hamcore.se2
  install -d "${pkgdir}"/usr/bin

  for inst in vpnclient vpnserver vpnbridge vpncmd; do
    install -Dm755 bin/${inst}/${inst} "${pkgdir}"/usr/lib/softethervpn/${inst}/${inst}
    ln -s /usr/lib/softethervpn/hamcore.se2 "${pkgdir}"/usr/lib/softethervpn/${inst}/hamcore.se2
    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/${inst}
    echo /usr/lib/softethervpn/${inst}/${inst} '"$@"' >> "${pkgdir}"/usr/bin/${inst}
    echo 'exit $?' >> "${pkgdir}"/usr/bin/${inst}
    chmod 755 "${pkgdir}"/usr/bin/${inst}
  done

  install -d "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 "${srcdir}"/*.service "${pkgdir}"/usr/lib/systemd/system
}
