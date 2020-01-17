# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=libreoffice-online
pkgver=6.2.3.2
pkgrel=2
pkgdesc="HTML5-based/cloud-based version of the office suite"
arch=('x86_64')
url="https://www.libreoffice.org/download/libreoffice-online/"
license=("MPL")
makedepends=("cppunit" "git" "libreoffice-fresh-sdk>=6.2" "nodejs" "npm" "poco" "python-polib")
depends=("poco" "libreoffice" "cpio")
backup=("etc/libreoffice-online/loolwsd.xml")
source=("${pkgname}::git+https://git.libreoffice.org/online#tag=libreoffice-${pkgver}"
        "disable-fc-cache.patch"
        "loolwsd-config.patch"
        "loolwsd.service"
        "libreoffice-online.install"
        "libreoffice-online.sysusers"
        "libreoffice-online.tmpfiles")

sha512sums=('SKIP'
            'a7bf2f594be83cee242ca1172edb0f5de33640beee58eef71e1dd476a4b0efafe565e6816f034a91022c415a0755e3a553bc260fc8648163ad6f7a355f996054'
            '5a3abbfea165527ec97e469e588de77772f138bdb566a4fc69c58999401af0b7569854e35e02dbd27c64ad7f22eaa7a7ecedda0967eb879ca0236f68dd1ddb9c'
            '76ec4fe0bfc8d856dc82c3fc993b612b9dd0ad7399bf733d4d4afe89ce393f3651c9734fef044ec4e80f3d2c20d94fe8b68cd6a23dfa3dbd267697b04e9ca73e'
            '76f6487fedc801e054d75a52fc5204048d4260adf30033d7a38963296cdf7b68255ddfa3aada842340c18f26ae49d7be1551930a714d8ad7c082fdf4640ef3ce'
            'b85929da722e548f5c970c7a15a09d42c7e6b1aceeb4ad6138ade31888a2261155d6f5a187acb930c79ec00988531a3828e983c6b9ed3bd5a42ad62f5ff3b0d2'
            '7764aa3c62ea4fba492a32135c2a1ddbc1686e0e3665c839d40ffbcba7a7a4a3481b54ee5c6640a71de74ecd7a0f6f5f228f9d08f3a82b1b8aca121f4dbd1dc7')

install=libreoffice-online.install

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 < "${srcdir}/disable-fc-cache.patch"
  patch -p1 < "${srcdir}/loolwsd-config.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh

  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --datadir=/usr/share \
      --sysconfdir=/etc \
      --localstatedir=/var/lib \
      --disable-dependency-tracking \
      --disable-silent-rules \
      --docdir=/usr/share/doc/libreoffice-online \
      --htmldir=/usr/share/doc/libreoffice-online/html \
      --with-sysroot=/ \
      --libdir=/usr/lib64 \
      --with-logfile=/var/log/libreoffice-online/loolwsd.log \
      --disable-setcap \
      --disable-werror \
      --enable-anonymize-usernames \
      --enable-anonymize-filenames

      make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR=${pkgdir} install
  mkdir -p "${pkgdir}/var/log" "${pkgdir}"/var/lib/{,cache}/libreoffice-online

  install -Dm644 "${srcdir}/loolwsd.service"     "${pkgdir}/usr/lib/systemd/system/loolwsd.service"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
