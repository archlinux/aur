# Maintainer: taotieren <admin@taotieren.com>

pkgname=xgcom
pkgver=0.4.2
pkgrel=3
epoch=
pkgdesc="A gui tools to help guys develop series port, like minicom."
arch=('any')
url="https://github.com/helight/xgcom"
license=('GPL2')
groups=()
depends=(glib2
  vte-legacy
  gtk2)
makedepends=(
  make
  automake)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=('66dfcbebd6524b1bfef08a8e7ed5a122d6c88e5e4e55be6a0c4a69947f0ccc44')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    sed -i 's|(datadir)/@PACKAGE@|(datadir)|g' Makefile.in
    ./configure  --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install

    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.helight.xgcom.metainfo.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.helight.xgcom</id>

  <name>${pkgname}</name>
  <summary>${pkgname}</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>GPL-2.0-only</project_license>

  <description>
    <p>
      ${pkgdesc}
    </p>
  </description>

  <launchable type="desktop-id">io.github.helight.xgcom.desktop</launchable>
</component>
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.helight.xgcom.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=${pkgname}
Comment=${pkgname}
Categories=Network;Qt;

Icon=${pkgname}.png
Exec=${pkgname}
Terminal=false
EOF
}
