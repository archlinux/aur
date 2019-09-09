# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=uhub-git
pkgver=0.5.0.64.g78a7039
pkgrel=1
pkgdesc="A hub for the ADC network. (GIT Version)"
arch=('x86_64')
license=('LGPL')
url='http://www.uhub.org'
depends=('libsystemd.so'
         'sqlite'
         )
makedepends=('cmake'
             'git'
             )
optdepends=('python: scripts')
source=('git+https://github.com/janvidar/uhub.git'
        'uhub.sysuser'
        'uhub.service'
        'uhub.tmpfiles'
        )
sha256sums=('SKIP'
            'dfb3d51d95ef90e49b62cfa49d6a2cef58fb1f119f1d357f76ab1953000e5079'
            '4bf39c6265d53e1b08385c8e339c9d7b4449637c29688b1bcd2091e5c2b6c9df'
            '94628376878d6b91c55deec62aad59ddfd9dd0d87dd4552aeeb202875f340a09'
            )
install=uhub-git.install
backup=('etc/uhub/motd.txt'
        'etc/uhub/plugins.conf'
        'etc/uhub/rules.txt'
        'etc/uhub/uhub.conf'
        'etc/uhub/users.conf'
        )

pkgver() {
  cd uhub
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  sed 's|/var/log/uhub.log|/var/log/uhub/uhub.log|g' \
    -i uhub/doc/plugins.conf \
    -i uhub/doc/init.d.RedHat/etc/logrotate.d/uhub
}

build() {
  cd build
  cmake ../uhub \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSTEMD_SUPPORT=ON

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 uhub/doc/users.conf "${pkgdir}/etc/uhub/users.conf"
  touch "${pkgdir}/etc/uhub/motd.txt"

  install -Dm644 uhub.service "${pkgdir}/usr/lib/systemd/system/uhub.service"
  install -Dm644 uhub.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/uhub.conf"
  install -Dm644 uhub.sysuser "${pkgdir}/usr/lib/sysusers.d/uhub.conf"

  install -Dm644 uhub/doc/init.d.RedHat/etc/logrotate.d/uhub "${pkgdir}/etc/logrotate.d/uhub"

  install -Dm644 uhub/doc/uhub.1 "${pkgdir}/usr/share/man/man1/uhub.1"
  install -Dm644 uhub/doc/uhub-passwd.1  "${pkgdir}/usr/share/man/man1/uhub-passwd.1"

  install -Dm644 uhub/doc/architecture.txt "${pkgdir}/usr/share/doc/uhub/architecture.txt"
  install -Dm644 uhub/doc/extensions.txt "${pkgdir}/usr/share/doc/uhub/extensions.txt"
  install -Dm644 uhub/doc/getstarted.txt "${pkgdir}/usr/share/doc/uhub/getstarted.txt"

  for i in $(find uhub/tools -type f); do install -Dm755 ${i} "${pkgdir}/usr/share/uhub/${i}"; done

  install -d 750 "${pkgdir}/var/log/uhub"
}
