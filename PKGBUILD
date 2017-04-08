# Maintainer: Eugene Dvoretsky <radioxoma from gmail com>

pkgname=micromanager-git
pkgver=v2.0.0.beta2.r2147.gc6734e115
pkgrel=2
epoch=
pkgdesc="Software package for control of automated microscopes. CMMCore, MMStudio, python2 and Java bindings"
arch=('x86_64' 'i686')
url="https://micro-manager.org"
license=('BSD LGPL')
groups=()
depends=('desktop-file-utils' 'java-runtime' 'boost' 'python2' 'python2-numpy' 'imagej')
makedepends=('git' 'clang' 'swig' 'imagemagick')
optdepends=('libgphoto2: DSLR camera support'
            'freeimage: libgphoto2 support'
            'libdc1394')
checkdepends=()
optdepends=()
provides=('micromanager')
conflicts=('micromanager')
replaces=()
backup=()
options=()
install=mm.install
source=("$pkgname::git+https://github.com/micro-manager/micro-manager.git/#commit=c6734e1151bd59514e4ee629e24b1445f07be6c1"  # Latest commit im 'mm2' branch
        "3rdpartypublic::svn+https://valelab.ucsf.edu/svn/3rdpartypublic/"
        "mmstudio.desktop")
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP')
IJ_DIR='/usr/share/imagej'
_PYTHON='python2'  # Choose python2 or python3

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
        # https://micro-manager.org/wiki/Building_and_debugging_Micro-Manager_source_code
        cd "$srcdir/$pkgname"
        sh ./autogen.sh
}

build() {
        cd "$srcdir/$pkgname"
        # With MMCore, device adapters, Python wrapper (MMCorePy).
        # Without closed-source device adapters.
        CXXCPP=/usr/bin/cpp ./configure --prefix=/usr --enable-imagej-plugin=${IJ_DIR} --with-python PYTHON=${_PYTHON}

        # Download necessary jars. You may to have to run it multiple times!
        # NB! Repo `https://valelab.ucsf.edu/svn/3rdpartypublic/` still needed
        make fetchdeps

        make
}

package() {
        cd "$srcdir/$pkgname"
        make install DESTDIR="$pkgdir"

        msg "Installing mmimagej script"
        mkdir -p "$pkgdir/usr/bin/"
        mv "$pkgdir${IJ_DIR}/mmimagej" "$pkgdir/usr/bin/"

        msg "Installing MMCorePy"
        PY_DIR=`${_PYTHON} -c "import site; print(site.getsitepackages()[0])"`
        mkdir -p "$pkgdir${PY_DIR}"
        mv "$pkgdir${IJ_DIR}/MMCorePy.py" "$pkgdir$PY_DIR/"
        mv "$pkgdir${IJ_DIR}/_MMCorePy.so" "$pkgdir$PY_DIR/"
        ${_PYTHON} -m compileall "$pkgdir$PY_DIR"
        ${_PYTHON} -O -m compileall "$pkgdir$PY_DIR"

        # We need to update ldconfig cache with new libs.
        mkdir -p "$pkgdir/etc/ld.so.conf.d/"
        echo "${IJ_DIR}" > "$pkgdir/etc/ld.so.conf.d/micromanager-lib.conf"
        install -Dm644 "$srcdir/$pkgname/doc/copyright.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

        msg "Installing icon and desktop file"
        convert "$srcdir/$pkgname/mmstudio/build/org/micromanager/icons/microscope.gif" "$srcdir/mmstudio.png"
        install -Dm644 "$srcdir/mmstudio.png" "$pkgdir/usr/share/pixmaps/mmstudio.png"
        install -Dm644 "$srcdir/mmstudio.desktop" "$pkgdir/usr/share/applications/mmstudio.desktop"
}

# This script print 'DemoCamera' property list if CMMCore and python bindings
# had installed well.
# $ python2 -c 'import MMCorePy; DEVICE = ["Camera", "DemoCamera", "DCam"]; mmc = MMCorePy.CMMCore(); mmc.loadDevice(*DEVICE); mmc.initializeDevice(DEVICE[0]); mmc.setCameraDevice(DEVICE[0]); print mmc.getDevicePropertyNames(DEVICE[0])'
