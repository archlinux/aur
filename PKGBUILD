# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: cocreature <moritz.kiefer<at>purelyfunctional<dot>org>

_pkgname="carla"
pkgname="${_pkgname}-git"
pkgver=2.3.1.r6.g030bcbb92
pkgrel=1
epoch=1
pkgdesc="Audio Plugin Host"
arch=("i686" "x86_64")
url="http://kxstudio.sf.net/carla"
license=("GPL2+")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=(
    'ffmpeg'
    'file'
    'fluidsynth'
    'liblo'
    'python-pyqt5'
    'qt5-svg'
)
makedepends=(
    'git'
    'gtk2'
    'gtk3'
)
optdepends=(
    'gtk2: LV2 GTK2 UI support'
    'gtk3: LV2 GTK3 UI support'
    'python-pyliblo: OSC control support'
    'python-rdflib: LADSPA-RDF support'
)
source=("${_pkgname}::git+https://github.com/falkTX/Carla.git")
md5sums=('SKIP')
changelog='changelog.txt'


pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make features
  make \
    HAVE_QT4=false \
    MOC_QT5=/usr/bin/moc-qt5 \
    RCC_QT5=/usr/bin/rcc-qt5 \
    UIC_QT5=/usr/bin/uic-qt5
}

package() {
  cd "${srcdir}/${_pkgname}"
  make \
    HAVE_QT4=false \
    MOC_QT5=/usr/bin/moc-qt5 \
    RCC_QT5=/usr/bin/rcc-qt5 \
    UIC_QT5=/usr/bin/uic-qt5 \
    DESTDIR="${pkgdir}/" \
    PREFIX=/usr \
    install
}
