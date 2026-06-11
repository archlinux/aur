# Maintainer: Julian Houba <info at craftingdragon dot ch>
_pkgsrc=caqtdm
pkgname='caqtdm-git'
pkgver=4.6.1.r6014.g3aa30cf
pkgrel=1
pkgdesc='caQtDM is a popular Epics framework for developing panels'
arch=('x86_64')
url='https://caqtdm.github.io/'
license=('GPL-3.0-or-later')
depends=(
    'epics-base'
    'gcc-libs'
    'glibc'
    'python'
    'qt6-base'
    'qt6-opcua'
    'qt6-positioning'
    'qt6-serialbus'
    'qt6-tools'
    'qwt'
    'zeromq'
)
makedepends=(
    'git'
    'qt6-5compat'
)
provides=("caqtdm=${pkgver}")
conflicts=('caqtdm')
source=("$_pkgsrc::git+https://github.com/caqtdm/caqtdm.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgsrc/caQtDM_Viewer"
    local _ver _rev _hash
    _ver=$(grep -oP 'CAQTDM_VERSION\s*=\s*\K[Vv]?[\d.]+' qtdefs.pri | sed 's/^[Vv]//')
    _rev=$(git rev-list --count HEAD)
    _hash=$(git rev-parse --short=7 HEAD)
    printf "%s.r%s.g%s" "$_ver" "$_rev" "$_hash"
}

build() {
    cd "$srcdir/$_pkgsrc"

    local _pythonver
    _pythonver=$(python --version 2>&1 | cut -d' ' -f2 | cut -d'.' -f1-2)

    export QWTLIBNAME=qwt
    export QWTINCLUDE=/usr/include/qwt
    export EPICS_BASE=/usr/lib/epics
    export PYTHONVERSION="$_pythonver"
    export ZMQ=/usr
    export ZMQINC=/usr/include
    export ZMQLIB=/usr/lib
    export CAQTDM_OPCUA=1
    export CAQTDM_MODBUS=1
    export CAQTDM_GPS=1
    export CAQTDM_NORPATH=1
    export EPICS_HOST_ARCH="linux-${CARCH}"
    export QTHOME=/usr
    export QWTHOME=/usr
    export QWTLIB=/usr/lib
    export QWTVERSION=6.1
    export EPICSINCLUDE="$EPICS_BASE/include"
    export EPICSLIB="$EPICS_BASE/lib/$EPICS_HOST_ARCH"
    export EPICSEXTENSIONS="$EPICS_BASE/extensions"
    export QTCONTROLS_LIBS="$srcdir/binaries"
    export CAQTDM_COLLECT="$srcdir/binaries"
    export QTBASE="$QTCONTROLS_LIBS"
    export CAQTDM_CA_ARCHIVELIBS="$srcdir/binaries/"
    export CAQTDM_LOGGING_ARCHIVELIBS="$srcdir/binaries"
    export QTDM_LIBINSTALL="$EPICSEXTENSIONS/lib/$EPICS_HOST_ARCH"
    export QTDM_BININSTALL="$EPICSEXTENSIONS/bin/$EPICS_HOST_ARCH"
    export PYTHONINCLUDE="/usr/include/python$_pythonver"
    export PYTHONLIB=/usr/lib/

    qmake6 ./all.pro
    make
}

package() {
    cd "$srcdir/$_pkgsrc"

    install -dm755 \
        "$pkgdir/opt/caqtdm/doc" \
        "$pkgdir/opt/caqtdm/lib/qt6" \
        "$pkgdir/usr/bin" \
        "$pkgdir/usr/include/caqtdm/plugins" \
        "$pkgdir/usr/include/caqtdm/caQtDM_Plugins" \
        "$pkgdir/usr/lib/qt6/plugins/designer" \
        "$pkgdir/etc/ld.so.conf.d"

    # Install compiled binaries and libraries
    cp -r "$srcdir/binaries/"* "$pkgdir/opt/caqtdm/lib/qt6/"

    # Create caQtDM wrapper script
    install -Dm755 /dev/stdin "$pkgdir/opt/caqtdm/lib/qt6/caqtdm" << 'EOF'
#!/bin/bash
caQtDM -style Fusion "$@" &
EOF

    # Create Qt Designer integration script
    install -Dm755 /dev/stdin "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer" << 'EOF'
#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
CAQTDM_HOME="$DIR/../.."

# Register help documentation
assistant6 -register "$CAQTDM_HOME/doc/caQtDM.qch"
export QT_PLUGIN_PATH="$CAQTDM_HOME/lib/qt6"
designer6 "$@"
EOF

    # Create linker configuration so shared libraries are found without rpath
    install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/caqtdm.conf" << 'EOF'
/opt/caqtdm/lib/qt6
/opt/caqtdm/lib/qt6/designer
/opt/caqtdm/lib/qt6/controlsystems
EOF

    # Symlink executables into /usr/bin
    ln -sf /opt/caqtdm/lib/qt6/caqtdm         "$pkgdir/usr/bin/caqtdm"
    ln -sf /opt/caqtdm/lib/qt6/caQtDM         "$pkgdir/usr/bin/caQtDM"
    ln -sf /opt/caqtdm/lib/qt6/adl2ui          "$pkgdir/usr/bin/adl2ui"
    ln -sf /opt/caqtdm/lib/qt6/edl2ui          "$pkgdir/usr/bin/edl2ui"
    ln -sf /opt/caqtdm/lib/qt6/caqtdm_designer "$pkgdir/usr/bin/caqtdm_designer"

    # Symlink Qt Designer plugins
    local _designerdir="$pkgdir/usr/lib/qt6/plugins/designer"
    ln -sf /opt/caqtdm/lib/qt6/designer/libqtcontrols_controllers_plugin.so \
        "$_designerdir/"
    ln -sf /opt/caqtdm/lib/qt6/designer/libqtcontrols_graphics_plugin.so \
        "$_designerdir/"
    ln -sf /opt/caqtdm/lib/qt6/designer/libqtcontrols_monitors_plugin.so \
        "$_designerdir/"
    ln -sf /opt/caqtdm/lib/qt6/designer/libqtcontrols_utilities_plugin.so \
        "$_designerdir/"

    # Install C++ header files
    install -Dm644 -t "$pkgdir/usr/include/caqtdm/" \
        "$srcdir/$_pkgsrc/caQtDM_QtControls/src/"*.h
    install -Dm644 -t "$pkgdir/usr/include/caqtdm/" \
        "$srcdir/$_pkgsrc/caQtDM_Lib/src/"*.h
    install -Dm644 -t "$pkgdir/usr/include/caqtdm/" \
        "$srcdir/$_pkgsrc/caQtDM_Viewer/src/"*.h
    install -Dm644 -t "$pkgdir/usr/include/caqtdm/plugins/" \
        "$srcdir/$_pkgsrc/caQtDM_QtControls/plugins/"*.h
    install -Dm644 -t "$pkgdir/usr/include/caqtdm/caQtDM_Plugins/" \
        "$srcdir/$_pkgsrc/caQtDM_Plugins/"*.h

    # Install extension-less convenience headers (Qt-style includes)
    find "$srcdir/$_pkgsrc/caQtDM_QtControls/src" -maxdepth 1 \
        -type f ! -name '*.*' \
        ! -iname '*license*' ! -iname '*copying*' ! -iname '*readme*' \
        -exec install -Dm644 -t "$pkgdir/usr/include/caqtdm/" {} +

    # Install documentation (referenced by caqtdm_designer via $CAQTDM_HOME/doc)
    install -Dm644 -t "$pkgdir/opt/caqtdm/doc/" \
        "$srcdir/$_pkgsrc/caQtDM_QtControls/doc/"*.qch \
        "$srcdir/$_pkgsrc/caQtDM_QtControls/doc/"*.html \
        "$srcdir/$_pkgsrc/caQtDM_QtControls/doc/"*.css
}

check() {
    cd "$srcdir/$_pkgsrc"
    export LD_LIBRARY_PATH="$srcdir/binaries:$LD_LIBRARY_PATH"
    make -C caQtDM_UnitTests check
}
