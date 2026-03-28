# Maintainer: robinpie <robin413@protonmail.com>
pkgname=atlantik-git
_pkgname=atlantik
pkgver=3.80.3.r753.gf4e092c
pkgrel=1
pkgdesc='KDE client for playing Monopoly-like board games on the monopd network'
arch=('x86_64')
url='https://invent.kde.org/games/atlantik'
license=('GPL-2.0-only' 'LGPL-2.1-only')
depends=(
    'libstdc++'
    'glibc'
    'hicolor-icon-theme'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'kcrash'
    'kdbusaddons'
    'ki18n'
    'kiconthemes'
    'knotifications'
    'knotifyconfig'
    'kwidgetsaddons'
    'kxmlgui'
    'libkdegames'
    'qt6-base'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'git'
    'kdoctools'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=('atlantik')
source=("${_pkgname}::git+https://invent.kde.org/games/atlantik.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Arch Linux kdoctools ships xsl/pt_br.xml but KDE's kde-include-common.xsl
    # constructs the path as xsl/<lang>.xml from the document's lang entity, producing
    # xsl/pt-BR.xml. Redirect that URI via an XML catalog so xsltproc resolves it
    # correctly without needing to modify any system files.
    cat > "$srcdir/kdoctools-pt-BR-catalog.xml" << 'EOF'
<?xml version="1.0"?>
<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"
  "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
  <uri name="file:///usr/share/kf6/kdoctools/customization/xsl/pt-BR.xml"
       uri="file:///usr/share/kf6/kdoctools/customization/xsl/pt_br.xml"/>
</catalog>
EOF
}

build() {
    # Include custom catalog after system one so pt-BR.xml URI gets remapped
    export XML_CATALOG_FILES="/etc/xml/catalog $srcdir/kdoctools-pt-BR-catalog.xml"
    cmake -B build -S "$_pkgname" \
        -DBUILD_TESTING=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
