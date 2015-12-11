# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# contributor: Yoran Heling <info@yorhel.nl>
# Contributor: Lex Black <autumn-wind@web.de>

pkgname=uhub
pkgver=0.5.0
pkgrel=5
pkgdesc="A hub for the ADC network."
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.uhub.org'
depends=('python2'
         'libsystemd'
         )
makedepends=('cmake')
source=("http://www.extatic.org/downloads/uhub/${pkgname}-${pkgver}-src.tar.bz2"
        'uhub.service'
        'uhub.tmpfiles'
        'uhub.sysuser')
sha1sums=('f9ef93efd605b13aa3d8d93ae2cb3229b463d2bf'
          'a72699fb05ba6ad48a3ff0d18d8ef2904c29c6a5'
          'fa06f77fe35eee8dea6c8d2be81486a2ecc35a5b'
          'e964b2e946a5662f61f806d0181c8b83834ac688')
backup=('etc/uhub/motd.txt'
        'etc/uhub/plugins.conf'
        'etc/uhub/rules.txt'
        'etc/uhub/uhub.conf'
        'etc/uhub/users.conf')
install=uhub.install

prepare() {
  mkdir -p build
  sed 's|/var/log/uhub.log|/var/log/uhub/uhub.log|g' \
      -i "uhub-${pkgver}/doc/plugins.conf" \
      -i "uhub-${pkgver}/doc/init.d.RedHat/etc/logrotate.d/uhub"
  for i in $(find "uhub-${pkgver}/tools" -type f -name '*.py'); do sed 's|python|python2|g' -i ${i}; done
}

build() {
  cd build
  cmake "../uhub-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSTEMD_SUPPORT=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 "uhub-${pkgver}/doc/users.conf" "${pkgdir}/etc/uhub/users.conf"
  touch "${pkgdir}/etc/uhub/motd.txt"

  install -Dm644 "${srcdir}/uhub.service" "${pkgdir}/usr/lib/systemd/system/uhub.service"
  install -Dm644 "${srcdir}/uhub.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/uhub.conf"
  install -Dm644 "${srcdir}/uhub.sysuser" "${pkgdir}/usr/lib/sysusers.d/uhub.conf"

  install -Dm644 "uhub-${pkgver}/doc/init.d.RedHat/etc/logrotate.d/uhub" "${pkgdir}/etc/logrotate.d/uhub"

  install -Dm644 "uhub-${pkgver}/doc/uhub.1" "${pkgdir}/usr/share/man/man1/uhub.1"
  install -Dm644 "uhub-${pkgver}/doc/uhub-passwd.1"  "${pkgdir}/usr/share/man/man1/uhub-passwd.1"

  install -Dm644 "uhub-${pkgver}/doc/architecture.txt" "${pkgdir}/usr/share/doc/uhub/architecture.txt"
  install -Dm644 "uhub-${pkgver}/doc/extensions.txt" "${pkgdir}/usr/share/doc/uhub/extensions.txt"
  install -Dm644 "uhub-${pkgver}/doc/getstarted.txt" "${pkgdir}/usr/share/doc/uhub/getstarted.txt"

  cd "uhub-${pkgver}"
  for i in $(find tools -type f); do install -Dm755 ${i} "${pkgdir}/usr/share/uhub/${i}"; done
}
