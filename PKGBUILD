# Maintainer/Originator: Jake VanderKolk <jakevanderkolk@gmail.com>
pkgname=hostsblock
pkgver=0.999.8
pkgrel=1
pkgdesc="An ad- and malware-blocking utility for POSIX systems"
arch=(any)
url="https://github.com/gaenserich/hostsblock"
license=('GPL')
depends=(sh curl grep sed coreutils findutils)
optdepends=('dnsmasq: helps speed up DNS resolutions'
	    'pixelserv: removes boilerplate page on blocked urls'
	    'kwakd: removes boilerplate page on blocked urls (recommended)'
        'pixelserv-tls: removes boilerplate page on blocked urls (supports HTTPS)'
	    'unzip: allows the use of zipped downloads'
	    'p7zip: allows the use of 7zipped downloads')
source=(https://github.com/gaenserich/hostsblock/archive/v$pkgver.tar.gz)
changelog=$pkgname.changelog
install=$pkgname.install
sha1sums=('ad67ce3f45cc5a4b967f5c9e3af6ef8d65b56fa1')

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  mkdir -p -m 755 "$pkgdir"/var/lib/hostsblock
  install -Dm500 src/hostsblock.sh "$pkgdir"/usr/lib/hostsblock.sh
  [ ! -d "$pkgdir"/usr/bin ] && mkdir "$pkgdir"/usr/bin
  sed "s/%PREFIX%/\/usr/g" src/hostsblock-wrapper.sh > "$pkgdir"/usr/bin/hostsblock
  chmod 550 "$pkgdir"/usr/bin/hostsblock
  install -Dm600 conf/hostsblock.conf "$pkgdir"/var/lib/hostsblock/config.examples/hostsblock.conf
  install -Dm600 conf/black.list "$pkgdir"/var/lib/hostsblock/config.examples/black.list
  install -Dm600 conf/white.list "$pkgdir"/var/lib/hostsblock/config.examples/white.list
  install -Dm600 conf/hosts.head "$pkgdir"/var/lib/hostsblock/config.examples/hosts.head
  install -Dm600 conf/block.urls "$pkgdir"/var/lib/hostsblock/config.examples/block.urls
  install -Dm600 conf/redirect.urls "$pkgdir"/var/lib/hostsblock/config.examples/redirect.urls
  install -Dm444 systemd/hostsblock.service "$pkgdir"/usr/lib/systemd/system/hostsblock.service
  install -Dm444 systemd/hostsblock.timer "$pkgdir"/usr/lib/systemd/system/hostsblock.timer
  install -Dm444 systemd/hostsblock-dnsmasq-restart.path "$pkgdir"/usr/lib/systemd/system/hostsblock-dnsmasq-restart.path
  install -Dm444 systemd/hostsblock-dnsmasq-restart.service "$pkgdir"/usr/lib/systemd/system/hostsblock-dnsmasq-restart.service
  install -Dm444 systemd/hostsblock-hosts-clobber.path "$pkgdir"/usr/lib/systemd/system/hostsblock-hosts-clobber.path
  install -Dm444 systemd/hostsblock-hosts-clobber.service "$pkgdir"/usr/lib/systemd/system/hostsblock-hosts-clobber.service
}
