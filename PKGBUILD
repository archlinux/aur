# Maintainer: JSpringYC <JSpringYC@gmail.com>

pkgname=pgyvpn-bin
_pkgname=PgyVisitor
pkgver=2.3.0
pkgrel=1
pkgdesc="Suitable for business personnal long-distance intelligent network access"
arch=('x86_64')
url="https://pgy.oray.com/download/"
license=('custom')
install=pgyvpn-bin.install
source=('LICENSE::https://service.oray.com/question/1820.html'
        "${pkgname%-bin}.service"
        "${_pkgname}_Ubuntu_${pkgver}_X86_64.deb::https://pgy.oray.com/dl/42/download?os=Ubuntu%20Linux(X86_64)")
sha256sums=('9d4dcbc1d1777407a207834caae778a4d4388f14bc70464c3fa08d64ff247308'
            '25995cc8f865139147ced000fea52a8f4dda072addbf9e4a3b18b5c599a8be7f'
            '7fabd22c75ac21f5c23d4682988ddf5832315b97986acb9790370a107349d1ac')

package() {
  tar -xf data.tar.*z -C ${pkgdir}

  cd ${pkgdir}

  # binary
  for binary in usr/sbin/*;
  do
    install -Dm755 $binary usr/bin/`basename $binary`
  done
  rm -rf usr/sbin

  # systemd service
  install -Dm644 ${srcdir}/${pkgname%-bin}.service usr/lib/systemd/system/${pkgname%-bin}.service
  if [ $CARCH == 'x86_64' ] || [ $CARCH == 'i686' ];then
    rm -rf etc/init.d
  else
    rm -rf lib
  fi

  # license
  install -Dm644 ${srcdir}/LICENSE usr/share/licenses/${pkgname}/LICENSE

  # fixed permission
  chown -R root:root usr etc
  chmod 755 usr usr/share etc etc/oray etc/oray/pgyvpn
}
