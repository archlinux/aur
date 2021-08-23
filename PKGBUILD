# Maintainer: robertfoster
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=libreoffice-online
pkgver=6.4.10
_rel=10
pkgrel=1
pkgdesc="HTML5-based/cloud-based version of the office suite"
arch=('aarch64' 'x86_64')
url="https://www.libreoffice.org/download/libreoffice-online/"
license=("MPL")
depends=("cpio" "fontconfig" "libcap" "libcap-ng" "libpng" "libreoffice-fresh" "openssl" "pam" "poco" "zlib")
makedepends=("cppunit" "git" "libreoffice-fresh-sdk" "npm" "python-polib")
backup=(
  "etc/conf.d/loolwsd"
  "etc/httpd/conf/extra/loolwsd.conf"
  "etc/loolwsd/loolkitconfig.xcu"
  "etc/loolwsd/loolwsd.xml"
  "etc/nginx/snippets/loolwsd.conf"
  "etc/pam.d/loolwsd"
)
source=("https://github.com/CollaboraOnline/online/archive/cp-${pkgver}-${_rel}.tar.gz"
  "loolwsd.pam.d"
  "loolwsd-config.patch"
  "loolwsd.service"
  "libreoffice-online.install"
  "libreoffice-online.sysusers"
"libreoffice-online.tmpfiles")
install=libreoffice-online.install

prepare() {
  cd "${srcdir}/online-cp-${pkgver}-${_rel}"
  patch -p1 <"${srcdir}/loolwsd-config.patch"
}

build() {
  cd "${srcdir}/online-cp-${pkgver}-${_rel}"
  
  # Disable unit-tests, will be removed or reformulated
  sed -i "s/all-local/#all-local/" test/Makefile.am

  ./autogen.sh

  ./configure \
  --prefix=/usr \
  --mandir=/usr/share/man \
  --infodir=/usr/share/info \
  --datadir=/usr/share \
  --sysconfdir=/etc \
  --localstatedir=/var/lib \
  --disable-dependency-tracking \
  --disable-freemium \
  --disable-silent-rules \
  --docdir=/usr/share/doc/loolwsd \
  --htmldir=/usr/share/doc/loolwsd/html \
  --with-sysroot=/ \
  --libdir=/usr/lib \
  --with-logfile=/var/log/lool/loolwsd.log \
  --disable-setcap \
  --disable-werror \
  --with-lo-path=/usr/lib/libreoffice \
  --disable-debug \
  --enable-ssl

  make build-nocheck -j"$(nproc)"
}

package() {
  cd "${srcdir}/online-cp-${pkgver}-${_rel}"
  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}"/var/log
  install -dm755 "${pkgdir}"/var/cache/lool
  install -dm750 "${pkgdir}"/var/lib/lool

  install -Dm644 sysconfig.loolwsd \
  "${pkgdir}/etc/conf.d/loolwsd"
  install -Dm644 "${srcdir}/loolwsd.service" \
  "${pkgdir}/usr/lib/systemd/system/loolwsd.service"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" \
  "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" \
  "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/loolwsd.pam.d" \
  "${pkgdir}/etc/pam.d/loolwsd"
  install -dm755 "${pkgdir}/etc/httpd/conf"
  mv "${pkgdir}/etc/apache2/conf-available" \
  "${pkgdir}/etc/httpd/conf/extra"
  rm -rf "${pkgdir}/etc/apache2"
}

sha512sums=('20cf3d95ca62ef5f3b14b919b14a53af145206dc637169cd46232df7e85d382f4fc65cf84faaeb1e89d3c97e8e5239b6abc7e4fe289d5d982add4c63e37f6506'
            'df03ce4ef23948e7fbb3cef7f6ea7c0b692cb0816370995051b7256a0b94ef288ca28157c3418ba235459902d2be2998e3742ef0e872a97952a9e380490d8d10'
            '61870a3fe597f37bbf0d8713f9a8c5af4ea9392a56afb065db6cda475755fca5c601922f03fe83443b49edf9d5eaebc7d7cf3bef499cda21e62dbbc5f6a768f7'
            '4292f1e750a0a1466a8b8cdd0ad03d0edc6c6c14e91c785880713b99d256ca779c4a63ad3c1a7439d21af3dae6fd79dc38e079316d3ba5caff454016b0aed759'
            '0847ec0e92841ef17303c90d00fd5364043c973d49d1b6070c184ae923cfe61a7355ad211f00654d27ca769def202b1024b48add0cd8f8c43203a4b2b116f9ef'
            '8a195f809b288b97bdf26a9bc578fdb2aa6a5b3f28c63aad81ca9741dac0ea51208e5145401b5e398c96fb3e6775de1cea450e55fd2dab43be184dd11a4f2c3d'
            '0dd767e95435f6c501e913d3cfc866f3f4f7160fe08cb406b7d5d7a07bc2a524a475828a34c5d68692ae954dd4f1affb689dacc95ede6d3561ef977553b0c3fc')
