# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Valere Monseur <valere_monseur@hotmail.com>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=iptrafvol
_pkgname=iptrafficvolume
pkgver=0.3.4
pkgrel=4
pkgdesc="IP traffic volume logger using iptables"
arch=('i686' 'x86_64')
url="http://iptrafficvolume.sourceforge.net/"
license=('GPL')
depends=('iptables' 'perl')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz"
        'fix-pod.patch')
md5sums=('21d96650dd6452792ad47a5636954053'
         '4201e99e219f92ec7b5147c65c09fda9')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch < $srcdir/fix-pod.patch
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # generate man page
  pod2man iptrafvol.pl > iptrafvol.1
  gzip --force iptrafvol.1

  # install directories
  install -d ${pkgdir}/var/log/iptrafvol

  # install files
  install -D -m755 iptrafvol.pl ${pkgdir}/usr/sbin/iptrafvol.pl
  install -D -m644 iptrafvol.cgi ${pkgdir}/usr/share/${pkgname}/iptrafvol.cgi
  install -D -m644 orange.css ${pkgdir}/usr/share/${pkgname}/orange.css
  install -D -m644 Examples/iptrafvol_cron.d ${pkgdir}/usr/share/${pkgname}/iptrafvol_cron.d
  install -D -m644 Examples/iptrafvol_init.d ${pkgdir}/usr/share/${pkgname}/iptrafvol_init.d
  install -D -m644 iptrafvol.1.gz ${pkgdir}/usr/share/man/man1/iptrafvol.1.gz
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # adapt config to suits arch
  sed \
    -e 's|/sbin/iptables|/usr/sbin/iptables|' \
    -i "$pkgdir"/usr/sbin/iptrafvol.pl

  sed \
    -e 's|/usr/local/sbin/iptrafvol.pl|/usr/sbin/iptrafvol.pl|' \
    -i "$pkgdir"/usr/share/${pkgname}/iptrafvol.cgi \
    -i "$pkgdir"/usr/share/${pkgname}/iptrafvol_cron.d
}
