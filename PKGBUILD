# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ultimate-ircd
pkgver=3.0.2
_commit=8d4bf332b4aeaba6c561437012c1ab0a3d1db512
pkgrel=12
pkgdesc="ultimate irc server"
arch=(x86_64)
url="https://github.com/J-Soft/UltimateIRCd"
license=("GPL")
depends=()
makedepends=('patch' 'git')
conflicts=(ircd)
provides=(ircd)
backup=()
install=ircd.install
source=(git://github.com/J-Soft/UltimateIRCd.git#commit=${_commit}
	ultimate-ircd.service
	ultimate-ircd.tmpfiles
	conf-fix.patch)
md5sums=('SKIP'
         '526fd78018b9b011787e4e9012437116'
         'e51723ab29e7a3ddc3589846815de0c9'
         '5e0f2a02e12675ac070a148c3234e111')

prepare() {
  cd "$srcdir"/UltimateIRCd
  sed -i 's|O_CREAT)|O_CREAT, 0644)|g' src/s_serv.c
}

build() {
  cd "$srcdir"/UltimateIRCd
  ./configure --prefix=/usr --enable-chinese-nick

  for i in `find -type f -name Makefile`; do
    echo Patching $i...
    sed -i "s#prefix		= /usr#prefix		= "$pkgdir"/usr#" $i
    sed -i "s#libexecdir	= \${bindir}#libexecdir	= "$pkgdir"/usr/lib/ircd#" $i
    sed -i "s#sysconfdir	= \${prefix}/etc#sysconfdir	= "$pkgdir"/etc/ircd#" $i
    sed -i "s#localstatedir	= \${prefix}#localstatedir	= "$pkgdir"/var#" $i
    sed -i "s#networksubdir   = \${prefix}/etc/networks#networksubdir   = "$pkgdir"/etc/ircd/networks#" $i
    sed -i "s#\$(localstatedir)/logs#\$(localstatedir)/log/ircd#" $i
  done

  cd include && patch -N <../../conf-fix.patch && cd ..
  make
}

package() {
  cd "$srcdir"/UltimateIRCd
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/var/log/ircd
  mkdir -p "$pkgdir"/etc/ircd/networks
  make install
  rm -f "$pkgdir"/usr/ircd
  rm -f "$pkgdir"/usr/kill
  rm -f "$pkgdir"/usr/rehash
  cd "$pkgdir"/usr/bin
  mv mkpasswd irc-mkpasswd
  mv ssl-cert.sh irc-ssl-cert.sh
  mv ssl-search.sh irc-ssl-search.sh
  install -d -m 0755 "$pkgdir"/var/lib/ircd
  install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -Dm0644 "$srcdir"/$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
}
