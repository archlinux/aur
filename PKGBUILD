# Maintainer: jsonn <jaso35 at googlemail dot com
# Contributor: mibbio <contact at mibbiodev dot de>
# Contributor: jjacky
# Contributor: dunningd <duncansdunning at yahoo dot co dot uk>
# Adapted/copied from netbeans-cpp 6.9.1 (Thanks wimvdh)
pkgname=netbeans-cpp
pkgver=8.2
pkgrel=2
pkgdesc="Netbeans IDE development platform - C/C++ only"
arch=('i686' 'x86_64')
url="https://netbeans.org/"
license=('CDDL')
depends=('java-runtime')
provides=('netbeans')
conflicts=('netbeans')
replaces=('netbeans-cpp-beta')
options=('!strip')
install=netbeans.install
backup=('usr/share/netbeans/etc/netbeans.conf')
source_x86_64=(netbeans-$pkgver-cpp-linux.sh::http://download.netbeans.org/netbeans/$pkgver/final/bundles/netbeans-$pkgver-cpp-linux-x64.sh)
source_i686=(netbeans-$pkgver-cpp-linux.sh::http://download.netbeans.org/netbeans/$pkgver/final/bundles/netbeans-$pkgver-cpp-linux-x86.sh)
source=(netbeans.desktop)
sha256sums=('b06afe8a2c8684956422b7ecb8a3d7a2aad6540619caa73ee39327fce5abfe5f')
sha256sums_i686=('52cbd7b071573d2f8baecb10b430b895be6f06e7c8f9b7ef75ba59afc9ae1342')
sha256sums_x86_64=('ba788a537fcdeb1e6b4963eebf9e7ea195723be85c03be693970eed8fb4e3777')


package() {
  mkdir -p $pkgdir/usr/share/netbeans
  /bin/sh $srcdir/../netbeans-$pkgver-cpp-linux.sh --silent --userdir $srcdir -J-Dnb-base.installation.location=$pkgdir/usr/share/netbeans
  rm $pkgdir/usr/share/netbeans/bin/netbeans.exe
  rm -f $pkgdir/usr/share/netbeans/bin/netbeans64.exe
  rm $pkgdir/usr/share/netbeans/uninstall.sh
  
  # Use Arch default JRE instead of builtin JRE
  rm -r $pkgdir/usr/share/netbeans/bin/jre
  sed -i "s|netbeans_jdkhome=.*|netbeans_jdkhome=\"/usr/lib/jvm/default\"|g" $pkgdir/usr/share/netbeans/etc/netbeans.conf
  
  install -D -m644 $srcdir/netbeans.desktop $pkgdir/usr/share/applications/netbeans.desktop
  for licensefile in LICENSE.txt THIRDPARTYLICENSE.txt
  do
    install -D -m644 $pkgdir/usr/share/netbeans/$licensefile $pkgdir/usr/share/licenses/$pkgname/$licensefile
    rm $pkgdir/usr/share/netbeans/$licensefile
  done
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/netbeans/bin/netbeans $pkgdir/usr/bin/netbeans
}
