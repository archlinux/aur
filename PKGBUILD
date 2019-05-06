# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=tirex-git
pkgver=r224.154dd09
pkgrel=1
pkgdesc="Tirex tile queue manager. A drop-in replacement for renderd."
arch=('i686' 'x86_64')
url='https://github.com/geofabrik/tirex'
license=('GPL2')
groups=()
install='tirex.install'
depends=(
  # official packages
  'mapnik' 'perl-json' 'perl-gd' 'perl-libwww' 'mapserver'
  # AUR packages
  'perl-ipc-sharelite'
)
optdepends=(
  'nagios'
  'munin'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/tirex/tirex.conf')
options=()
source=("${pkgname%-git}"::'git+https://github.com/geofabrik/Tirex.git'
        'tirex.conf'
        'tirex-backend-manager.service'
        'tirex-master.service'
        'tirex.target')
sha256sums=('SKIP'
            '3765c9c6618f34c732f8ffe6ccc2dfded88dc2fdc47adae4bad06853117f07f3'
            'efedbb35616aba4ddbf93e32d144048c6f7498dbf97fbcd69e9db5dabca151c4'
            'f17c4d956efeefd7aceb2b86aaf3767fe986e5c03f074d5de5a8549106dd7bae'
            'c68a93fd43b4e73f082bbec3af3b418cd2a23f00893e60e81c41b25c6b49b6ab')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install-all

  # create directory for example map
  install -d -m 755 ${pkgdir}/var/lib/tirex/tiles/example

  cd "${srcdir}"

  # install systemd tmpfile config
  install -d -m 755 ${pkgdir}/usr/lib/tmpfiles.d
  install -m 644 tirex.conf ${pkgdir}/usr/lib/tmpfiles.d/tirex.conf

  # install systemd services
  install -d -m 755 ${pkgdir}/usr/lib/systemd/system
  install -m 644 tirex-backend-manager.service ${pkgdir}/usr/lib/systemd/system/tirex-backend-manager.service
  install -m 644 tirex-master.service ${pkgdir}/usr/lib/systemd/system/tirex-master.service
  install -m 644 tirex.target ${pkgdir}/usr/lib/systemd/system/tirex.target
}
