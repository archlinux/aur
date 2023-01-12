#!/usr/bin/env bash
# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# General package information
pkgname=krathalans-apparmor-profiles-git
pkgver=r664.5e51904
pkgrel=1
pkgdesc="Krathalan's apparmor profiles for desktop and server software (Firefox, nginx, postfix, and more)"
url="https://github.com/krathalan/apparmor-profiles"
license=("GPL3")
arch=("any")

# Dependencies
depends=()
makedepends=("git")

# Download information
source=("${pkgname}::git+${url}?signed" "99-apparmor-profiles.hook")
validpgpkeys=("0C6B73F391FA26F0EBCD1F75C0F9AEE56E47D174")
sha256sums=('SKIP' 'bab4b1f4f8be2588d81bcaafe7ec7da4dceef0e270e09a53de3e1fe2a57a98b2')

# https://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines#Git
pkgver() {
  cd "${srcdir}/${pkgname}" || exit

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -D -m644 99-apparmor-profiles.hook "${pkgdir}/usr/share/libalpm/hooks/99-apparmor-profiles.hook"

  cd "${srcdir}/${pkgname}" || exit
  install -D -m755 kapvc "${pkgdir}/usr/bin/kapvc"

  cd "profiles" || exit
  for profile in ./*; do
    if [[ "${profile}" == *"template" ]]; then
      continue
    fi

    install -D -m644 "${profile}" "${pkgdir}/etc/apparmor.d/${profile}"
  done

  cd "../abstractions" || exit
  for abstraction in ./*; do
    install -D -m644 "${abstraction}" "${pkgdir}/etc/apparmor.d/abstractions/${abstraction}"
  done
}
