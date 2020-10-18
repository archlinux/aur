# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: robertfoster
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=libreoffice-online
pkgver=7.0.1.1
pkgrel=1
pkgdesc="HTML5-based/cloud-based version of the office suite"
arch=('x86_64')
url="https://www.libreoffice.org/download/libreoffice-online/"
license=("MPL")
makedepends=("cppunit" "git" "libreoffice-fresh-sdk" "nodejs" "npm" "openssl" "poco" "python-polib")
depends=("poco" "libreoffice-fresh" "cpio")
backup=("etc/libreoffice-online/loolwsd.xml")
source=("${pkgname}::git+https://github.com/LibreOffice/online#tag=libreoffice-${pkgver}"
  "disable-fc-cache.patch"
  "loolwsd-config.patch"
  "loolwsd.service"
  "libreoffice-online.install"
  "libreoffice-online.sysusers"
  "libreoffice-online.tmpfiles")

sha512sums=('SKIP'
            'f7a63c32480b71258bad023095cfaa58baf1477acdcda76fd54e63e33caccb071749cdf577af12a9d4c95a3cd22e5e98ad4e12531307d860322b84e5d8973f92'
            '4b2c91f4cdd27faa6d19683872baac1fac13d85d109b5d7c5be7116ecfeeab2e94bc67f1a02e0f108cdc18777cf9facd0e3c55186615cd5658f7723cdc57bf44'
            '285071cc43da05a1065434078f8fd1d8046ca3deed6e25ddcbead714665940c1c0033559b6b938430878420a564de3927f10f975ac066a6c94a0d5609b8523aa'
            '00002d191aee329197b2a5b82b603e5af7d6e57194d9f4b06f1b5d85c84fca760ae7af19e5e3e67801ec48194d8a8a52163de3e7f6ec09659cd0fa3219e55d81'
            'b85929da722e548f5c970c7a15a09d42c7e6b1aceeb4ad6138ade31888a2261155d6f5a187acb930c79ec00988531a3828e983c6b9ed3bd5a42ad62f5ff3b0d2'
            '7764aa3c62ea4fba492a32135c2a1ddbc1686e0e3665c839d40ffbcba7a7a4a3481b54ee5c6640a71de74ecd7a0f6f5f228f9d08f3a82b1b8aca121f4dbd1dc7')

install=libreoffice-online.install

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 <"${srcdir}/disable-fc-cache.patch"
  patch -p1 <"${srcdir}/loolwsd-config.patch"
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
    --libdir=/usr/lib \
    --with-logfile=/var/log/libreoffice-online/loolwsd.log \
    --disable-setcap \
    --disable-werror \
    --with-lo-path=/usr/lib/libreoffice \
    --disable-debug \
    --enable-ssl

  make build-nocheck -j"$(nproc)"
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/var/log" "${pkgdir}"/var/lib/{,cache}/libreoffice-online

  install -Dm644 "${srcdir}/loolwsd.service" "${pkgdir}/usr/lib/systemd/system/loolwsd.service"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
