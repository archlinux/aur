# Maintainer: robertfoster
# Contributor: kurych
# Contributor: redfish

pkgname=i2pd-git
pkgver=2.19.0.r1.gfb229d40
pkgrel=2
pkgdesc="Simplified C++ implementation of I2P client"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/PurpleI2P/i2pd"
license=('BSD')
depends=('boost-libs' 'miniupnpc' 'openssl' 'zlib')
makedepends=('git' 'boost' 'cmake')
source=("${pkgname%%-git}::git+https://github.com/PurpleI2P/i2pd#branch=master")
install="${pkgname%%-git}.install"

backup=("etc/${pkgname%%-git}/${pkgname%%-git}.conf"
        "etc/${pkgname%%-git}/tunnels.conf"
)
provides=("${pkgname%%-git}=${pkgver}")
conflicts=("${pkgname%%-git}")

build() {
  cd $srcdir/${pkgname%%-git}
  cd build

  cmake . -DCMAKE_CXX_FLAGS="-w" \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DWITH_UPNP=ON -DWITH_PCH=OFF \
	  -DCMAKE_BUILD_TYPE=Release
  make
}

package(){
  _conf_dest="etc/${pkgname%%-git}"
  _home_dest="var/lib/${pkgname%%-git}"
  _share_dest="usr/share"

  cd $srcdir/${pkgname%%-git}

  cd build
  make DESTDIR=$pkgdir install
  install -Dm0644 ../contrib/debian/${pkgname%%-git}.service $pkgdir/usr/lib/systemd/system/${pkgname%%-git}.service

  install -Dm0644 $srcdir/${pkgname%%-git}/contrib/i2pd.conf $pkgdir/${_conf_dest}/${pkgname%%-git}.conf
  install -Dm0644 $srcdir/${pkgname%%-git}/contrib/tunnels.conf $pkgdir/${_conf_dest}/tunnels.conf
  install -Dm0644 $srcdir/${pkgname%%-git}/contrib/subscriptions.txt $pkgdir/${_conf_dest}/subscriptions.txt

  install -d -m0750 $pkgdir/${_home_dest}
  ln -s /${_conf_dest}/${pkgname%%-git}.conf $pkgdir/${_home_dest}/${pkgname%%-git}.conf
  ln -s /${_conf_dest}/tunnels.conf $pkgdir/${_home_dest}/tunnels.conf
  ln -s /${_conf_dest}/subscriptions.txt $pkgdir/${_home_dest}/subscriptions.txt

  cd $srcdir/${pkgname%%-git}/contrib
  _dest="$pkgdir/${_share_dest}/${pkgname%%-git}"
  find ./certificates -type d -exec install -d {} ${_dest}/{} \;
  find ./certificates -type f -exec install -Dm644 {} ${_dest}/{} \;
  ln -s /${_share_dest}/${pkgname%%-git}/certificates $pkgdir/${_home_dest}/certificates

  # license
  install -Dm644 $srcdir/${pkgname%%-git}/LICENSE $pkgdir/${_share_dest}/licenses/${pkgname%%-git}/LICENSE

  # docs
  _dest="$pkgdir/${_share_dest}/doc/${pkgname%%-git}"
  install -Dm644 $srcdir/${pkgname%%-git}/README.md "${_dest}/README.md"

  # remove src folder and LICENSE
  rm -r $pkgdir/usr/{src,LICENSE}

  #man
  install -Dm644 $srcdir/${pkgname%%-git}/debian/${pkgname%%-git}.1 $pkgdir/${_share_dest}/man/man1/${pkgname%%-git}.1

  chmod -R o= $pkgdir/${_home_dest}
}

pkgver() {
  cd ${pkgname%%-git}
  echo $(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

md5sums=('SKIP')
