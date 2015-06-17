# Maintainer: ava1ar - <mail(at)ava1ar(dot)me>

pkgname=softethervpn-git
pkgver=v4.17.9562.beta
pkgrel=1
pkgdesc="Multi-protocol VPN Program from University of Tsukuba"
arch=('i686' 'x86_64')
source=('git+https://github.com/SoftEtherVPN/SoftEtherVPN.git' 
		'softethervpn-bridge.service' 
		'softethervpn-client.service' 
		'softethervpn-server.service')
sha1sums=('SKIP'
          'e3d0c38be26123bb533e80f0a595e9867e9cf6ad'
          'efd246e8176683237609b7dae2e12300169b297f'
          'cdfb0c943128286bb318b5c044e5ca53c1dcffff')
license=('GPL')
url="http://www.softether.org/"

pkgver() {
  cd "SoftEtherVPN"
  git log | grep -o -m1 'v[0-9].*' | tr '-' '.'
}

build(){
  cd "${srcdir}"/SoftEtherVPN
  if [ "${CARCH}" == "i686" ]; then 
    cp src/makefiles/linux_32bit.mak Makefile
  elif [ "${CARCH}" == "x86_64" ]; then 
    cp src/makefiles/linux_64bit.mak Makefile
  fi
  make
}

package(){
  cd "${srcdir}"/SoftEtherVPN
  install -Dm644 bin/vpnserver/hamcore.se2 "${pkgdir}"/usr/lib/softethervpn/hamcore.se2
  install -d "${pkgdir}"/usr/bin
  for inst in vpnclient vpnserver vpnbridge vpncmd
  do
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
