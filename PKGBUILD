# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Maintainer: jorge_barroso <jorge.barroso.11@gmail.com>

pkgname=ccs-tools
_timestamp=20210910
pkgver=1.8.9
pkgrel=2
pkgdesc='TOMOYO Linux 1.8.x userspace tools'
arch=('any')
url='http://akari.osdn.jp/'
license=('GPL')
depends=('ncurses')
conflicts=('tomoyo-tools')
install=ccs-tools.install
source=("http://osdn.jp/frs/redir.php?f=/tomoyo/49693/${pkgname}-${pkgver}-${_timestamp}.tar.gz"
        "http://osdn.jp/frs/redir.php?f=/tomoyo/49693/${pkgname}-${pkgver}-${_timestamp}.tar.gz.asc"
        "ccs-auditd.service"
        "tomoyo.logrotate")
sha256sums=('7900126cf2dd8706c42c2c1ef7a37fd8b50f1505abd7d9c3d653dc390fb4d620'
            'SKIP'
            'fa56f61721def18cf035c5f42fe079e98a87914d165043ca4f706655368df69b'
            'd88cdc21bb68a7e2abf0512f10dc56e57db7ca172e179d0fb50998ccf3caf648')
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A')

build() {
  cd "${srcdir}/ccs-tools"
  make
}

package() {
  cd "${srcdir}/ccs-tools"

  make INSTALLDIR="${pkgdir}" USRSBINDIR=/usr/bin SBINDIR=/usr/bin install

  # place example programs in /usr/share/ccs/examples
  install -m755 -d "${pkgdir}/usr/share/ccs/examples"
  for i in examples/*.c; do
    install -m644 ${i} "${pkgdir}/usr/share/ccs/${i}"
  done

  # install systemd service
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/ccs-auditd.service" "${pkgdir}/usr/lib/systemd/system/ccs-auditd.service"

  # install logrotate file
  install -m755 -d "${pkgdir}/etc/logrotate.d"
  install -m644 "${srcdir}/tomoyo.logrotate" "${pkgdir}/etc/logrotate.d/tomoyo"

  # create log folder
  install -m700 -d "${pkgdir}/var/log/tomoyo"
}
