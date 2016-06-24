# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='ovirt-guest-agent'
_mainver='1.0.12'
_subrel='1'
pkgver="${_mainver}.${_subrel}"
pkgrel='1'
pkgdesc='The oVirt Guest Agent'
arch=('x86_64')
url="http://wiki.ovirt.org/develop/developer-guide/vdsm/guest-agent"
depends=('systemd' 'python2' 'python2-dbus' 'python2-gobject2' 'dbus-glib' 'python2-ethtool' 'usermode')
makedepends=('pam' 'libtool' 'python2' 'python2-pep8' 'pep8')
license=('ASL 2.0')
install="${pkgname}.install"
source=("python2-arch.patch"
	"sysusers.conf"
	"${pkgname}.service"
	"https://evilissimo.fedorapeople.org/releases/${pkgname}/${_mainver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('95c162b584dd137296bcec70d14079d4b93d10d8542a87bd8f1cd6ad01e4b140'
            'fab3d62ecd8f6546d5b193f4ca22919de20451678b4cce2c53aa0977fed4f483'
            '545235630d6da51b547c1e8c177ddbf9f57aa81017b8683274a449d46e765cc4'
            '5d5eb817947604fecf1922109fb96b44cb1bbc616b6ca6feb468fb4a3604a433')
backup=("etc/${pkgname}.conf")

prepare() {
  pushd "${pkgname}-${pkgver}"
  patch -p1 -i ../python2-arch.patch

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
  popd
}

build() {
  pushd "${pkgname}-${pkgver}"
  make
  popd
}

package() {
  pushd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  libtool --finish ${pkgdir}/usr/lib/security
  popd
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -dm775 -o 175 -g 175 "${pkgdir}/var/log/${pkgname}"
}
