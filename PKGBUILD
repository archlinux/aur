# Maintainer: Remi Gacogne <rgacogne-arch at archlinux dot org>
pkgname=powerdns-recursor-git
pkgver=5.4.0alpha1.r12.g226f721d9
pkgrel=1
pkgdesc='Resolving DNS server'
arch=('x86_64')
url='https://www.powerdns.com/'
license=('GPL-2.0-only')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns"
        sysusers.conf)
sha512sums=('SKIP'
            '63b3f0664d38fbbcb6b1c914cee050a27eca0a15550962973743580dd5d3ace2e68272ca2d856d53cc74001fe9246d61207ebbc74524c096736777ed08c88e72')
makedepends=('boost' 'git' 'meson' 'pandoc' 'python' 'python-virtualenv' 'python-yaml' 'ragel' 'rust' 'systemd')
depends=('gcc-libs' 'boost-libs' 'fstrm' 'gnutls' 'libboost_context.so' 'libcap' 'libcurl.so' 'libsodium' 'systemd-libs' 'luajit' 'net-snmp' 'openssl')
provides=('powerdns-recursor')
conflicts=('powerdns-recursor')
backup=('etc/powerdns/recursor.conf')
options=(!lto)

pkgver() {
  cd "${pkgname}"
  git describe --tags --match 'rec-*' | sed 's/rec-//;s/.\(\(rc\|alpha\|beta\)\d*\)/\1/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}/pdns/recursordist"
  meson setup build \
    --prefix        /usr \
    --libexecdir    lib \
    --sbindir       bin \
    --sysconfdir    /etc/powerdns \
    --auto-features enabled \
    --wrap-mode     nodownload \
    -Ddebug=true \
    -Dhardening-fortify-source=disabled \
    -Doptimization=2 \
    -Db_lto=true \
    -Db_pie=true \
    -Dauto-var-init=zero \
    -Ddns-over-tls=enabled \
    -Dreproducible=true \
    -Dsigners-libsodium=enabled \
    -Dsnmp=enabled \
    -Dsystemd-service=enabled \
    -Dunit-tests=true \
    -Dsigners-libcrypto-path=/usr # workaround for https://github.com/PowerDNS/pdns/issues/14084
  meson compile -C build
}

check() {
  cd "${pkgname}/pdns/recursordist/"
  meson test -C build
}

package() {
  cd "${pkgname}/pdns/recursordist/"
  meson install -C build --destdir "$pkgdir"

  mv "${pkgdir}/etc/powerdns/recursor.yml-dist" "${pkgdir}/etc/powerdns/recursor.conf"
  install -Dm 644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/powerdns-recursor.conf"
}

# vim: ts=2 sw=2 et:
