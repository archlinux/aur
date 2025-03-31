#!/usr/bin/env bash
# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# General package information
pkgname=krack
pkgver=0.9
pkgrel=1
pkgdesc="Krathalan's packaging softwares"
url="https://codeberg.org/krathalan/krack"
license=("GPL3")
arch=("any")

# Files in /etc, keep these if the package upgrades!
backup=("etc/krack/build.conf" "etc/krack/receive.conf")

# Dependencies
depends=("brotli" "ccache" "devtools" "git" "gnupg" "rsync")
makedepends=("git" "scdoc")
conflicts=("krack-git")

# Download information
source=("${url}/archive/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/${pkgver}.tar.gz.sig")
sha256sums=("c6050c741890e5ace1098d9f4f52c13f27ad389b3abedeab6354c64f18901b3b"
            "c40375f4f4b2cad568c0c181444e6b6e3006697eff0a6f3cfca4655d94b9bf54")
validpgpkeys=("0C6B73F391FA26F0EBCD1F75C0F9AEE56E47D174")

build()
{
  # Generate man pages
  cd "${srcdir}/${pkgname}/man" || exit

  for manpage in ./*.scd; do
    scdoc < "${manpage}" > "${manpage%.scd}"
  done
}

package()
{
  cd "${srcdir}/${pkgname}" || exit

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
  install -D -m644 man/krack-receive.1 "${pkgdir}/usr/share/man/man1/krack-receive.1"
  install -D -m644 man/krack.1 "${pkgdir}/usr/share/man/man1/krack.1"
  install -D -m644 man/krackctl.1 "${pkgdir}/usr/share/man/man1/krackctl.1"

  # bash completion
  install -D -m644 bash-completion/krackctl "${pkgdir}/usr/share/bash-completion/completions/krackctl"

  # systemd services
  install -D -m644 lib/systemd/system/krack-build@.service "${pkgdir}/usr/lib/systemd/system/krack-build@.service"
  install -D -m644 lib/systemd/system/krack-build@.timer "${pkgdir}/usr/lib/systemd/system/krack-build@.timer"
  install -D -m644 lib/systemd/system/krack-receive.service "${pkgdir}/usr/lib/systemd/system/krack-receive.service"
}
