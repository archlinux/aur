## Contributor: nikicat <develniks at gmail dot com>
# Contributor: danilo <gezuru at gmail dot com>
# Contributor: Jason Begley <jayray at digitalgoat dot com>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>
# Contributor: Daniel Riedemann <daniel.riedemann [at] googlemail [dot] com>
# Contributor: 458italia <svenskaparadox [at] gmail dot com>
# Contributor: Thermi <noel [at] familie-kuntze dot com>
# Former maintainer: dkorzhevin <dkorzhevin at gmail dot com>
# Maintainer: Thermi <noel [at] familie-kuntze dot com>

pkgname=strongswan
pkgver=5.3.2
pkgrel=1
pkgdesc="open source IPsec implementation"
url='http://www.strongswan.org'
license=("GPL")
arch=('i686' 'x86_64')
depends=('curl' 'gmp' 'iproute2' 'openssl' 'sqlite')
conflicts=('openswan')
options=(!libtool)
backup=(etc/ipsec.conf etc/strongswan.conf)

source=("https://download.strongswan.org/strongswan-${pkgver}.tar.bz2")

# md5 is broken. We use sha256 now. Alternatively, we could check the signature of the file, but that
# doesn't yield any more security and just increases the work users initially have to invest.
sha256sums=('a4a9bc8c4e42bdc4366a87a05a02bf9f425169a7ab0c6f4482d347e44acbf225')

# We don't build libipsec because it would get loaded before kernel-netlink and netkey, which
# would case processing to be handled in user space. Also, the plugin is experimental. If you need it,
# add --enable-libipsec and --enable-kernel-libipsec

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --with-ipsecdir=/usr/lib/strongswan \
        --enable-sqlite \
        --enable-openssl --enable-curl \
        --enable-sql --enable-attr-sql \
        --enable-farp --enable-dhcp \
        --enable-eap-sim --enable-eap-sim-file --enable-eap-simaka-pseudonym \
        --enable-eap-simaka-reauth --enable-eap-identity --enable-eap-md5 \
        --enable-eap-gtc --enable-eap-aka --enable-eap-aka-3gpp2 \
        --enable-eap-mschapv2 --enable-eap-radius --enable-xauth-eap \
        --enable-ha --enable-vici --enable-swanctl --enable-systemd --enable-ext-auth \
        --disable-mysql --disable-ldap -enable-cmd --enable-forecast --enable-connmark \
	--enable-aesni
#	--enable-ruby-gems --enable-python-eggs
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

