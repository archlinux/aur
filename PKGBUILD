# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: farwayer <farwayer@gmail.com>

pkgname=jack2-no-dbus-git
pkgver=1.9.12.r17.g21f67b38
pkgrel=2
pkgdesc='Classic jack2 without dbus enabled. For starting as daemon with systemd.'
arch=('x86_64' 'i686')
url='http://jackaudio.org/'
license=('GPL')
depends=('celt' 'libffado' 'opus')
makedepends=('python2' 'celt' 'opus' 'libsamplerate' 'git' 'libffado')
optdepends=('a2jmidid: Expose legacy ALSA sequencer applications in JACK MIDI'
            'realtime-privileges: Acquire realtime privileges')
provides=('jack2' 'jack' 'jack2-git')
conflicts=('jack2' 'jack' 'jack2-git' 'jack2-dbus')
source=(
	"$pkgname::git+https://github.com/jackaudio/jack2"
	'jackd@.service'
	'jackd.conf'
)
md5sums=(
	'SKIP'
	'539000cbbc78a3fc170fbc3cc1de5bd7'
	'adec71667ca43e9f5297541cc51a99ef'
)

pkgver() {
  cd ${pkgname[0]}
  # get commits since last unannotated tag
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g;'
}

build() {
  cd $pkgname

  # configure jack2
  python2 waf configure --prefix=/usr \
                        --htmldir="/usr/share/doc/${pkgbase}/" \
                        --freebob=no \
                        --classic \

  # build jack2
  cd "${srcdir}/${pkgname[0]}"
  python2 waf build
}

package() {
  cd $pkgname

  python2 waf install --destdir="$pkgdir"
    
  install -Dm644 "$srcdir/jackd@.service" \
    "$pkgdir/usr/lib/systemd/system/jackd@.service"
    
  install -Dm644 "$srcdir/jackd.conf" \
    "$pkgdir/etc/conf.d/jackd.conf"    
}
