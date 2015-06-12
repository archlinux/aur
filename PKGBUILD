# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=uhub-git
pkgver=0.5.0.23.gdc80644
pkgrel=1
pkgdesc="A hub for the ADC network. (GIT Version)"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.uhub.org/"
depends=('libsystemd' 'python2')
makedepends=('cmake' 'git')
source=('git+https://github.com/janvidar/uhub.git'
        'uhub.service'
        'uhub.tmpfiles')
sha1sums=('SKIP'
          'a72699fb05ba6ad48a3ff0d18d8ef2904c29c6a5'
          'fa06f77fe35eee8dea6c8d2be81486a2ecc35a5b')
install=uhub-git.install
backup=('etc/uhub/motd.txt'
        'etc/uhub/plugins.conf'
        'etc/uhub/rules.txt'
        'etc/uhub/uhub.conf'
        'etc/uhub/users.conf')

pkgver() {
  cd uhub
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  sed 's|/var/log/uhub.log|/var/log/uhub/uhub.log|g' \
    -i uhub/doc/plugins.conf \
    -i uhub/doc/init.d.RedHat/etc/logrotate.d/uhub
  for i in $(find uhub/tools -type f -name '*.py'); do sed 's|python|python2|g' -i ${i}; done
}

build() {
  cd build
  cmake ../uhub \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSTEMD_SUPPORT=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 uhub/doc/users.conf "${pkgdir}/etc/uhub/users.conf"
  touch "${pkgdir}/etc/uhub/motd.txt"

  install -Dm644 ../uhub.service "${pkgdir}/usr/lib/systemd/system/uhub.service"
  install -Dm644 ../uhub.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/uhub.conf"
  install -Dm644 ../uhub.sysuser "${pkgdir}/usr/lib/sysusers.d/uhub.conf"

  install -Dm644 uhub/doc/init.d.RedHat/etc/logrotate.d/uhub "${pkgdir}/etc/logrotate.d/uhub"

  install -Dm644 uhub/doc/uhub.1 "${pkgdir}/usr/share/man/man1/uhub.1"
  install -Dm644 uhub/doc/uhub-passwd.1  "${pkgdir}/usr/share/man/man1/uhub-passwd.1"

  install -Dm644 uhub/doc/architecture.txt "${pkgdir}/usr/share/doc/uhub/architecture.txt"
  install -Dm644 uhub/doc/extensions.txt "${pkgdir}/usr/share/doc/uhub/extensions.txt"
  install -Dm644 uhub/doc/getstarted.txt "${pkgdir}/usr/share/doc/uhub/getstarted.txt"

  for i in $(find uhub/tools -type f); do install -Dm755 ${i} "${pkgdir}/usr/share/uhub/${i}"; done
}
