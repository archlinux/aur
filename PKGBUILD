# Maintainer: Michael Schubert <mschu.dev at gmail>
# Maintainer: Eugene Dvoretsky <radioxoma at gmail>

pkgname=cellprofiler-git
pkgver=2.2.0.r0.gac0529ec5
pkgrel=2
pkgdesc="Analysis software for cellular images"
arch=('i686' 'x86_64')
url="http://www.cellprofiler.org/"
license=('GPL')
depends=(
    'python2-appdirs'
    'python2-decorator'
    'python2-pytz'
    'python2-pyzmq'
    'python2-scipy'
    'python2-matplotlib'
    'python2-h5py'
    'python2-imaging'
    'python2-scikit-image'
    'python2-pylibtiff-git'
    'python2-pandas'
    'mysql-python'
    'wxpython'
    # 'pythoh2-cellh5'
    'python2-hmmlearn-git'
    'python2-pywavelets'
    'python2-javabridge'
    'python2-bioformats'
    'python2-prokaryote'
    'python2-centrosome')
makedepends=('python2-pip' 'cython2' 'python2-pytest')
optdepends=(
    'cellprofiler-analyst: analyze imaging datasets'
    'ilastik: interactive segmentation')
provides=('cellprofiler')
source=("cellprofiler::git+https://github.com/CellProfiler/CellProfiler.git#tag=2.2.0"
        "cellprofiler.desktop")
sha256sums=('SKIP'
           '039350ce852b1efb8e9e11db94ca0ab01a34f32cc5aaf2acf524e19e2fa04d6f')

pkgver() {
    cd cellprofiler
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/cellprofiler"
    export PYTHONPATH="${srcdir}/pkg/lib/python2.7/site-packages"

    # Non-AUR or official repo dependencies will be fetched into $srcdir directory by pip
    # No write permission to $pkgdir in `build()` funtion, so we are using `$srcdir/pkg` for pip
    # MUST be run on machine without installed CellProfiler or dependencides won't be fetched
    PIP_CONFIG_FILE=/dev/null pip2 install --prefix="$srcdir/pkg" .
}

package() {
    cd "$srcdir/cellprofiler"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cellprofiler/LICENSE"
    install -Dm644 artwork/CellProfilerIcon.png "$pkgdir/usr/share/pixmaps/cellprofiler.png"
    install -Dm644 "$srcdir/cellprofiler.desktop" "$pkgdir/usr/share/applications/cellprofiler.desktop"
    cp -r "$srcdir/pkg/." "$pkgdir/usr"
    # TODO: install to /opt to prevent potential conflict with pacman packages in future
}
