# Maintainer: TX1683 <tx1683@gmail.com>

_pkgname=galaxy42
pkgname=galaxy42-dev-git
pkgver=0.3.3a.r138.g91004e72
pkgrel=1
pkgdesc='An encrypted Meshnet and VPN software. (dev branch)'
url='https://github.com/yedino/galaxy42'
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('libtool' 'boost' 'libsodium' 'fftw')
makedepends=('git' 'gcc' 'cmake' 'bash')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url#branch=dev")
backup=(etc/galaxy42-testnet.conf etc/galaxy42.conf)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
install="galaxy42-dev-git.install"

build() {
  #if you want to build faster
  #export THREADS=$(nproc)	
  cd $_pkgname 
  ./do --go
  cd $srcdir/$_pkgname/src-tools/netutils/asio_receive_async
  make 
  cd $srcdir/$_pkgname/src-tools/netutils/asio_receive_block
  make 
  cd $srcdir/$_pkgname/src-tools/netutils/asio_send_block 
  make 
  cd $srcdir/$_pkgname/src-tools/netutils/asio_send_block_ipv6 
  make 
}

package() {
  cd $_pkgname/build
  install -Dm744 tunserver.elf "$pkgdir/usr/bin/tunserver.elf"
  install -Dm744 nocap-tunserver.elf "$pkgdir/usr/bin/nocap-tunserver.elf"
  install -Dm744 nocap-unittests.elf "$pkgdir/usr/bin/nocap-unittests.elf"
  install -Dm744 performancetests.elf "$pkgdir/usr/bin/performancetests.elf"
  install -Dm744 unittests.elf "$pkgdir/usr/bin/unittests.elf"
  cd $srcdir/$_pkgname/share/script/install-as-root/setcap_scripts/bin
  install -Dm744 setcap_net_admin "$pkgdir/usr/bin/setcap_net_admin"
  cd $srcdir/$_pkgname/src-tools/netutils/asio_receive_async
  install -Dm744 asio_receive_async "$pkgdir/usr/bin/asio_receive_async"
  cd $srcdir/$_pkgname/src-tools/netutils/asio_receive_block
  install -Dm744 asio_receive_block "$pkgdir/usr/bin/asio_receive_block"
  cd $srcdir/$_pkgname/src-tools/netutils/asio_send_block
  install -Dm744 asio_send_block "$pkgdir/usr/bin/asio_send_block"
  cd $srcdir/$_pkgname/src-tools/netutils/asio_send_block_ipv6 
  install -Dm744 asio_send_block_ipv6 "$pkgdir/usr/bin/asio_send_block_ipv6"

  #locale
   
  cd $srcdir/$_pkgname/share/locale/en/LC_MESSAGES
  install -Dm744 g42bashutils.mo "$pkgdir/usr/share/locale/en/LC_MESSAGES/g42bashutils.mo"
  install -Dm744 galaxy42_installer.mo "$pkgdir/usr/share/locale/en/LC_MESSAGES/galaxy42_installer.mo"
  install -Dm744 galaxy42_main.mo "$pkgdir/usr/share/locale/en/LC_MESSAGES/galaxy42_main.mo"
  install -Dm744 galaxy42_scripts.mo "$pkgdir/usr/share/locale/en/LC_MESSAGES/galaxy42_scripts.mo"

  cd $srcdir/$_pkgname/share/locale/pl/LC_MESSAGES
  install -Dm744 g42bashutils.mo "$pkgdir/usr/share/locale/pl/LC_MESSAGES/g42bashutils.mo"
  install -Dm744 galaxy42_installer.mo "$pkgdir/usr/share/locale/pl/LC_MESSAGES/galaxy42_installer.mo"
  install -Dm744 galaxy42_main.mo "$pkgdir/usr/share/locale/pl/LC_MESSAGES/galaxy42_main.mo"
  install -Dm744 galaxy42_scripts.mo "$pkgdir/usr/share/locale/pl/LC_MESSAGES/galaxy42_scripts.mo"

  cd $srcdir/$_pkgname/share/locale/ru/LC_MESSAGES
  install -Dm744 galaxy42_installer.mo "$pkgdir/usr/share/locale/ru/LC_MESSAGES/galaxy42_installer.mo"
  install -Dm744 galaxy42_main.mo "$pkgdir/usr/share/locale/ru/LC_MESSAGES/galaxy42_main.mo"
  install -Dm744 galaxy42_scripts.mo "$pkgdir/usr/share/locale/ru/LC_MESSAGES/galaxy42_scripts.mo"

  cd $srcdir/$_pkgname/share/locale/uk/LC_MESSAGES
  install -Dm744 galaxy42_installer.mo "$pkgdir/usr/share/locale/uk/LC_MESSAGES/galaxy42_installer.mo"
  install -Dm744 galaxy42_main.mo "$pkgdir/usr/share/locale/uk/LC_MESSAGES/galaxy42_main.mo"
  install -Dm744 galaxy42_scripts.mo "$pkgdir/usr/share/locale/uk/LC_MESSAGES/galaxy42_scripts.mo"

#systemd service and config
  cd $srcdir/$_pkgname/contrib/archlinux
  install -Dm744 galaxy42-testnet.conf "$pkgdir/etc/galaxy42-testnet.conf"
  install -Dm744 galaxy42.conf "$pkgdir/etc/galaxy42.conf"
  install -Dm744 galaxy42-testnet.service "$pkgdir/usr/lib/systemd/system/galaxy42-testnet.service"
  install -Dm744 galaxy42.service "$pkgdir/usr/lib/systemd/system/galaxy42.service"

 
}
