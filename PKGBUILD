# Maintainer: kompowiec <diasp@o2.pl>
pkgname=convos
pkgver=8.07
pkgrel=1
pkgdesc="Convos is the simplest way to use IRC."
arch=('x86_64')
url="https://convos.chat/"
license=('Artistic-2.0')
depends=('perl' 'make' 'gcc' 'git' 'curl' 'tar' 'wget' 'perl-io-socket-ssl' 'openssl')
makedepends=('perl')
source=("convos-install.sh::https://convos.chat/install.sh")
sha256sums=('SKIP')

build() {
  cd "$srcdir"
  chmod +x convos-install.sh
  ./convos-install.sh
  cd convos
  ./script/convos install
}

package() {
  cd "$srcdir/convos"
  install -Dm755 script/convos "$pkgdir/usr/bin/convos"
  cp -r . "$pkgdir/usr/share/convos"
}
package() {
  cd "$srcdir/convos"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/convos"
  install -Dm755 script/convos "$pkgdir/usr/bin/convos"
  cp -r . "$pkgdir/usr/share/convos"
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/convos.service" <<EOF
[Unit]
Description=Convos IRC client
After=network.target

[Service]
ExecStart=/usr/bin/convos daemon
WorkingDirectory=/usr/share/convos
User=convos
Group=convos
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
}

post_install() {
  systemctl enable convos.service
  systemctl start convos.service
}
