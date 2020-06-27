# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: François Garillot <francois[@]garillot.net>

_pkgname=zinc
pkgname=${_pkgname}-git
pkgver=1.4.0.M6.r27.gdd8ce9132
pkgrel=1
pkgdesc="Zinc is a stand-alone version of sbt's incremental compiler."
url='https://github.com/sbt/zinc'
arch=('any')
license=('Apache')
depends=('java-environment')
provides=('zinc')
conflicts=('zinc')
makedepends=('git')
source=("git+https://github.com/sbt/zinc.git"
	"zincer.sh" # server launcher
	"zincer.conf" # service env vars
	"zincer.service" # systemd service
)
backup=(
    'etc/conf.d/zincer.conf'
)
md5sums=('SKIP'
         '5fd9435289f20d368e13b71ff3ac941b'
         '70035ee248ad6915559d8caeb6e695b0'
         '45be73549f17e852af77fc3de01487d4')
options=('!strip')

pkgver() {
  cd "$_pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  local home="/opt/zinc"
  local target="$pkgdir/$home"
    
  mkdir -p "$target"
  cp -a "$_pkgname/." "$target/"
    
  install -D -m755 zincer.sh         "$target/zincer.sh"
  install -D -m644 zincer.conf       "$pkgdir/etc/conf.d/zincer.conf"
  install -D -m644 zincer.service    "$pkgdir/usr/lib/systemd/system/zincer.service"
    
  mkdir -p $pkgdir/usr/bin
  ln -s "$home/bin/zinc"             "$pkgdir/usr/bin/zinc"
  ln -s "$home/zincer.sh"            "$pkgdir/usr/bin/zincer"
}
