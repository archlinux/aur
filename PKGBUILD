# Maintainer: Julian Houba <craftingdragon007 at outlook dot com>
pkgname='caqtdm'
pkgver=4.5.0
pkgrel=2
pkgdesc="caQtDM is a popular Epics framework for developing panels"
arch=('any')
url="http://caqtdm.github.io/"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-tools' 'qwt-qt6' 'epics-base' 'zeromq' 'python' 'bash' 'glibc' 'gcc-libs')
makedepends=('patch' 'make' 'gcc' 'git' 'qt6-5compat')
source=("git+https://github.com/caqtdm/caqtdm.git#tag=V4.5.0"
        "fix_qwt_static_cast_gcc.patch"
        "no_rpath.patch")
sha512sums=('SKIP' '10e281ea0f6670ff908421622589b217187e998abd260a3a2a2f43d8d8f577ce072379aa21f35506208c27d2a3c8fd69295ae05a8f90dbdae597a58fdf8568ad'  '0b65a78690a223fa4114982604caf865cff0257126a6c299966508b8f21583755259cb71b07fa51f9614a13d75bd9474aed66295396235faa9404a3d1b371dd3')

prepare() {
    # Write environment variables to env_config.sh
    cat > "${srcdir}/env_config.sh" << 'EOF'
export QWTLIBNAME=qwt-qt6
export QWTINCLUDE=/usr/include/qwt-qt6
export EPICS_BASE=/usr/lib/epics
export PYTHONVERSION=$(python --version 2>&1 | cut -d ' ' -f 2 | cut -d '.' -f 1-2)
export ZMQ=/usr
export ZMQINC=$ZMQ/include
export ZMQLIB=$ZMQ/lib
export QTDM_RPATH=/opt/caqtdm/lib/qt6

if [ -z "$CARCH" ]; then
    export CARCH=$(uname -m)
fi

export EPICS_HOST_ARCH=linux-${CARCH}

export QTHOME=/usr
export QWTHOME=/usr
export QWTLIB=${QWTHOME}/lib
export QWTVERSION=6.1
export EPICSINCLUDE=${EPICS_BASE}/include
export EPICSLIB=${EPICS_BASE}/lib/$EPICS_HOST_ARCH
export EPICSEXTENSIONS=${EPICS_BASE}/extensions
export QTCONTROLS_LIBS=${srcdir}/binaries
export CAQTDM_COLLECT=${srcdir}/binaries
export QTBASE=${QTCONTROLS_LIBS}
export CAQTDM_CA_ARCHIVELIBS=${srcdir}/binaries/
export CAQTDM_LOGGING_ARCHIVELIBS=${srcdir}/binaries
export QTDM_LIBINSTALL=$EPICSEXTENSIONS/lib/$EPICS_HOST_ARCH
export QTDM_BININSTALL=$EPICSEXTENSIONS/bin/$EPICS_HOST_ARCH
export PYTHONINCLUDE=/usr/include/python$PYTHONVERSION
export PYTHONLIB=/usr/lib/
EOF

    echo patching broken files
    patch --forward --strip=1 --input="${srcdir}/fix_qwt_static_cast_gcc.patch"
    echo patching config for rpath removal
    cd "$srcdir/caqtdm"
    patch --forward --strip=1 --input="${srcdir}/no_rpath.patch"
}

build() {
    cd "$srcdir/caqtdm"
    # Source the environment variables
    source "${srcdir}/env_config.sh"
    # Create make files
    qmake6 ./all.pro
    # Build the project
    make
}

package() {
    cd "$srcdir/caqtdm"

    mkdir -p "${pkgdir}/opt/caqtdm/doc"
    mkdir -p "${pkgdir}/opt/caqtdm/lib/qt6"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/include"
    mkdir -p "${pkgdir}/usr/include/caqtdm"
    mkdir -p "${pkgdir}/usr/include/caqtdm/plugins"
    mkdir -p "${pkgdir}/usr/include/caqtdm/caQtDM_Plugins"
    mkdir -p "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/lib/qt6/plugins/designer/"
    mkdir -p "${pkgdir}/etc/ld.so.conf.d/"
    
    # Install binaries
    cp -r $srcdir/binaries/* $pkgdir/opt/caqtdm/lib/qt6
    echo "#!/bin/bash" > $pkgdir/opt/caqtdm/lib/qt6/caqtdm

    # Create caQtDM script
    echo "caQtDM -style Fusion \"\$@\" &" > $pkgdir/opt/caqtdm/lib/qt6/caqtdm

    # Make the script executable
    chmod +x $pkgdir/opt/caqtdm/lib/qt6/caqtdm

    # Create qt designer script
    echo "#!/bin/bash" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "SOURCE=\"\${BASH_SOURCE[0]}\"" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "while [ -h \"\$SOURCE\" ]; do # resolve \$SOURCE until the file is no longer a symlink" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "  DIR=\"\$( cd -P \"\$( dirname \"\$SOURCE\" )\" && pwd )\"" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo     "  SOURCE=\"\$(readlink \"\$SOURCE\")\"" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "  [[ \$SOURCE != /* ]] && SOURCE=\"\$DIR/\$SOURCE\" # if \$SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "done" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "DIR=\"\$( cd -P \"\$( dirname \"\$SOURCE\" )\" && pwd )\"" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "CAQTDM_HOME=\$DIR/../.." >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "# Register help" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "assistant6 -register \$CAQTDM_HOME/doc/caQtDM.qch" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "export QT_PLUGIN_PATH=\$CAQTDM_HOME/lib/qt6" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"
    echo "designer6 \$@" >> "$pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer"

    # Create linker config for finding so files without rpath
    echo "/opt/caqtdm/lib/qt6" > "$pkgdir/etc/ld.so.conf.d/caqtdm.conf"
    echo "/opt/caqtdm/lib/qt6/designer" >> "$pkgdir/etc/ld.so.conf.d/caqtdm.conf"
    echo "/opt/caqtdm/lib/qt6/controlsystems" >> "$pkgdir/etc/ld.so.conf.d/caqtdm.conf"

    # Make the script executable
    chmod +x $pkgdir/opt/caqtdm/lib/qt6/caqtdm_designer


    # Create symlinks
    ln -sfv /opt/caqtdm/lib/qt6/caqtdm $pkgdir/usr/bin/caqtdm
    ln -sfv /opt/caqtdm/lib/qt6/caQtDM $pkgdir/usr/bin/caQtDM
    ln -sfv /opt/caqtdm/lib/qt6/adl2ui $pkgdir/usr/bin/adl2ui
    ln -sfv /opt/caqtdm/lib/qt6/edl2ui $pkgdir/usr/bin/edl2ui
    ln -sfv /opt/caqtdm/lib/qt6/caqtdm_designer $pkgdir/usr/bin/caqtdm_designer

    ln -sfv /opt/caqtdm/lib/qt6/designer/libqtcontrols_controllers_plugin.so $pkgdir/usr/lib/qt6/plugins/designer/
    ln -sfv /opt/caqtdm/lib/qt6/designer/libqtcontrols_graphics_plugin.so $pkgdir/usr/lib/qt6/plugins/designer/
    ln -sfv /opt/caqtdm/lib/qt6/designer/libqtcontrols_monitors_plugin.so $pkgdir/usr/lib/qt6/plugins/designer/
    ln -sfv /opt/caqtdm/lib/qt6/designer/libqtcontrols_utilities_plugin.so $pkgdir/usr/lib/qt6/plugins/designer/
    


    # Install include files and docs
    cp $srcdir/caqtdm/caQtDM_QtControls/src/*.h     $pkgdir/usr/include/caqtdm

    cp $srcdir/caqtdm/caQtDM_QtControls/src/caApplyNumeric   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caBitnames   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caByte   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caCalc   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caCamera   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caCartesianPlot   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caChoice   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caFrame   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caGauge   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caGraphics   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caImage   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caLabel   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caLed   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caLineEdit   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caMenu   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caMessageButton   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caMimeDisplay   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caMultiLineString   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caNumeric   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caSlider   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caSpinbox   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caStripPlot   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caTextEntry   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caThermo   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caToggleButton   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/caWaterfallPlot   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/EApplyButton   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/EArrow   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/EFlag   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/EGauge   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/ELabel   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/ESimpleLabel   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/EWidget   $pkgdir/usr/include/caqtdm
    cp $srcdir/caqtdm/caQtDM_QtControls/src/QtControls   $pkgdir/usr/include/caqtdm

    cp $srcdir/caqtdm/caQtDM_QtControls/plugins/*.h  $pkgdir/usr/include/caqtdm/plugins

    cp $srcdir/caqtdm/caQtDM_Lib/src/*.h     $pkgdir/usr/include/caqtdm
        
    cp $srcdir/caqtdm/caQtDM_Lib/caQtDM_Plugins/*.h     $pkgdir/usr/include/caqtdm/caQtDM_Plugins

    cp $srcdir/caqtdm/caQtDM_Viewer/src/*.h     $pkgdir/usr/include/caqtdm
        
    cp $srcdir/caqtdm/caQtDM_QtControls/doc/*.qch     $pkgdir/opt/caqtdm/doc
    cp $srcdir/caqtdm/caQtDM_QtControls/doc/*.html     $pkgdir/opt/caqtdm/doc
    cp $srcdir/caqtdm/caQtDM_QtControls/doc/*.css     $pkgdir/opt/caqtdm/doc
}
