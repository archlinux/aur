# Maintainer: Tun Win Naing <twnaing(at)outlook(dot)com>
# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=softethervpn
pkgver=v4.25_9656
pkgrel=2
pkgdesc="Multi-protocol VPN Program from University of Tsukuba"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
source=('http://www.softether-download.com/files/softether/v4.25-9656-rtm-2018.01.15-tree/Source_Code/softether-src-v4.25-9656-rtm.tar.gz'
        'softethervpn-bridge.service'
        'softethervpn-client.service'
        'softethervpn-server.service')
sha1sums=('5ceb11866af212278c8a151bb40a2a048bdd7fea'
          '12a3919aabcdd7531320056a4b43072892232925'
          'ba594c7defb52548369726c56e2cad633019abef'
          '06cd320553daf0dffdf6a81a22d630fbe211fc33')
license=('GPL')
depends=('bash' 'openssl' 'zlib')
url="http://www.softether.org/"

build(){
  cd "${srcdir}/${pkgver//_/-}"

  if [ "${CARCH}" == "i686" ]; then 
    cp src/makefiles/linux_32bit.mak Makefile
  elif [ "${CARCH}" == "x86_64" ]; then 
    cp src/makefiles/linux_64bit.mak Makefile
  elif [ "${CARCH}" == "armv7h" ]; then
    cp src/makefiles/linux_32bit.mak Makefile
  fi

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
