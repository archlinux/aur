# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: <fedor@yu.wildpark.net>

# systemctl enable lld2d@enp2s4.service
# systemctl start lld2d@enp2s4.service

set -u
pkgname='lld2d'
pkgver='1.0'
pkgrel='2'
pkgdesc='Microsoft LLTD Link Layer Topology Discovery Daemon'
arch=('i686' 'x86_64')
url='http://www.microsoft.com/whdc/DevTools/WDK/WDKpkg.mspx'
license=('unknown')
makedepends=('unzip')
install="${pkgname}.install"
_srcdir='Sample Code/native-linux'
source=('http://download.microsoft.com/download/b/8/e/b8eee444-f8d5-4b8b-aa3d-2f19bf19ac72/Rally-LLTD-PortingKit.exe'
        'lld2d'
)
sha256sums=('84173762f89312013c03a155db47bfbb545c14c08e8f4fc675413753a3268293'
            '690a8c328e17a8010c42d13a0125827cf70b2c868b914ca6e847ca57d0c8858a')

prepare() {
  set -u
  ln -sf 'Rally-LLTD-PortingKit.exe' 'Rally-LLTD-PortingKit.zip'
  unzip -o 'Rally-LLTD-PortingKit.zip'
  cd "${_srcdir}"
  sed -i -e 's:\r::g' -e 's:^#include "packetio.h"$:&\n#include <limits.h>:g' '../src/state.c' # state.c.patch
  sed -i -e 's:/etc/icon.ico:/usr/share/lld2d/icon.ico:g' '../src'/{ctmain,main}.c
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm755 'lld2d' 'lld2test' -t "${pkgdir}/usr/bin/"
  cd '../src'
  install -Dpm644 'lld2d.conf' -t "${pkgdir}/etc/"
  sed -i -e 's:\r::g' \
         -e 's:icon = /etc:icon = /usr/share/lld2d:g' \
         -e 's:icon = .*$:icon = /usr/share/lld2d/tux.ico:g' \
    "${pkgdir}/etc/lld2d.conf"
  #mkdir -p ${pkgdir}/usr/share/lld2d/
  install -Dpm644 *.ico -t "${pkgdir}/usr/share/lld2d/"

  #install -Dpm644 "${srcdir}/lld2d" "${pkgdir}/etc/rc.d/lld2d"
  install -Dpm644 <(cat << EOF
[Unit]
Description=Microsoft LLTD daemon for %i
After=network.target

[Service]
Type=forking
ExecStart=/usr/bin/lld2d %i
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/lld2d@.service"

  install -Dpm644 <(cat << EOF
IF="eth0"
OPTION=""
EOF
  ) "${pkgdir}/etc/conf.d/lld2d"

  set +u
}
set +u
