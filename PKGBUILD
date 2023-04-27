#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

pkgbase=dpkg-full
pkgname=(dpkg-full dpkg-docs update-alternatives)
_pkgname=dpkg
pkgver=1.21.21
pkgrel=2
pkgdesc="dpkg is Debian's package manager (low-level utility, does not include apt)"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/dpkg"
license=('GPL')
depends=('glibc' 'perl-io-string' 'perl-timedate' 'bzip2' 'perl' 'xz' 'zlib' 'libmd' 'doxygen')
optdepends=('libselinux: SELinux support'
            'start-stop-daemon: Debian'\''s daemon starter/stopper')
source=("http://deb.debian.org/debian/pool/main/$(head -c1 <<< $_pkgname)/${_pkgname}/${_pkgname}_${pkgver}.tar.xz")
b2sums=('e815770bf6b9fb3a9f918a1a41b5c088e2da8689ff62fdce977b15527d4d0d1eb3c508f3aba2e3f92f128fc13c5137d1b7b6a9ecfa0269055b26566422104b87')

CONFIGURE_ARGS+=(
    --prefix="/usr" \
    --bindir="/usr/bin" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --localstatedir="/var" \
    --runstatedir="/var/run" \
    --datadir="/usr/share/dpkg" \
)

prepare() {
  cd "$srcdir"
  rm -f $_pkgname
  ln -s $_pkgname-$pkgver $_pkgname

  cd "$srcdir/dpkg"

  [[ -f ./configure ]] || ./autogen

  export POD2MAN_FLAGS="-e stderr --utf-8"

  [[ -f Makefile ]] && make clean

  cd ../..
}

build() {
  cd "$srcdir/dpkg"
  ./configure "${CONFIGURE_ARGS[@]}" \
    --enable-dselect \
    --enable-start-stop-daemon \
    --enable-update-alternatives \
    --enable-devel-docs
  make
  make DESTDIR="$srcdir/temp-dpkg" install
}

package_dpkg-full() {
  provides=('dpkg')
  conflicts=('dpkg')
  pkgdesc="Debian package management system - binary utilities"

  cp -r "$srcdir/temp-dpkg/"* "$pkgdir"

  # Remove files that should not be in this subpackage
  rm "$pkgdir/usr/bin/update-alternatives"
  rm "$pkgdir/usr/bin/start-stop-daemon"
  rm "$pkgdir/etc/alternatives/README"
  rm -r "$pkgdir/usr/share/"{doc,man}
  rm -r "$pkgdir/var/lib/dpkg/alternatives"
}

package_dpkg-docs() {
  pkgdesc="Debian package management system - documentation"

  # Copy only the documentation
  mkdir -p "$pkgdir/usr/share/doc" "$pkgdir/usr/share/man"
  cd "$srcdir/dpkg"
  doxygen doc/Doxyfile.in
  cd ../..
  cp -r "${srcdir}"/temp-dpkg/usr/share/man "$pkgdir"/usr/share
  cp -r "${srcdir}"/temp-dpkg/usr/share/doc "$pkgdir"/usr/share
}

package_update-alternatives() {
  pkgdesc="Debian's alternatives management system"
  provides=(alternatives)
  conflicts=(alternatives)

  # Copy only the update-alternatives utility
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/etc/alternatives" "$pkgdir/var/lib/dpkg"
  install -m755 "${srcdir}/temp-dpkg/usr/bin/update-alternatives" "$pkgdir/usr/bin/update-alternatives"
  install -m644 "${srcdir}/temp-dpkg/etc/alternatives/README" "$pkgdir/etc/alternatives/README"
  install -d -m755 "$srcdir/temp-dpkg/var/lib/dpkg/alternatives" "$pkgdir/var/lib/dpkg/alternatives"
}

pkgver() {
  echo $pkgver
}

# vim: sw=2 ts=2 et syntax=bash
