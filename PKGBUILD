# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

pkgname=plume
pkgver=0.3.0a2
pkgrel=1
pkgdesc='Federated blogging application'
arch=(x86_64)
url='https://joinplu.me/'
license=(AGPL3)
depends=(cargo-web diesel_cli postgresql)
makedepends=(cargo)
# TODO: fix the alpha version
source=("$pkgname-$pkgver.tar.gz::https://github.com/Plume-org/Plume/archive/0.3.0-alpha-2.tar.gz"
        "sysuser.conf"
        "plume.service"
        "config")
install=$pkgname.install
md5sums=('533231959873a2a7c7b416b8df0eaf0a'
         'ebfcfb05844a25ff281317af9b64f8bb'
         'c4e95f7b575ea1be0dd905e64f97eb9b'
         '92c6867252e9276d5798c30858ed0278')

build() {
  cd "Plume-0.3.0-alpha-2"
  cargo web deploy -p plume-front
  # only use postgres as database backend
  cargo build --release --features postgres
  cd plume-cli
  cargo build --release --features postgres
}

package() {
  install -d $pkgdir/etc/plume
  install -Dm644 "config" "$pkgdir/usr/share/webapps/plume/.env"
  install -Dm644 "sysuser.conf" "$pkgdir/usr/lib/sysusers.d/plume.conf" 
  install -Dm644 "plume.service" "$pkgdir/usr/lib/systemd/system/plume.service"
  cd "Plume-0.3.0-alpha-2"
  install -Dm755 "target/release/plume" "$pkgdir/usr/bin/plume"
  install -Dm755 "target/release/plm" "$pkgdir/usr/bin/plm"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  cp -r "migrations/postgres" "$pkgdir/usr/share/webapps/plume/migrations"
  cp -r "static" "$pkgdir/usr/share/webapps/plume"
  ln -s "/usr/share/webapps/plume/.env" "$pkgdir/etc/plume/config"
}
