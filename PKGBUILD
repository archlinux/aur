# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# contributor: Yoran Heling <info@yorhel.nl>
# Contributor: Lex Black <autumn-wind@web.de>

pkgname=uhub
pkgver=0.5.0
pkgrel=6
pkgdesc="A hub for the ADC network."
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.uhub.org'
depends=('python2'
         'libsystemd'
         )
makedepends=('cmake')
source=("http://www.extatic.org/downloads/uhub/${pkgname}-${pkgver}-src.tar.bz2"
        'systemd.patch::https://github.com/janvidar/uhub/commit/70f2a43f676cdda5961950a8d9a21e12d34993f8.patch'
        'uhub.service'
        'uhub.tmpfiles'
        'uhub.sysuser'
        )
sha256sums=('4596250446414e765c62fe81976041c927ea714dc6116792fd33760ac49798f5'
            '039582eee0d99351212df47b9ad6a94443d8bc05b7f7289d63fffd19014ea561'
            '4bf39c6265d53e1b08385c8e339c9d7b4449637c29688b1bcd2091e5c2b6c9df'
            '36645ca1faeb2e1bf12edf736c68e8b70c12aa6dbe3f710acc7823d1addb9050'
            'dfb3d51d95ef90e49b62cfa49d6a2cef58fb1f119f1d357f76ab1953000e5079'
            )
backup=('etc/uhub/motd.txt'
        'etc/uhub/plugins.conf'
        'etc/uhub/rules.txt'
        'etc/uhub/uhub.conf'
        'etc/uhub/users.conf'
        )
install=uhub.install

prepare() {
  mkdir -p build
  sed 's|/var/log/uhub.log|/var/log/uhub/uhub.log|g' \
      -i "uhub-${pkgver}/doc/plugins.conf" \
      -i "uhub-${pkgver}/doc/init.d.RedHat/etc/logrotate.d/uhub"
  for i in $(find "uhub-${pkgver}/tools" -type f -name '*.py'); do sed 's|python|python2|g' -i ${i}; done

  cd "uhub-${pkgver}"
  patch -p1 -i "${srcdir}/systemd.patch"
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
