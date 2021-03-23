#!/usr/bin/env bash
# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# General package information
pkgname=krack
pkgver=0.2.0
pkgrel=2
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
validpgpkeys=("B46B326273E4A1D21AAA3F6F529AC10050BD24EF")
sha512sums=("f4210026344a56e3bc8d937ae3ad8b5c86fc86c05053528e74ae0e95492032fca2be4f3d9ab9c98967871014c26d7850800b09551a5840e5d4b7aec8b3e5f06d" "188468db09fef2550668dbd67d036e3836cbaa728eb7741a4b5a5eabc3b8cecac75d6c52875f1974570e38c4dfa5328b87940b512a36b1a63737e75a501db75f")

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

  # /etc conf
  install -D -m644 etc/build.conf "${pkgdir}/etc/krack/build.conf"
  install -D -m644 etc/receive.conf "${pkgdir}/etc/krack/receive.conf"

  # bin
  install -D -m755 bin/krack-build "${pkgdir}/usr/bin/krack-build"
  install -D -m755 bin/krackctl "${pkgdir}/usr/bin/krackctl"

  # lib
  install -D -m755 lib/build "${pkgdir}/usr/lib/krack/build"
  install -D -m755 lib/common "${pkgdir}/usr/lib/krack/common"
  install -D -m755 lib/receive "${pkgdir}/usr/lib/krack/receive"

  # man
  install -D -m644 man/krack-build.1 "${pkgdir}/usr/share/man/man1/krack-build.1"
  install -D -m644 man/krack.1 "${pkgdir}/usr/share/man/man1/krack.1"
  install -D -m644 man/krackctl.1 "${pkgdir}/usr/share/man/man1/krackctl.1"

  # bash completion
  install -D -m644 bash-completion/krackctl "${pkgdir}/usr/share/bash-completion/completions/krackctl"

  # systemd service
  install -D -m644 lib/systemd/system/krack-receive.service "${pkgdir}/usr/lib/systemd/system/krack-receive.service"
}
