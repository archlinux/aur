# Maintainer: taotieren <admin@taotieren.com>

pkgname=xgcom-git
pkgver=0.4.2.r7.g78adb81
pkgrel=1
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
  git
  make
  automake)
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}::git+$url.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"

    ./autogen.sh
    sed -i 's|(datadir)/@PACKAGE@|(datadir)|g' Makefile.in
    ./configure  --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR=${pkgdir} install

    install -Dm0644 "${srcdir}/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.helight.xgcom.metainfo.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.helight.xgcom</id>

  <name>${pkgname%-git}</name>
  <summary>${pkgname%-git}</summary>

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

Name=${pkgname%-git}
Comment=${pkgname%-git}
Categories=Network;GTK;

Icon=${pkgname%-git}.png
Exec=${pkgname%-git}
Terminal=false
EOF
}
