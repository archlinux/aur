#Maintainer: Unknown
#Contributor: kurych
#Contributor: redfish

pkgname=i2pd-git
_pkgname=i2pd
pkgver=2.9.0.r42.ge163730
pkgrel=1
pkgdesc="Simplified C++ implementation of I2P client"
arch=('i686' 'x86_64')
url="https://github.com/PurpleI2P/i2pd"
license=('BSD')
depends=('boost-libs' 'miniupnpc' 'openssl' 'zlib')
makedepends=('git' 'boost')
source=('i2pd::git+https://github.com/PurpleI2P/i2pd.git#branch=master'
        i2pd.service
        i2pd.tmpfiles.conf)
install=i2pd.install
backup=(etc/i2pd/i2pd.conf etc/i2pd/tunnels.conf)
conflicts=('i2pd')

build() {
  cd $srcdir/i2pd
  USE_UPNP=1 make
}

package(){
        _bin_dest=usr/bin
        _conf_dest=etc/${_pkgname}
        _home_dest=var/lib/${_pkgname}
        _share_dest=usr/share

  install -Dm755 $srcdir/i2pd/i2pd "$pkgdir/${_bin_dest}/i2pd"

  install -Dm0644 $srcdir/i2pd.service $pkgdir/usr/lib/systemd/system/i2pd.service
  install -Dm0644 $srcdir/i2pd.tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/i2pd.conf

  install -Dm0644 $srcdir/i2pd/docs/i2pd.conf $pkgdir/${_conf_dest}/i2pd.conf
  install -Dm0644 $srcdir/i2pd/docs/tunnels.conf $pkgdir/${_conf_dest}/tunnels.conf
  install -Dm0644 $srcdir/i2pd/docs/subscriptions.txt $pkgdir/${_conf_dest}/subscriptions.txt

  install -d -m0750 $pkgdir/${_home_dest}
  ln -s /${_conf_dest}/i2pd.conf $pkgdir/${_home_dest}/i2pd.conf
  ln -s /${_conf_dest}/tunnels.conf $pkgdir/${_home_dest}/tunnels.conf
  ln -s /${_conf_dest}/subscriptions.txt $pkgdir/${_home_dest}/subscriptions.txt

  cd $srcdir/i2pd/contrib
  _dest="$pkgdir/${_share_dest}/${_pkgname}"
  find ./certificates -type d -exec install -d {} ${_dest}/{} \;
  find ./certificates -type f -exec install -Dm644 {} ${_dest}/{} \;
  ln -s /${_share_dest}/${_pkgname}/certificates $pkgdir/${_home_dest}/certificates

  # license
  install -Dm644 $srcdir/i2pd/LICENSE "$pkgdir/${_share_dest}/licenses/${_pkgname}/LICENSE"

  # docs
  _dest="$pkgdir/${_share_dest}/doc/${_pkgname}"
  install -Dm644 $srcdir/i2pd/README.md "${_dest}/README.md"
  install -Dm644 $srcdir/i2pd/docs/configuration.md "${_dest}/configuration.md"
  install -Dm644 $srcdir/i2pd/docs/family.md "${_dest}/family.md"
  install -Dm644 $srcdir/i2pd/docs/config_opts_after_2.3.0.md "${_dest}/config_opts_after_2.3.0.md"

  #man
  install -Dm644 $srcdir/i2pd/debian/i2pd.1 "$pkgdir/${_share_dest}/man/man1/i2pd.1"

  chmod -R o= $pkgdir/${_home_dest}
}

pkgver() {
  cd i2pd
  echo $(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

md5sums=('SKIP'
         '13c910900be4df3e0da11fc893f59a6f'
         'acda29e5b46a0c9fade734a6a467b381')

