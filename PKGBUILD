# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: farwayer <farwayer@gmail.com>

pkgname=jack2-no-dbus-git
pkgver=1.9.10.151.g22e843f
pkgrel=2
pkgdesc='Classic jack2 without dbus enabled. For starting as daemon with systemd.'
arch=('x86_64' 'i686')
url='http://jackaudio.org/'
license=('GPL2')
depends=('libsamplerate')
makedepends=('python' 'git' 'gcc')
optdepends=(
	'opus: opus codec support over network (install *before* building)'
)
provides=('jack2' 'jack' 'jack2-git' 'jackmp' 'jackdmp')
conflicts=('jack2' 'jack' 'jack2-git' 'jack2-dbus')
source=(
	"$pkgname::git+http://github.com/jackaudio/jack2.git"
	'99-audio.conf'
	'40-hpet-permissions.rules'
	'jackd@.service'
	'jackd.conf'
)
md5sums=(
	'SKIP'
	'ae65b7c9ebe0fff6c918ba9d97ae342d'
        '471aad533ff56c5d3cbbf65ce32cadef'
	'42668787a9faf9cf4e2f6c49be53c37e'
	'adec71667ca43e9f5297541cc51a99ef'
)
install=install

pkgver() {
  cd $pkgname

  git describe | sed 's/^v//;s/-/./g'
}

build() {
  cd $pkgname

  ./waf configure --classic --alsa --clients=128 --ports-per-application=1536 --prefix=/usr
  ./waf $MAKEFLAGS build 
}

package() {
  cd $pkgname

  ./waf install --destdir="$pkgdir"

  install -Dm644 "$srcdir/99-audio.conf" \
    "$pkgdir/etc/security/limits.d/99-audio.conf"

  install -Dm644 "$srcdir/40-hpet-permissions.rules" \
    "$pkgdir/usr/lib/udev/rules.d/40-hpet-permissions.rules"
    
  install -Dm644 "$srcdir/jackd@.service" \
    "$pkgdir/usr/lib/systemd/system/jackd@.service"
    
  install -Dm644 "$srcdir/jackd.conf" \
    "$pkgdir/etc/conf.d/jackd.conf"    
}
