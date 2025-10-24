# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=kforth-64
pkgver=0.5.1
pkgrel=1
pkgdesc="64-bit Forth System for GNU/Linux"
arch=( $CARCH )
url="https://github.com/mynenik/kforth-64"
license=('AGPL-3.0-or-later')
depends=('bash' 'ncurses' 'gcc-libs' 'glibc' 'readline')
makedepends=()
provides=('kforth-64')
conflicts=('kforth-64')
replaces=()
backup=()
options=(!debug)
source=( https://github.com/mynenik/kForth-64/archive/refs/tags/v0.5.1/kForth-64-0.5.1.tar.gz )
noextract=()
sha256sums=( 38721240e41317e61a5c8ce106b92e26db10523229f931cc7e7500de32cf1c09 )

prepare() {
  mv "kForth-64-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}/src"
  make
}

package() {
  cd "${pkgname}-${pkgver}/src"
  install -Dsv -m 0755 kforth64 "${pkgdir}/usr/bin/kforth64"
  mkdir -p "${pkgdir}/usr/share/kForth-64"
  cd ../forth-src
  cp -avxu * "${pkgdir}/usr/share/kForth-64"
  cd ../doc
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"
  cp *.* "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/etc/profile.d"
  cat <<EOF >"${pkgdir}/etc/profile.d/kForth-64.sh"
#!/bin/sh
export KFORTH_DIR=/usr/share/kForth-64
EOF
  chmod 0755 "${pkgdir}/etc/profile.d/kForth-64.sh"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/${pkgname}-${pkgver}/kforth.xpm" "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/applications"
  cat << EOF > "${pkgdir}/usr/share/applications/kForth-64.desktop"
[Desktop Entry]
Name=kForth-64
Comment=64-bit Forth System for GNU/Linux
Exec=/usr/bin/kforth64
Icon=/usr/share/pixmaps/kforth.xpm
Terminal=true
Type=Application
Categories=Development;
EOF
}
