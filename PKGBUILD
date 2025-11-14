# Maintainer:
# Contributor: twa022 <twa022 at gmail dot com>

: ${_pkgtype=-dev-bin}
: ${_pkgnamefmt:=LibreOffice}

_pkgname="libreoffice"
pkgname="${_pkgname}${_pkgtype:-}"
pkgdesc="A free and powerful office suite - development branch"
pkgver=25.8.3.2
pkgrel=1
url="https://www.libreoffice.org/"
license=('MPL-2.0' 'LGPL-3.0-or-later')
arch=('x86_64')

optdepends=(
  'coin-or-mp: required by the Calc solver'
  'gst-plugins-base-libs: for multimedia content'
  'gtk3: for GTK3 integration'
  'java-environment: required by extension-wiki-publisher and extension-nlpsolver'
  'java-runtime: adds java support'
  'qt5-base: for Qt5 desktop integration'
)

provides=(
  'libreoffice'
  'libreoffice-en-US'
)

options=("!strip" "!debug")

_dl_url="https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64"

source=("$_dl_url/${_pkgnamefmt}_${pkgver}_Linux_x86-64_rpm.tar.gz"{,.asc})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=(
  C2839ECAD9408FBE9531C3E9F434A1EFAFEEAEA3 # LibreOffice Build Team (CODE SIGNING KEY) <build@documentfoundation.org>
)

package() {
  depends+=(
    'dbus'
    'glib2'
    'hicolor-icon-theme'
    'libxml2-legacy'
  )

  # extract
  find "$srcdir/${_pkgnamefmt}_${pkgver}"*/RPMS/*rpm -exec bsdtar -x -f '{}' -C "$pkgdir" \;

  # replace symlink with script
  local _lo_ver=$(sed -E -e 's&^([0-9]+\.[0-9]+).*$&\1&' <<< "$pkgver")
  rm -f "$pkgdir/usr/bin/libreoffice${_lo_ver}"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/libreoffice${_lo_ver}" << END
#!/usr/bin/env sh
export PATH="/opt/libreoffice${_lo_ver}/program:\$PATH"
exec /opt/libreoffice${_lo_ver}/program/soffice "\$@"
END

  # permissions
  find "$pkgdir/" -name "*.so" -exec chmod ugo-x {} \;
  find "$pkgdir/" -name "*.so.[0-9]*" -exec chmod ugo-x {} \;
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
