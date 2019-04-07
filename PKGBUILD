# Maintainer/Originator: Jake VanderKolk <jakevanderkolk@gmail.com>
pkgname=hostsblock
pkgver=0.999.8.1
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
sha1sums=('04259e6c6f3187d3cb765b17e5b5de0651558c8c')
SYSTEMD_DIR="/usr/lib/systemd/system"
SYSTEMCTLPATH="/usr/bin/systemctl"
SHPATH="/usr/bin/sh"
_HOME="/var/lib/hostsblock"
_PREFIX="/usr"

_mkdir() {
    # $1 = dir to be made; $2 = chmod hex
    [ ! -d "$1" ] && mkdir -p -m "$2" -- "$1"
}

_install() {
    #$1 = source; $2 = destination; $3 = chmod hex
    sed -e "s|%PREFIX%|$_PREFIX|g" -e "s|%SYSTEMCTLPATH%|$SYSTEMCTLPATH|g" -e "s|%SHPATH%|$SHPATH|g" -e "s|%_HOME%|$_HOME|g" "$1" > "$2"
    chmod "$3" "$2"
}


package() {
  cd "$srcdir"/"$pkgname"-"$pkgver" 
  _mkdir "$pkgdir"/usr/lib 755
  _install src/hostsblock.sh "$pkgdir"/usr/lib/hostsblock.sh 500
  _mkdir "$pkgdir"/usr/bin 755
  _install src/hostsblock-wrapper.sh "$pkgdir"/usr/bin/hostsblock 550
  _mkdir "$pkgdir"/var/lib/hostsblock/config.examples 700
  for _conffile in hostsblock.conf black.list white.list hosts.head block.urls redirect.urls; do
    _install conf/"$_conffile" "$pkgdir"/var/lib/hostsblock/config.examples/"$_conffile" 600
  done
  _mkdir "$pkgdir"/usr/lib/systemd/system 755
  for _sysdfile in hostsblock.service hostsblock.timer hostsblock-dnsmasq-restart.path hostsblock-dnsmasq-restart.service hostsblock-hosts-clobber.path hostsblock-hosts-clobber.service; do
    _install systemd/"$_sysdfile" "$pkgdir"/usr/lib/systemd/system/"$_sysdfile" 444
  done
}
