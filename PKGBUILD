# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_pkgname=vsftpd
pkgname=vsftpd-git
pkgver=3.0.5
pkgrel=1
pkgdesc='Very Secure FTP daemon'
url='https://security.appspot.com/vsftpd.html'
arch=('x86_64')
license=('GPL2')
depends=('glibc' 'openssl' 'libcap' 'pam' 'libnsl')
optdepends=('logrotate')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/vsftpd.conf'
        'etc/xinetd.d/vsftpd'
        "etc/logrotate.d/vsftpd")
source=(https://security.appspot.com/downloads/"$_pkgname"-"$pkgver".tar.gz
        "$_pkgname"-"$pkgver".tar.gz.asc.gz::https://security.appspot.com/downloads/"$_pkgname"-"$pkgver".tar.gz.asc
        vsftpd-ssl.socket
        vsftpd.socket
        vsftpd.service
        vsftpd@.service
        vsftpd-ssl.service
        vsftpd-ssl@.service
        vsftpd-conf-pam.patch
        vsftpd-disable-anonymous-access-by-default.patch)
sha256sums=('26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736df1f278c70bc91d3'
            'SKIP'
            'd5185e48fffc6253499a55e0fe0f90a3424fc639640af11a9d38df33fb145afe'
            '9fdbfd2ec0207170371ca3cf2b0ddca2dc2fe3d062e5792e0d3e51474c3198c9'
            '0597e571718ba0f4dc4b32a4ddd148103758c48c7d65dcb8bbedafc9e810e83d'
            'd7b8e4827d4f6bafcbf52f9d2d7380958c7b08bb3f757806aa89d4bc06c9671c'
            'b88a50fc68b3bf746d13c9a777df77791cd3eac6eb7c2df655418071c2adf422'
            '4a55c2468b08d858f71bacf1f4885847bec8e548b0e92088068d9bdd3884af84'
            '751715726c4b888d5c96846ac0bd0d64238cceb28ef3c2ef447af85cdc2b79f1'
            '4baa5a2db122974fa2a9603d335aed59dee5ad4217615fbe247301d129281d20')
validpgpkeys=('67A2AB4F41F9972C21F6BF667B89011BCAE1CFEA') # Chris Evans

prepare() {
  cd -- "$_pkgname"-"$pkgver"
  # build-time config
  sed -e 's|^#undef VSF_BUILD_SSL$|#define VSF_BUILD_SSL|' -i builddefs.h
  sed -e 's|/usr/share/empty|/var/empty|g' -i tunables.c vsftpd.conf.5 INSTALL
  sed -e 's|/usr/local/sbin/vsftpd|/usr/bin/vsftpd|' -i EXAMPLE/INTERNET_SITE/"$_pkgname".xinetd

  # fix linking to openssl 1.1
  sed -e 's|SSL_library_init|SSL_CTX_new|' -i vsf_findlibs.sh

  patch -Np1 < ../vsftpd-conf-pam.patch
  patch -Np1 < ../vsftpd-disable-anonymous-access-by-default.patch
}

build() {
  cd -- "$_pkgname"-"$pkgver"
  make LINK='' CFLAGS="$CFLAGS $CPPFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd "$_pkgname"-"$pkgver"

  install -Dm 755 "$_pkgname" -t "$pkgdir"/usr/bin
  install -dm 755 "$pkgdir"/var/empty
  install -Dm 644 "$srcdir"/{*.service,*.socket} -t "$pkgdir"/usr/lib/systemd/system

  install -Dm 644 "$_pkgname".conf -t "$pkgdir"/etc
  install -Dm 644 EXAMPLE/INTERNET_SITE/"$_pkgname".xinetd "$pkgdir"/etc/xinetd.d/"$_pkgname"
  install -Dm 644 RedHat/vsftpd.log "$pkgdir"/etc/logrotate.d/"$_pkgname"
  install -Dm 644 RedHat/vsftpd.pam "$pkgdir"/etc/pam.d/"$_pkgname"
  # TODO: check pam /etc/ftpusers files from debian and redhat, its linked

  install -Dm 644 "$_pkgname".8 -t "$pkgdir"/usr/share/man/man8
  install -Dm 644 "$_pkgname".conf.5 -t "$pkgdir"/usr/share/man/man5
  install -Dm 644 BENCHMARKS BUGS Changelog FAQ INSTALL README README.ssl REFS \
    REWARD SPEED TODO TUNING -t "$pkgdir"/usr/share/doc/"$_pkgname"
}

# vim: ts=2 sw=2 et:
