#! /bin/bash
# Maintainer: jorge_barroso <jorge.barroso.11@gmail.com>

pkgname=ccs-tools
_basever=1.8.3
_timestamp=20140601
pkgver=${_basever}.${_timestamp}
pkgrel=1
pkgdesc='TOMOYO Linux 1.8.x userspace tools'
arch=('any')
url='http://tomoyo.sourceforge.jp/'
license=('GPL')
depends=('ncurses')
conflicts=('tomoyo-tools')
install=ccs-tools.install
_url_ccs="http://sourceforge.jp/frs/redir.php?f=/tomoyo/49693"
source=("${_url_ccs}/${pkgname}-${_basever}-${_timestamp}.tar.gz"
        "ccs-auditd.service"
        "tomoyo.logrotate")
sha512sums=('3e4d3a0abaa2bebcad7388522bcd40a2979a6579ce271e2d61fc37c4a47f5b010ae730658c975c17c9917a28a5e1fb95361931ab757e9cd7c18d3cd8e55c7f29'
            '4052b12950027a45ae7b061fb8da20fd3abca567f38aa8aefb0f2b9b77decd3c14f7f543ced315e065ca885dee431dd424602434a84f07fbbf3c8d7100b26164'
            '8965822d88ce23eb6a0ed9f2be98cab703d3baa0235d31edb7ae053206f7a30a65ce737bb55570aabe6dd81ca5e2c3516e25078eea44fd8410417cedf00a0667')
            
build() {
  cd "${srcdir}/ccs-tools"
  make
}

package() {
  cd "${srcdir}/ccs-tools"

  make INSTALLDIR="${pkgdir}" install

  # place example programs in /usr/share/ccs/examples
  install -m755 -d "${pkgdir}/usr/share/ccs/examples"
  for i in examples/*.c; do
    install -m644 ${i} "${pkgdir}/usr/share/ccs/${i}"
  done

  # install systemd service
  install -m755 -d "${pkgdir}/lib/systemd/system"
  install -m644 "${srcdir}/ccs-auditd.service" \
	  "${pkgdir}/lib/systemd/system/ccs-auditd.service"

  # install logrotate file
  install -m755 -d "${pkgdir}/etc/logrotate.d"
  install -m644 "${srcdir}/tomoyo.logrotate" "${pkgdir}/etc/logrotate.d/tomoyo"

  # create log folder
  install -m700 -d "${pkgdir}/var/log/tomoyo"
}