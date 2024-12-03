# Maintainer: Pawel Mozdzonek <rockplayer.pl@gmail.com>

pkgname=withings-sync
pkgver=v4.2.7.r0.g67c0ed2
pkgrel=1
pkgdesc="A tool for synchronisation of Withings (ex. Nokia Health Body) to Garmin Connect and Trainer Road."
arch=(any)
url="https://github.com/jaroslawhartman/withings-sync"
license=(MIT)
depends=(python-garth python-lxml python-requests python-dotenv python-setuptools)
makedepends=("python")
source=("$pkgname::git+https://github.com/jaroslawhartman/withings-sync.git"
        "${pkgname}.service"
        "${pkgname}.timer"
        "${pkgname}.conf.example")

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.timer" "${pkgdir}/usr/lib/systemd/user/${pkgname}.timer"
  install -Dm600 "${srcdir}/${pkgname}.conf.example" "${pkgdir}/etc/${pkgname}/${pkgname}.conf.example"

  echo "1.) Initially run withings-sync from the cli for the <user> to enable the access to withings"
  echo "2.) Copy Conf file to home directory and update with Garmin/Trainer Road Username & P/W"
  echo "3.) Edit the service file to point to the conf file location"
  echo "       $systemctl --user edit --full withings-sync.service"
  echo "4.) Enable the timer: $systemctl --user enable --now withings-sync.timer"
}

md5sums=('SKIP'
         'cabc6d7ff62a22ed8b6722210c873bb6'
         'fdcbfb1d8c6081077048da6d92b0721f'
         '8c065062c737baae192fadb97a88abc1')
