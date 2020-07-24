# Maintainer: yjun <jerrysteve1104 at gmail dot com>

pkgname=phddns-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.4
pkgrel=1
pkgdesc="Peanut shell is a dynamic DNS software, any place, any time, any lines, all can through fixed domain access to the remote host services"
arch=("armv7h")
url="https://hsk.oray.com/download/"
license=('custom')
options=('!strip')
source=('LICENSE::https://service.oray.com/question/1820.html')
source_armv7h=("http://download.oray.com/peanuthull/embed/${_pkgname}_${pkgver}_systemd.deb")

sha256sums=('310db9b0e16b352ea99318ba495eb2b6f2c0a8fb40c1d11c78335ad34fd0097f')
sha256sums_armv7h=('d8fb134ecb61058e2e1a243755bfae656eaf1e0deaec6e8070a99d26c253265f')

package() {
  tar -xf data.tar.xz -C ${pkgdir}
  
  # systemd service
  cd ${pkgdir}
  for service in lib/systemd/system/*;
  do
    install -Dm644 $service usr/$service
  done
  rm -rf lib

  sed -i 's|/usr/orayapp/|/usr/bin/|g' usr/lib/systemd/system/*
  sed -i 's|/usr/orayapp|/usr/share/pgyvpn|g' usr/lib/systemd/system/phddns_sl.service 

  # binary
  install -Dm755 usr/sbin/phddns usr/bin/phddns
  install -Dm755 usr/orayapp/oraynewph usr/bin/oraynewph
  install -Dm755 usr/orayapp/oraysl usr/bin/oraysl
  rm -rf usr/orayapp/oray*
  rm -rf usr/sbin

  # scripts
  for scripts in usr/orayapp/*;
  do
    install -Dm755 $scripts usr/share/${_pkgname}/`basename $scripts`
  done
  rm -rf usr/orayapp

  # permisson fixed
  chmod 755 usr
  chown root:root usr

  # license
  install -Dm644 ${srcdir}/LICENSE usr/share/licenses/${pkgname}/LICENSE
}    


# vim: ts=2 sw=2 et:  
