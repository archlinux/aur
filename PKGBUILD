#!/usr/bin/env bash
# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# General package information
pkgname=krack
pkgver=0.1.0
pkgrel=3
pkgdesc="Krathalan's packaging softwares"
url="https://git.sr.ht/~krathalan/krack"
license=("GPL3")
arch=("any")

# Files in /etc, keep these if the package upgrades!
backup=("etc/krack/build.conf" "etc/krack/receive.conf")

# Dependencies
depends=("ccache" "devtools" "git" "gnupg" "rsync")
makedepends=("git" "scdoc")
conflicts=("krack-git")

# Download information
_packagesig="${url}/blob/master/signatures/${pkgver}.tar.gz.sig"
source=("${url}/archive/${pkgver}.tar.gz" "${_packagesig}")
sha512sums=("407e17e8a941b1836c57ee73c029876c1001d3b6d507dd88fe42bb955900d1c46283735136222d5076115f0c666f287d04ac03e2ccb9ce07bdd1d6013c86d4e7" "1a76b616f4e44f931ad4001b9604d1beec6a9b4e8cba6d5d6ef8fa71b33131f24248d16315a075a1d771db1e28e1200ba4ec09896bd3ecb503dcd87061396e62")

build()
{
  # "Build" man pages
  cd "${srcdir}/${pkgname}-${pkgver}/man" || exit

  for manpage in ./*.scd; do
    scdoc < "${manpage}" > "${manpage%.scd}"
  done
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}" || exit

  install -D -m644 etc/build.conf "${pkgdir}/etc/krack/build.conf"
  install -D -m644 etc/receive.conf "${pkgdir}/etc/krack/receive.conf"

  install -D -m755 bin/krack-build "${pkgdir}/usr/bin/krack-build"
  install -D -m755 bin/krackctl "${pkgdir}/usr/bin/krackctl"

  install -D -m755 lib/build "${pkgdir}/usr/lib/krack/build"
  install -D -m755 lib/common "${pkgdir}/usr/lib/krack/common"
  install -D -m644 lib/honey "${pkgdir}/usr/lib/krack/honey"
  install -D -m755 lib/receive "${pkgdir}/usr/lib/krack/receive"

  install -D -m644 man/krack-build.1 "${pkgdir}/usr/share/man/man1/krack-build.1"
  install -D -m644 man/krack.1 "${pkgdir}/usr/share/man/man1/krack.1"
  install -D -m644 man/krackctl.1 "${pkgdir}/usr/share/man/man1/krackctl.1"

  install -D -m644 lib/systemd/system/krack-receive.service "${pkgdir}/usr/lib/systemd/system/krack-receive.service"
}
