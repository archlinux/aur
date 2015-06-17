# Maintainer:  Alexander Minges <alexander.minges@gmail.de>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: yescalona <yescalona@ug_uchile_cl>
# Contributor: Juan Miguel Cejuela <jmcejuela@gmail.com>
# Contributor: Fabio Zanini <iosonofabio@gmail.com>

pkgname=modeller
pkgver=9.15
pkgrel=1
pkgdesc="3D Structure Homology Modeller"
arch=('i686' 'x86_64')
url="http://salilab.org/modeller/"
license=('custom')
depends=('python2' 'glib2')
optdepends=('python: python3 support')
install=modeller.install
source=("http://www.salilab.org/modeller/$pkgver/modeller-$pkgver.tar.gz")

sha256sums=('9833eace132429abee54f2f7055a55f88ac9990cd79024f95a58d12161ca8eee')

package() {
    cd $srcdir/$pkgname-$pkgver
    
    #set default values:
    VER="9.15"
    VERENV="9v15"
    MOD="MODELLER ${VER}"
    PROGRAM=mod${VER}
    MODINSTALL="${pkgdir}/usr/lib/modeller"
    _MODINSTALL="/usr/lib/modeller"

    if [ "{$CARCH}" = "i686" ]; then
        # for i686
        EXECUTABLE_TYPE="i386-intel8"
    elif [ "${CARCH}" = "x86_64" ]; then
        # for x86_64
        EXECUTABLE_TYPE="x86_64-intel8"
    else
        error "MODELLER is only available for i386 and x86_64!"
    fi
    
    # Change directory permisssions
    find . -type d -exec chmod 755 {} \;
    
    # Installing Modeller files
    mkdir -p "${MODINSTALL}"
    cp -R README INSTALLATION doc examples modlib src "${MODINSTALL}"
    mkdir -p "${MODINSTALL}/bin"
    cp -R bin/*.top bin/modslave.py bin/lib bin/${PROGRAM}_${EXECUTABLE_TYPE} \
        "${MODINSTALL}/bin"
    mkdir -p "${MODINSTALL}/lib"
    cp -R lib/${EXECUTABLE_TYPE} "${MODINSTALL}/lib"

    # Creating Modeller startup scripts
    sed -e "s;EXECUTABLE_TYPE${VERENV}=xxx;EXECUTABLE_TYPE${VERENV}=$EXECUTABLE_TYPE;" \
        -e "s;MODINSTALL${VERENV}=xxx;MODINSTALL${VERENV}=\"$_MODINSTALL\";" \
        bin/modscript > "${MODINSTALL}/bin/${PROGRAM}"
    sed -e "s;@TOPDIR\@;\"$_MODINSTALL\";" \
        -e "s;@EXETYPE\@;$EXECUTABLE_TYPE;" \
        bin/modpy.sh.in > "${MODINSTALL}/bin/modpy.sh"
    chmod a+x "${MODINSTALL}/bin/${PROGRAM}" "${MODINSTALL}/bin/modpy.sh"
    sed -e "s;/usr/bin/python;/usr/bin/python2;" \
        bin/modslave.py > "${MODINSTALL}/bin/modslave.py"
    
    # Creating simbol link
    install -d ${pkgdir}/usr/bin/
    ln -sf ${_MODINSTALL}/bin/mod$pkgver  ${pkgdir}/usr/bin/mod$pkgver
    ln -sf ${_MODINSTALL}/bin/modpy.sh  ${pkgdir}/usr/bin/modpy.sh
    ln -sf ${_MODINSTALL}/bin/modslave.py  ${pkgdir}/usr/bin/modslave.py

    # Create config.py is it not exists
    if [ ! -f "${_MODINSTALL}/modlib/modeller/config.py" ]; then
        msg "Creating '${_MODINSTALL}/config.py'..."
        echo "license = 'XXXX'" > "${MODINSTALL}/modlib/modeller/config.py"
        msg "Done! Add your license code to '${_MODINSTALL}/config.py'."
    else
        msg "Found existing config.py. Please check that the license code within this file is correct!"
    fi
    
    # Add modeller libs to ld.so.conf
    msg "Adding MODELLER to ld.so.conf..."
    install -d ${pkgdir}/etc/ld.so.conf.d
    echo "/usr/lib/${pkgname}/lib/${EXECUTABLE_TYPE}" > ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf

    # Install python2 module
    msg "Installing package for python2..."
    install -d ${pkgdir}/usr/lib/python2.7/site-packages
    ln -s ${_MODINSTALL}/modlib/modeller  ${pkgdir}/usr/lib/python2.7/site-packages/modeller  
        
    ln -s ${_MODINSTALL}/lib/${EXECUTABLE_TYPE}/python2.5/_modeller.so ${pkgdir}/usr/lib/python2.7/site-packages/_modeller.so
     
     # Install python3 modules if python3 is installed
     if [ -d "/usr/lib/python3.4/site-packages" ]; then
         msg "Installing package for python3..."
         install -d ${pkgdir}/usr/lib/python3.4/site-packages
         ln -s ${_MODINSTALL}/modlib/modeller  ${pkgdir}/usr/lib/python3.4/site-packages/modeller
         ln -s ${_MODINSTALL}/lib/${EXECUTABLE_TYPE}/python3.3/_modeller.so ${pkgdir}/usr/lib/python3.4/site-packages/_modeller.so
     else
         msg "Python3 not found! If you want to use modeller within python3, install 'python32' from the AUR and reinstall MODELLER."
     fi
} 

