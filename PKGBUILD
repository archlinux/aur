# Maintainer: mattski <redmattski at gmail dot com>

pkgname=withings-sync
pkgver=v3.1.2.r5.g3bb410b
pkgrel=2
pkgdesc="A tool for synchronisation of Withings (ex. Nokia Health Body) to Garmin Connect and Trainer Road."
arch=(any)
url="https://github.com/jaroslawhartman/withings-sync"
license=(MIT)
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

  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
  install -Dm600 "${srcdir}/${pkgname}.conf.example" "${pkgdir}/etc/${pkgname}/${pkgname}.conf.example"

  echo "1.) Run withings-sync as the <local user> including enabling the access to withings"
  echo "2.) Add User=<local user> to the service file"
  echo "3.) Update the conf file with the Garmin username and PW"
  echo "4.) Enable the timer"
}

md5sums=('SKIP'
         'cabc6d7ff62a22ed8b6722210c873bb6'
         'fdcbfb1d8c6081077048da6d92b0721f'
         '8c065062c737baae192fadb97a88abc1')
