# Maintainer: Fixed Torres <aur_linuxero@outlook.com>
# Contributor: Fixed Torres <aur_linuxero@outlook.com>

pkgname=dnscrypt-proxy-git
_pkgname=dnscrypt-proxy
pkgver=1.9.4.2355.d6b61d9
pkgrel=1
pkgdesc="Is a protocol for securing communications between a client and a DNS resolver"
arch=('i686' 'x86_64')
url="http://dnscrypt.org/"
license=('custom:ISC')
depends=('libsodium' 'systemd' 'libtool' 'ldns')
options=(libtool)
conflicts=('dnscrypt-proxy')
backup=('etc/dnscrypt-proxy.conf')
install=dnscrypt-proxy-git.install
source=("${_pkgname}::git+https://github.com/jedisct1/dnscrypt-proxy.git")

pkgver() {
 cd ${_pkgname}
  echo "$(git describe --tags --abbrev=0).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
 cd ${srcdir}/${_pkgname}
  sed -e 's|^ExecStart=.*|ExecStart=/usr/bin/dnscrypt-proxy /etc/dnscrypt-proxy.conf|' \
         -i dnscrypt-proxy.service.in
  sed -e 's|python|python2|' -i contrib/generate-domains-blacklist.py
  sed -e 's|^PKG_DATA_DIR=.*|PKG_DATA_DIR="../.."|' \
         -i contrib/dnscrypt-update-resolvers.sh.in
}

build() {
 cd ${srcdir}/${_pkgname}
  ./autogen.sh --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --with-systemd
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --with-systemd
  make -j2
}

package() {
 cd ${srcdir}/${_pkgname}
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir"/{usr/share/{licenses,doc}/$_pkgname,usr/lib/systemd/system,usr/lib/${_pkgname}}
  install -dm755 "$pkgdir/usr/share/${_pkgname}/script"
  install -m 644 COPYING "$pkgdir"/usr/share/licenses/${_pkgname}
  install -m 644 AUTHORS NEWS README README.markdown "$pkgdir"/usr/share/doc/${_pkgname}
  install -m 644 dnscrypt-proxy.service.in "$pkgdir"/usr/lib/systemd/system/dnscrypt-proxy.service
  install -m 644 dnscrypt-proxy.socket "$pkgdir"/usr/lib/systemd/system

## Installing scripts to generate domains blacklist and update resolvers
 cd ${srcdir}/${_pkgname}/contrib/
  install -m 644 generate-domains-blacklist.py "$pkgdir/usr/share/${_pkgname}/script"
  install -m 644 domains-blacklist.conf "$pkgdir/usr/share/${_pkgname}/script"
  install -m 644 *.sh.in "$pkgdir/usr/share/${_pkgname}/script/dnscrypt-update-resolvers.sh"
  install -m 644 *.txt "$pkgdir/usr/share/${_pkgname}/script"

cat > "$pkgdir/usr/bin/dnscrypt-update-resolvers" << EOF
#!/bin/bash
cd /usr/share/dnscrypt-proxy/script && sh dnscrypt-update-resolvers.sh "\$@"
EOF

cat > "$pkgdir/usr/bin/dnscrypt-domains-blacklist" << EOF
#!/bin/bash
cd /usr/share/dnscrypt-proxy/script && python2 generate-domains-blacklist.py "\$@"
EOF
  
  chmod 755 "${pkgdir}/usr/bin/dnscrypt-update-resolvers"
  chmod 755 "${pkgdir}/usr/bin/dnscrypt-domains-blacklist"
}
sha512sums=('SKIP')
