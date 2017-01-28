# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='ovirt-guest-agent'
_mainver='1.0.13'
_subrel=''
pkgver="${_mainver}${_subrel}"
pkgrel='1'
pkgdesc='The oVirt Guest Agent'
arch=('x86_64')
url="http://ovirt.org/develop/developer-guide/vdsm/guest-agent"
depends=('systemd' 'python2' 'python2-dbus' 'python2-gobject2' 'dbus-glib' 'python2-ethtool' 'usermode')
makedepends=('pam' 'libtool' 'python2' 'python2-pycodestyle' 'patch' 'autoconf')
license=('ASL 2.0')
install="${pkgname}.install"
source=("https://evilissimo.fedorapeople.org/releases/${pkgname}/${_mainver}/${pkgname}-${pkgver}.tar.bz2"
	"python2-arch.patch"
	"sysusers.conf"
	"${pkgname}.service")
sha256sums=('3b4d429d3e5ca1a369cc0868217910eadc70178156bb62e9d68cb1a9fde8afcc'
            '95c162b584dd137296bcec70d14079d4b93d10d8542a87bd8f1cd6ad01e4b140'
            'fab3d62ecd8f6546d5b193f4ca22919de20451678b4cce2c53aa0977fed4f483'
            '545235630d6da51b547c1e8c177ddbf9f57aa81017b8683274a449d46e765cc4')
backup=("etc/${pkgname}.conf")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/python2-arch.patch"
  autoreconf -fvi

  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --datarootdir=/usr/share \
    --datadir=/usr/share \
    --infodir=/usr/share/info \
    --includedir=/usr/include/security \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-pam-prefix=/etc \
    --without-gdm \
    --without-kdm \
    --enable-securedir=/usr/lib/security
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  libtool --finish ${pkgdir}/usr/lib/security
  install -Dm0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -dm0775 -o 175 -g 175 "${pkgdir}/var/log/${pkgname}"
}
