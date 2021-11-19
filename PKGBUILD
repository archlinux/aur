# Maintainer: rany at riseup dot net

pkgname=pissircd-git
pkgver=r9061.193da4738
pkgrel=5
pkgdesc="PissIRCd is an open source IRC server based on UnrealIRCd with Pissnet tweaks."
arch=('x86_64')
url="https://github.com/pissnet/pissircd"
license=('GPL2')
conflicts=('pissircd')
provides=('pissircd')
depends=('openssl' 'curl' 'c-ares' 'tre' 'pcre2' 'libnsl' 'argon2')
makedepends=('git')
backup=('etc/pissircd/unrealircd.conf')
install=pissircd.install
source=("git+https://github.com/pissnet/pissircd.git"
	pissircd.service
	pissircd.tmpfiles.d
	pissircd.sysusers.d
	install.pl)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "pissircd"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "pissircd"
  sed -i \
    -e 's|$(INSTALL) -m 0700|$(INSTALL) -m 0755|g' \
    -e 's|$(INSTALL) -m 0600|$(INSTALL) -m 0644|g' \
    Makefile.in
  sed -i \
    -e 's|@BINDIR@/unrealircd|@BINDIR@/pissircd|g' \
    -e 's|echo \"unrealircd|echo \"pissircd|g' \
    -e 's|UnrealIRCd|pissircd|g' \
    unrealircd.in
}

build() {
  cd "pissircd"
  ./autogen.sh
  ./configure \
    --with-pidfile=/run/pissircd/ircd.pid \
    --with-showlistmodes \
    --enable-ssl=/usr \
    --with-bindir=/usr/bin \
    --with-datadir=/var/lib/pissircd \
    --with-confdir=/etc/pissircd \
    --with-modulesdir=/usr/lib/pissircd \
    --with-logdir=/var/log/pissircd \
    --with-cachedir=/var/cache/pissircd \
    --with-docdir=/usr/share/doc/pissircd \
    --with-tmpdir=/tmp \
    --with-scriptdir=/usr \
    --with-nick-history=2000 \
    --with-sendq=3000000 \
    --with-permissions=0644 \
    --with-fd-setsize=1024 \
    --enable-dynamic-linking
  make
}

package() {
  cd "pissircd"

  export pkgdir
  mkdir -p "$pkgdir"/etc/pissircd/tls
  touch "$pkgdir"/etc/pissircd/tls/server.cert.pem
#  make INSTALL="$srcdir"/install.pl install DESTDIR="$pkgdir"
  make install DESTDIR="$pkgdir"
  mv "$pkgdir"/usr/unrealircd "$pkgdir"/etc/pissircd/pissircd
  cp "$pkgdir"/etc/pissircd/examples/example.conf "$pkgdir"/etc/pissircd/unrealircd.conf
  rm -rf "$pkgdir"/tmp "$pkgdir"/etc/pissircd/tls/server.cert.pem

  install -Dm0644 "$srcdir"/pissircd.service "$pkgdir"/usr/lib/systemd/system/pissircd.service
  install -Dm0644 "$srcdir"/pissircd.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/pissircd.conf
  install -Dm0644 "$srcdir"/pissircd.sysusers.d "$pkgdir"/usr/lib/sysusers.d/pissircd.conf

  mv "$pkgdir"/usr/bin/{unrealircd,pissircd}
  mv "$pkgdir"/usr/bin/{unrealircd,pissircd}-upgrade-script
}
