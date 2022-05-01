# Maintainer: Suren Kirakosyan <surenkirakosyan.am@gmail.com>

pkgname=sarqx-reporter
pkgver=0.0.1
pkgrel=1
pkgdesc="CLI application."
arch=(i686 x86_64)
url=https://gitlab.com/sarqx_group/sarqx-reporter
license=('GPL')
depends=('erlang' 'elixir' 'dmidecode' 'zenity')
checkdepends=('systemd')
makedepends=(git make)
provides=($pkgname=$pkgver)
conflicts=($pkgname)
source=("https://gitlab.com/sarqx_group/sarqx-reporter/-/archive/master/sarqx-reporter-master.tar.gz")
sha256sums=('SKIP')

build() {
  cd $pkgname-master

  make install
}

package() {
  cd $pkgname-master

  mkdir -p $pkgdir/opt/$pkgname/share/licenses
  install -Dm644 LICENSE $pkgdir/opt/$pkgname/share/licenses

  # TODO: maybe I should change permission of bin files
  mkdir -p $pkgdir/opt/$pkgname/bin
  install -Dm755 $pkgname $pkgdir/opt/$pkgname/bin
  install -Dm755 askpass.sh $pkgdir/opt/$pkgname/bin

  mkdir -p $pkgdir/usr/bin/
  ln -s /opt/$pkgname/bin/$pkgname $pkgdir/usr/bin/$pkgname

  mkdir -p $pkgdir/var/opt/$pkgname/logs
  # HELP: chmod 600 provides read and write permission for user
  chmod 644 $pkgdir/var/opt/$pkgname/logs

  # HELP: store config files
  mkdir -p $pkgdir/etc/opt/$pkgname
  chmod 600 $pkgdir/etc/opt/$pkgname

  # Create daemon file and give its name
  systemd_file_name=$(make create_systemd)

  mkdir -p $pkgdir/etc/systemd/system
  install -Dm644 $systemd_file_name $pkgdir/etc/systemd/system
}