# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=opendnssec
pkgver=2.1.14
pkgrel=2
pkgdesc="Turn-key solution for DNSSEC"
arch=('i686' 'x86_64')
url="http://www.opendnssec.org/"
license=('BSD')
groups=()
depends=('libxml2>=2.6.16' 'ldns>=1.6.16' 'sqlite3>=3.3.9')
makedepends=()
optdepends=('softhsm: key storage')
provides=()
conflicts=()
replaces=()
backup=("etc/opendnssec/conf.xml"
        "etc/opendnssec/kasp.xml"
        "etc/opendnssec/zonelist.xml")
options=()
install="opendnssec.install"
changelog=
source=("https://github.com/opendnssec/opendnssec/releases/download/${pkgver}/opendnssec-${pkgver}.tar.gz"
        "pid-path.patch"
        "2.0-migrator.patch"
        "compile.patch"
        "ods-signer.service"
        "ods-enforcer.service"
        "opendnssec.tmpfiles")
noextract=()

sha1sums=('02e9cb52452c010eff6c012b0844ee505aa20c87'
          '1fe209788587d2c8870939ef70be0ec51c170be7'
          '04e8bf7504cf728b2c3744d19295a63839dd61ca'
          'bab8a37412fa86e1fffb8f2889a63c86dc03bb69'
          '2a4fac3a16fea3f89b281f0933b6920524978d49'
          'fa28111fdce06c389813ff6ed2d4cae136252488'
          'f10d783b3e0232fd3beff645a07207c161371d0c')
sha256sums=('5a68d62ea0ea3a6c61e9f4946f462c7b907fbe6bccc9e8a721b7fe0f906f95d0'
            '45e2a55bd72cbf507787991f66f897f20903f0a538e68be789f480af3d73e409'
            '1a7f604364c050f7206ba893d109db5851c60cb5b000bd282ac55b81d8ff14ca'
            '32ce1ce254b4c5d9bb0f0a00359eedd65619d3df3ea0e6b9ca9c273476b924bb'
            '596d238ad219de1c88f79fd26a8b829250bf0512a308b34c11fd231d0b4eb0f4'
            '75cecbfb0ece13957a68a5bc39c20a1d69b95373e7473545d70621e1732733d8'
            '28a43d8d5ee512db5425c86bdba9c5832753dce0260291958b1b73253e3ebf55')

prepare()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  # /var/lib/run -> /var/run
  patch -p0 < "${srcdir}/pid-path.patch"

  # 1.4 -> 2.0 migrator
  patch -p0 < "${srcdir}/2.0-migrator.patch"

  # Compile error
  patch -p0 < "${srcdir}/compile.patch"

  aclocal
  autoconf
  automake --add-missing

  ./configure --prefix=/usr --datarootdir=/usr/share --localstatedir=/var/lib --sysconfdir=/etc --with-pkcs11-softhsm=/usr/lib/libsofthsm.so --sbindir=/usr/bin

  # Remove optional dependency on libbacktrace (incorrectly detected as present)
  sed -i /HAVE_BACKTRACE_FULL/d config.status

  # Create the correct (/var/run/opendnssec) directory
  sed -i \
  -e "s/\$(INSTALL) -d \$(DESTDIR)\$(localstatedir)\/run\/opendnssec/#Removed/" \
  -e "s/\$(INSTALL) -d \$(DESTDIR)\$(localstatedir)\/run/\$(INSTALL) -d \$(DESTDIR)\$(OPENDNSSEC_PID_DIR)/" \
  Makefile
}

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make CFLAGS='-D _XOPEN_SOURCE=600'
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm0644 "${srcdir}/ods-signer.service" \
        "${pkgdir}/usr/lib/systemd/system/ods-signer.service"
  install -Dm0644 "${srcdir}/ods-enforcer.service" \
        "${pkgdir}/usr/lib/systemd/system/ods-enforcer.service"
  install -Dm0644 "${srcdir}/opendnssec.tmpfiles" \
        "${pkgdir}/usr/lib/tmpfiles.d/opendnssec.conf"
  install -Dm0644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/opendnssec/LICENSE"

  # Migration scripts for 2.0
  cp -r "enforcer/utils/1.4-2.0_db_convert/" "${pkgdir}/usr/share/opendnssec/"
  install -Dm0644 "enforcer/src/db/schema.mysql" "${pkgdir}/usr/share/opendnssec/1.4-2.0_db_convert/schema.mysql"
  install -Dm0644 "enforcer/src/db/schema.sqlite" "${pkgdir}/usr/share/opendnssec/1.4-2.0_db_convert/schema.sqlite"

  chown 227:227 "${pkgdir}/etc/opendnssec" -R
  chown 227:227 "${pkgdir}/var/lib/opendnssec" -R

  chmod 750 "${pkgdir}/etc/opendnssec" \
            "${pkgdir}/var/lib/opendnssec"

  rm "${pkgdir}/run" -R
}
