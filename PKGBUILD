# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: sergej (https://aur.archlinux.org/account/sergej) (package `imaputils`)

_pkgname=imaputils
pkgname="${_pkgname}-git"
_oldpkgver=20191107 # This package was wrongly named `imaputils` despite that it is a git package. This is the last known version of the wrongly named one.
pkgver=r22.20240628.b210335
pkgrel=1
pkgdesc="perl script for managing/searching mail on an IMAP servers from the command line"
arch=(
  'any'
)
url="https://sourceforge.net/projects/imaputils/"
license=(
  'BSD-3-Clause'
)
depends=(
  'perl'
  'perl-mail-imapclient'
  'perl-datetime-format-mail'
  'perl-datetime'
  'perl-io-socket-ssl'
  'socat'
)
makedepends=(
  'git'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
replaces=(
  "${_pkgname}<=${_oldpkgver}" # This package was wrongly named `imaputils` despite that it is a git package. Replace the wrongly named one.
)
source=(
  "${_pkgname}::git://git.code.sf.net/p/imaputils/git"
)
sha256sums=('SKIP')

_extract_license() {
  # This extracts the license from the perl file. As argument, it takes the file to extract the license from. Result is written to stdout.
  _infile="$1"

  sed -En '1,$p;/^[^#]/q' "${_infile}" | grep -Ev -e '^#!' -e '^[^#]'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  sed -i 's|/etc/pki/ca-trust/extracted/pem|/etc/ca-certificates/extracted|g' imaputils.pl

  _extract_license imaputils.pl > "LICENSE.txt"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine git commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm0755 -t "$pkgdir/usr/bin" imaputils.pl
  ln -svr "$pkgdir/usr/bin/imaputils.pl" "$pkgdir/usr/bin/imaputils" # Since the old package `imaputils` has `/usr/bin/imaputils.pl`, we need to provide that to act as a drop-in replacement. But we also want the "clean" executable name `imaputils`.
  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README git.log
  install -Dvm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.txt"
}
