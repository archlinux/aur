# Maintainer: Hunter Wittenborn: <hunter@hunterwittenborn.com>
_release_type=alpha

pkgname=makedeb-alpha
pkgver=7.1.0
pkgrel=1
pkgdesc="The modern packaging tool for Debian archives (${_release_type} release)"
arch=('any')
license=('GPL3')
depends=('tar' 'binutils' 'lsb-release' 'dpkg' 'asciidoctor' 'makedeb-makepkg-alpha')
makedepends=('git')
conflicts=('makedeb' 'makedeb-beta')
url="https://github.com/makedeb/makedeb"

source=("git+${url}/#tag=v${pkgver}-${_release_type}")
sha256sums=('SKIP')

prepare() {
  cd makedeb/

  # Set package version, release type, and target OS
  sed -i "s|makedeb_package_version=.*|makedeb_package_version=${pkgver}-${pkgrel}|"  src/makedeb.sh
  sed -i "s|makedeb_release_type=.*|makedeb_release_type=${_release_type}|" src/makedeb.sh
  sed -i 's|target_os="debian"|target_os="arch"|' src/makedeb.sh

  # Remove testing commands
  sed -i 's|.*# REMOVE AT PACKAGING||g' src/makedeb.sh
}

package() {
  # Create single file for makedeb
  mkdir -p "${pkgdir}/usr/bin"
  cd makedeb/

  # Add bash shebang
  echo '#!/usr/bin/env bash' > "${pkgdir}/usr/bin/makedeb"

  # Copy functions
  for i in $(find "src/functions/"); do
    if ! [[ -d "${i}" ]]; then
      cat "${i}" >> "${pkgdir}/usr/bin/makedeb"
    fi
  done

  cat "src/makedeb.sh" >> "${pkgdir}/usr/bin/makedeb"
  chmod 555 "${pkgdir}/usr/bin/makedeb"

  # Set up man pages
  SOURCE_DATE_EPOCH="$(git log -1 --pretty='%ct' man/makedeb.8.adoc)" \
    asciidoctor -b manpage man/makedeb.8.adoc \
                -o "${pkgdir}/usr/share/man/man8/makedeb.8"

  SOURCE_DATE_EPOCH="$(git log -1 --pretty='%ct' man/pkgbuild.5.adoc)" \
    asciidoctor -b manpage man/pkgbuild.5.adoc \
                -o "${pkgdir}/usr/share/man/man5/pkgbuild.5"
}
