# Maintainer: Christian Pellegrin (chripell) <chripell@fsfe.org>
# Original Maintainer: An Nguyen (stk) <an@linux.com>
# Original Maintainer: George Angelopoulos <george@usermod.net>
# Original Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Original Maintainer: dront78 <dront78@gmail.com>
pkgname=systemtap
pkgver=4.6
pkgrel=1
pkgdesc="Infrastructure to simplify the gathering of information about the running Linux system"
url="http://sourceware.org/systemtap/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('elfutils' 'nss' 'python' 'cpio')
makedepends=('python-setuptools' 'python2-setuptools' 'xmlto')
optdepends=('sqlite3: for storing results in a database')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz.asc"
        "0001-Fix-Werror-for-wrong-type-of-printf-width.patch"
        "0002-configury-let-python3-be-python3.patch"
        )
sha512sums=('835b45597e9de0ea17857b47d542c87d155cb5c772f8595f41845a25ff06b862cb9c4b635292c3a6c66cb5255a07eee3af7cb7861110a4a05f545a4b35f11402'
            'SKIP'
            'da1b3d2319bfd711ba7e2e436cd476cbc7a63d442d8ad26fc010c219b9ca2343054a061767f0acc624620dc1eb3ca5a70ab130895181ed8e00c05b51ac651568'
            '26dc15751040ac444a74046cdb2f5cad456752f06d0916ef3f97e5faf98e1f382b638adb850ed98b287b72dea63c7a16c5ad98b9ad452da4042a1ae36260a54e')
install='systemtap.install'
# Note, you need to run:
# gpg --recv-keys  --keyserver hkps://keys.openpgp.org/ 0xD7C256443CC637CA
# unless /etc/pacman.d/gnupg/gpg.conf is updated.
validpgpkeys=('F75E6545B9F8AA15AA932A444DE16D68FDBFFFB8'   # "Serhei Makarov (for Red Hat 2018..onwards) <smakarov@redhat.com>" 
              '5D38116FA4D3A7CC77E378D37E83610126DCC2E8'
	      '159B0DF71150B8A8539A8802D7C256443CC637CA')

prepare() {
  cd "${pkgname}-${pkgver}"
  for i in  "${srcdir}"/*.patch; do
      patch -Np1 -i "$i"
  done
}

build() {
   cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/"${pkgname}" \
    --libdir=/usr/lib/"${pkgname}" \
    --mandir=/usr/share/man/ \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-pie \
    --disable-docs \
    --enable-htmldocs \
    --with-python3
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rmdir "${pkgdir}/var/run/stap-server/"
  rmdir "${pkgdir}/var/run/"
  rm -r "${pkgdir}/usr/include"
}
