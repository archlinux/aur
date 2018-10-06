# $Id$
# Maintainer: Andrew Dabrowski <dabrowsa@indiana.edu>
# Contributor: Joan Sala Soler <contact@joansala.com>

pkgname=auale
pkgver=1.1.2
pkgrel=1
pkgdesc="A free mancala game for the serious player"
arch=('any')
url="http://www.joansala.com/auale"
license=('GPL3')
groups=()
depends=(
  'python>=2.6'
  'gtk3>=3.10'
  'java-runtime=7'
  'java-environment=7'
  'python-gobject'
  'desktop-file-utils'
  'sdl2'
  'sdl2_mixer'
)
makedepends=(
  'python-setuptools'
)
replaces=('python2-auale')
install=${pkgname}.install
source=("http://www.joansala.com/auale/packages/$pkgname-$pkgver.tar.xz")
sha256sums=('e74bf6dba321e35b3d2216b764f87825de3721911bc7124e8202153d5dee6aa4')

build() {
    pushd ${pkgname}-${pkgver}/src/${pkgname}
    python setup.py build
    popd
}

package() {
    pushd ${pkgname}-${pkgver}/src/${pkgname}
    python setup.py install \
        --root=${pkgdir} \
        --install-lib=/usr/share/${pkgname} \
        --skip-build
    popd
    
    # Link the game launcher
    install -d ${pkgdir}/usr/bin
    ln -s /usr/share/${pkgname}/__main__.py \
          ${pkgdir}/usr/bin/${pkgname}
    chmod +x ${pkgdir}/usr/share/${pkgname}/__main__.py
    
    # Install dist files
    pushd ${pkgname}-${pkgver}/res/share
    install -D -m644 applications/${pkgname}.desktop \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 glib-2.0/schemas/com.joansala.${pkgname}.gschema.xml \
        ${pkgdir}/usr/share/glib-2.0/schemas/com.joansala.${pkgname}.gschema.xml
    install -D -m644 man/man6/${pkgname}.6 \
        ${pkgdir}/usr/share/man/man6/${pkgname}.6
    install -D -m644 mime/packages/${pkgname}.xml \
        ${pkgdir}/usr/share/mime/packages/${pkgname}.xml
    install -D -m644 icons/hicolor/scalable/mimetypes/text-x-oware-ogn.svg \
        ${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/text-x-oware-ogn.svg
    install -D -m644 icons/hicolor/scalable/apps/${pkgname}.svg \
        ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
    popd
    
    # Move installed locales
    pushd ${pkgdir}/usr/share/${pkgname}/res
    mv -v messages ${pkgdir}/usr/share/locale
    popd
}