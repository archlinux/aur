# Author: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname='dirvish'
pkgver=1.2.1
pkgrel=2
pkgdesc="Dirvish is a fast, disk based, rotating network backup system."
arch=('any')
url="http://www.dirvish.org/"
license=('OSLv2')
groups=()
depends=('perl' 'perl-time-parsedate' 'perl-time-period' 'rsync')
makedepends=('perl')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.dirvish.org/dirvish-${pkgver}.tgz")
noextract=()
sha256sums=('6b7f29c3541448db3d317607bda3eb9bac9fb3c51f970611ffe27e9d63507dcd')
_ddir="${pkgname}-${pkgver}"

EXECUTABLES="dirvish dirvish-runall dirvish-expire dirvish-locate"
MAN8PAGES="dirvish.8 dirvish-runall.8 dirvish-expire.8 dirvish-locate.8"
MAN5PAGES="dirvish.conf.5"

HEADER="#!/usr/bin/env perl

\$CONFDIR = \"/etc/dirvish\";

"

build() {
  # create executables
  for f in $EXECUTABLES; do
    echo "$HEADER" > "$f"
    cat "${srcdir}/${_ddir}/${f}.pl" >> "$f"
    cat "${srcdir}/${_ddir}/loadconfig.pl" >> "$f"
  done

  # compress manpages
  for f in $MAN8PAGES $MAN5PAGES; do
    gzip -cf "${srcdir}/${_ddir}/${f}" > "${f}.gz"
  done
}

package() {
  # install executables
  for f in $EXECUTABLES; do
    install -Dm755 "$f" "${pkgdir}/usr/bin/${f}"
  done

  # install manpages
  for f in $MAN8PAGES; do
    install -Dm644 "${f}.gz" "${pkgdir}/usr/share/man/man8/${f}.gz"
  done
  for f in $MAN5PAGES; do
    install -Dm644 "${f}.gz" "${pkgdir}/usr/share/man/man5/${f}.gz"
  done

  # create directory for configs
  install -Dm644 ../dirvish.conf "${pkgdir}/etc/dirvish/dirvish.conf"
}

# vim: set ts=2 sw=2 et :
