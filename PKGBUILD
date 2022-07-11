# Maintainer: Christian Pellegrin (chripell) <chripell@fsfe.org>
# Original Maintainer: An Nguyen (stk) <an@linux.com>
# Original Maintainer: George Angelopoulos <george@usermod.net>
# Original Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Original Maintainer: dront78 <dront78@gmail.com>
pkgname=systemtap
pkgver=4.7
pkgrel=1
pkgdesc="Infrastructure to simplify the gathering of information about the running Linux system"
url="http://sourceware.org/systemtap/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('elfutils' 'nss' 'python' 'cpio')
makedepends=('python-setuptools' 'python2-setuptools' 'xmlto')
optdepends=('sqlite3: for storing results in a database')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz.sig"
        )
sha512sums=('7d7c213dc4f7c5430f81763668da21403fbc351d1701b1096eb1ad233e3f0325e35f01dfd0a33e75f277b26fdde88c46d42dd32e32e4d4f27a45d53e2dd0f831'
            'SKIP')
install='systemtap.install'
# Note, you need to run:
# gpg --recv-keys  --keyserver hkps://keys.openpgp.org/ 0xD7C256443CC637CA
# unless /etc/pacman.d/gnupg/gpg.conf is updated.
validpgpkeys=('F75E6545B9F8AA15AA932A444DE16D68FDBFFFB8'   # "Serhei Makarov (for Red Hat 2018..onwards) <smakarov@redhat.com>" 
              '5D38116FA4D3A7CC77E378D37E83610126DCC2E8'
	      '159B0DF71150B8A8539A8802D7C256443CC637CA')

prepare() {
  cd "${pkgname}-${pkgver}"
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
