# $Id$
# Maintainer: Joan Sala Soler <contact@joansala.com>
# Contributor: Andrew Dabrowski <dabrowsa@indiana.edu>

pkgname=auale
pkgver=2.1.0
pkgrel=1
pkgdesc="Aualé — The Game of Mancala"
arch=('any')
url="https://auale.joansala.com/"
license=('GPL3')
groups=()
depends=(
  'python>=3.6'
  'clutter>=1.2'
  'clutter-gtk>=1.8'
  'gtk3>=3.10'
  'jre-openjdk-headless>=8'
  'libmanette>=0.2'
  'librsvg>=2.0'
  'python-gobject>=3.29'
  'desktop-file-utils'
  'sdl2_mixer'
)
makedepends=(
  'python-setuptools'
)
conflicts=('python2-auale')
install=${pkgname}.install
source=("https://github.com/joansalasoler/auale/releases/download/${pkgver}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('b4f8a1d324814cf8f816c4f4895704bea9cf446f6ffa9c501555a8fe85c5943e')

build() {
    pushd ${srcdir}/src
    python setup.py build
    popd
}

package() {
    pushd ${srcdir}/src
    python setup.py install \
        --root=${pkgdir} \
        --install-lib=/usr/share \
        --skip-build
    popd

    # Link the game launcher
    install -d ${pkgdir}/usr/bin
    ln -s /usr/share/${pkgname}/__main__.py ${pkgdir}/usr/bin/${pkgname}
    chmod +x ${pkgdir}/usr/share/${pkgname}/__main__.py

    # Install dist files
    pushd ${srcdir}/share
    install -D -m644 applications/${pkgname}.desktop \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 glib-2.0/schemas/com.joansala.${pkgname}.gschema.xml \
        ${pkgdir}/usr/share/glib-2.0/schemas/com.joansala.${pkgname}.gschema.xml
    install -D -m644 man/man6/${pkgname}.6 \
        ${pkgdir}/usr/share/man/man6/${pkgname}.6
    install -D -m644 mime/packages/${pkgname}.xml \
        ${pkgdir}/usr/share/mime/packages/${pkgname}.xml
    install -D -m644 icons/hicolor/16x16/mimetypes/text-x-oware-ogn.png \
        ${pkgdir}/usr/share/icons/hicolor/16x16/mimetypes/text-x-oware-ogn.png
    install -D -m644 icons/hicolor/24x24/mimetypes/text-x-oware-ogn.png \
        ${pkgdir}/usr/share/icons/hicolor/24x24/mimetypes/text-x-oware-ogn.png
    install -D -m644 icons/hicolor/32x32/mimetypes/text-x-oware-ogn.png \
        ${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/text-x-oware-ogn.png
    install -D -m644 icons/hicolor/48x48/mimetypes/text-x-oware-ogn.png \
        ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/text-x-oware-ogn.png
    install -D -m644 icons/hicolor/256x256/mimetypes/text-x-oware-ogn.png \
        ${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/text-x-oware-ogn.png
    install -D -m644 icons/hicolor/scalable/mimetypes/text-x-oware-ogn-symbolic.svg \
        ${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/text-x-oware-ogn-symbolic.svg
    install -D -m644 icons/hicolor/scalable/apps/${pkgname}.svg \
        ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
    install -D -m644 metainfo/com.joansala.auale.metainfo.xml \
        %{buildroot}%{_datadir}/metainfo/com.joansala.auale.metainfo.xml
    popd

    # Remove generated egg-info files
    rm -R -f ${pkgdir}/usr/share/${pkgname}-*.egg-info

    # Move installed locales
    pushd ${pkgdir}/usr/share/${pkgname}
    mv -v data/locale ${pkgdir}/usr/share/locale
    popd
}
