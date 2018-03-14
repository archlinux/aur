# Maintainer: Petko Bordjukov <bordjukov@gmail.com>

_pkgname=wireless-regdb
pkgname=$_pkgname-git
pkgver=20171223.1c1aec3
pkgrel=1
pkgdesc="Central Regulatory Domain Database"
arch=('any')
url="http://wireless.kernel.org/en/developers/Regulatory"
backup=(etc/conf.d/wireless-regdom)
license=('custom')
depends=('sh')
makedepends=('crda>=r282')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=wireless-regdb.install
source=($_pkgname::git+https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git
        crda.conf.d)
sha256sums=('SKIP'
            '192428fd959806705356107bffc97b8b379854e79bd013c4ee140e5202326e2b')

pkgver() {
  # Mimics ABS pkgver described like this:
  # Commit date + git rev-parse --short origin/master
  cd ${_pkgname}
  (
  git show --format='%cI' -q master | sed 's/T.*//g;s/-//g'
  echo .
  git rev-parse --short master
  ) | tr -d '\n'
}

package() {
  # Install and verify regulatory.bin file
  msg "Installing and verifying the regulatory.bin file ..."
  install -D -m644 "${srcdir}"/${_pkgname}/regulatory.bin "${pkgdir}"/usr/lib/crda/regulatory.bin
  # This creates a depend/makedepend loop:
  # crda depends on wireless-regdb (but strictly doesn't makedepend on it)
  # wireless-regdb makedepends on crda
  if /usr/bin/regdbdump "${pkgdir}"/usr/lib/crda/regulatory.bin > /dev/null; then
    msg "Regulatory database verification was succesful."
  else
    error "Regulatory database verification failed."
    return 1
  fi
  install -D -m644 "${srcdir}"/${_pkgname}/sforshee.key.pub.pem "${pkgdir}"/usr/lib/crda/pubkeys/sforshee.key.pub.pem
  install -D -m644 "${srcdir}"/${_pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/wireless-regdb/LICENSE
  install -D -m644 "${srcdir}"/${_pkgname}/regulatory.bin.5 "${pkgdir}"/usr/share/man/man5/regulatory.bin.5
  install -D -m644 "${srcdir}"/${_pkgname}/regulatory.db "${pkgdir}"/usr/lib/firmware/regulatory.db
  install -D -m644 "${srcdir}"/${_pkgname}/regulatory.db.p7s "${pkgdir}"/usr/lib/firmware/regulatory.db.p7s
  install -D -m644 "${srcdir}"/${_pkgname}/regulatory.db.5 "${pkgdir}"/usr/share/man/man5/regulatory.db.5

  msg "Installing /etc/conf.d/wireless-regdom ..."
  install -D -m644 "${srcdir}"/crda.conf.d "${pkgdir}"/etc/conf.d/wireless-regdom
  for dom in $(grep ^country "${srcdir}"/${_pkgname}/db.txt | cut -d' ' -f2 | sed 's|:||g'); do
    echo "#WIRELESS_REGDOM=\"${dom}\"" >> "${pkgdir}"/etc/conf.d/wireless-regdom.tmp
  done
  sort -u "${pkgdir}"/etc/conf.d/wireless-regdom.tmp >> "${pkgdir}"/etc/conf.d/wireless-regdom
  rm "${pkgdir}"/etc/conf.d/wireless-regdom.tmp

  install -D -m644 "${srcdir}"/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
