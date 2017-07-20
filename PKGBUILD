# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: cocreature <moritz.kiefer<at>purelyfunctional<dot>org>

pkgname=carla-git
pkgver=1.9.7b.r2.gc57e8169
pkgrel=2
epoch=1
pkgdesc="Audio Plugin Host"
arch=("i686" "x86_64")
url="http://kxstudio.sf.net/carla"
license=("GPL2")
conflicts=("carla")
provides=("carla")
depends=(
    'clthreads'
    'file'
    'fluidsynth'
    'glu'
    'liblo'
    'linuxsampler'
    'mxml'
    'ntk-git'
    'projectm'
    'python-pyqt5'
    'zita-convolver'
    'zita-resampler'
)
makedepends=(
    'clxclient'
    'fluidsynth'
    'git'
    'gtk2'
    'gtk3'
    'qt4'
)
optdepends=(
    'clxclient: internal plugins UI support'
    'gtk2: LV2 GTK2 UI support'
    'gtk3: LV2 GTK3 UI support'
    'python-pyliblo: OSC control support'
    'python-rdflib: LADSPA-RDF support'
    'qt4: LV2 QT4 UI support'
    'zynaddsubfx: zynaddsubfx sound banks'
)
source=("$pkgname"::"git://github.com/falkTX/Carla.git")
md5sums=('SKIP')
changelog='changelog.txt'


pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed 's/libpng12/libpng/' -i "source/Makefile.mk"
  sed 's/libpng12/libpng/' -i "source/native-plugins/Makefile"
}

build() {
  cd "$srcdir/$pkgname"
  make \
    EXPERIMENTAL_PLUGINS=true \
    DEFAULT_QT=5 \
    MOC_QT5=/usr/bin/moc-qt5 \
    RCC_QT5=/usr/bin/rcc-qt5 \
    UIC_QT5=/usr/bin/uic-qt5
}

package() {
  cd "$srcdir/$pkgname"
  make \
    EXPERIMENTAL_PLUGINS=true \
    DEFAULT_QT=5 \
    MOC_QT5=/usr/bin/moc-qt5 \
    RCC_QT5=/usr/bin/rcc-qt5 \
    UIC_QT5=/usr/bin/uic-qt5 \
    DESTDIR="$pkgdir/" \
    PREFIX=/usr \
    install
}
