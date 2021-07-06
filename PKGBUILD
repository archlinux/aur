# Maintainer: Christian Pellegrin (chripell) <chripell@fsfe.org>
# Original Maintainer: An Nguyen (stk) <an@linux.com>
# Original Maintainer: George Angelopoulos <george@usermod.net>
# Original Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Original Maintainer: dront78 <dront78@gmail.com>
pkgname=systemtap
pkgver=4.5
pkgrel=1
pkgdesc="Infrastructure to simplify the gathering of information about the running Linux system"
url="http://sourceware.org/systemtap/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('elfutils' 'nss' 'python' 'cpio')
makedepends=('python-setuptools' 'xmlto')
optdepends=('sqlite3: for storing results in a database')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz.asc"
        )
sha512sums=('8136779a9f5cb0fbaae565eab1ab6fa307f1024dfc2c6c3845acfadff0eecc684ba89aa5d442c7b90c2c73edaab41ca07bae2bad8361f80fe8e9928b40466cd3'
            'SKIP')
install='systemtap.install'
# Note, you need to run:
# gpg --recv-keys  --keyserver hkps://keys.openpgp.org/ 0xD7C256443CC637CA
# unless /etc/pacman.d/gnupg/gpg.conf is updated.
validpgpkeys=('F75E6545B9F8AA15AA932A444DE16D68FDBFFFB8'   # "Serhei Makarov (for Red Hat 2018..onwards) <smakarov@redhat.com>" 
              '5D38116FA4D3A7CC77E378D37E83610126DCC2E8'
	      '159B0DF71150B8A8539A8802D7C256443CC637CA')
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
    --enable-htmldocs
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rmdir "${pkgdir}/var/run/stap-server/"
  rmdir "${pkgdir}/var/run/"
  rm -r "${pkgdir}/usr/include"
}
