# Maintainer: Achilleas Pipinellis <axilleas archlinux info>
pkgname=facette-bin
_pkgname=facette
pkgver=0.3.0
pkgrel=1
pkgdesc="Time series data visualization and graphing software"
arch=('i686' 'x86_64')
url="https://facette.io/"
license=('BSD')
depends=('rrdtool<1.5.0')
backup=('etc/facette/facette.json')
install=facette.install

source=(
  "${_pkgname}.tmpfiles.d"
  "${_pkgname}.install"
  "${_pkgname}.service"
)

source_x86_64=("https://github.com/$_pkgname/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz")
source_i686=("https://github.com/$_pkgname/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-linux-386.tar.gz")

sha256sums=(
  '580068d3206220e2d7d716b46bc2ee88fb7046a9c135c4ae7ec25d83458b6534'
  '3c94a461bb104c948dfc2d582fb844300ea6ea41f60ef627aaa73d56f9458ee1'
  '996246e98468a2848ef1c605ab49c569dc057299f847e166422595c5deda5b6f'
)
sha256sums_x86_64=('cf7041bad90cd68dee30edc3508a351d85f9308bb93cd8827fb6c54634bf9bfb')
sha256sums_i686=('15a210ec3976f3a9f43c08c3ae44dcbc5076f8ae2c0726fc5faa0e2b723288f9')

prepare() {

  if [ $CARCH == "x86_64" ]; then
    cd "${srcdir}/${_pkgname}-linux-amd64"
  elif [ $CARCH == "i686" ]; then
    cd "${srcdir}/${_pkgname}-linux-386"
  fi

  # Replace /usr/local with /usr in config file
  sed -i 's#/usr/local#/usr#g' "share/facette/examples/facette.json"
}

package() {

  # Create directory structure
  install -d "${pkgdir}"/usr/bin/
  install -d "${pkgdir}"/usr/share/facette/
  install -d "${pkgdir}"/usr/share/man/man1/
  install -d "${pkgdir}"/usr/share/man/man8/

  if [ $CARCH == "x86_64" ]; then
    cd "${srcdir}/${_pkgname}-linux-amd64"
  elif [ $CARCH == "i686" ]; then
    cd "${srcdir}/${_pkgname}-linux-386"
  fi

  # Install binaries
  install -Dm755 bin/facette "${pkgdir}/usr/bin/facette"
  install -Dm755 bin/facettectl "${pkgdir}/usr/bin/facettectl"

  # Install man pages
  install -Dm644 "share/man/facette.1" "${pkgdir}/usr/share/man/man1/facette.1"
  install -Dm644 "share/man/facettectl.8" "${pkgdir}/usr/share/man/man8/facettectl.8"

  # Install config and example providers
  install -Dm644 "share/facette/examples/facette.json"             "${pkgdir}/etc/facette/facette.json"
  install -Dm644 "share/facette/examples/providers/collectd.json"  "${pkgdir}/etc/facette/providers/collectd.json"
  install -Dm644 "share/facette/examples/providers/graphite.json"  "${pkgdir}/etc/facette/providers/graphite.json"
  install -Dm644 "share/facette/examples/providers/influxdb.json"  "${pkgdir}/etc/facette/providers/influxdb.json"
  install -Dm644 "share/facette/examples/providers/kairosdb.json"  "${pkgdir}/etc/facette/providers/kairosdb.json"

  # Install static and template directories
  cp -r share/facette/{static,template}/ "${pkgdir}/usr/share/facette/"

  # Install systemd service and tmpfiles
  install -Dm644 "${srcdir}/facette.service"     "${pkgdir}/usr/lib/systemd/system/facette.service"
  install -Dm644 "${srcdir}/facette.tmpfiles.d"  "${pkgdir}/usr/lib/tmpfiles.d/facette.conf"
}
