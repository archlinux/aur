# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ccstudio
pkgver=7.4.0.00015
pkgrel=1
pkgdesc="Texas Instruments Code Composer Studio IDE"
arch=('x86_64')
url="http://www.ti.com/tool/ccstudio"
license=('custom:TSPA')

makedepends=('glibc')

# Needed for builtin jxBrowser plugin (otherwise exception exit code 127)
depends=('gconf' 'python2' 'gtk2' 'libxtst' 'nss' 'libxss' 'alsa-lib')

# Without some ttf fonts installed, UI is ugly
optdepends=('ttf-dejavu')

# The license file was copy-pasted from the installer's GUI
_archive=CCS${pkgver}_linux-x64
source=("http://software-dl.ti.com/ccs/esd/CCSv7/CCS_7_4_0/exports/${_archive}.tar.gz"
        "LICENSE"
        "61-msp430uif.rules"
        "71-sd-permissions.rules")

md5sums=('71ae53956f68e2a28d4fb89d5730bb61'
         'cf7222e486f8f1d2a0f99d3d946e1f01'
         '7c570e9f93da6f01986285db81d497ef'
         'af8a8c199be432919b4ca66106591c25')

install=$pkgname.install

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_desktop="Code Composer Studio 7.4.0.desktop"

_destdir=opt
_installdir=installdir
_installpath=$_installdir/$_destdir/$pkgname
_scriptsdir=$_installpath/ccsv7/install_scripts

build() {
    cd $srcdir/${_archive}

    echo ">>> Executing installer. You can monitor progress with:"
    echo ">>>     tail -f ${srcdir}/${_installpath}/ccsv7/install_logs/*/ccs_setup_${pkgver}_install.log"

    # Can't run this in package, because running as fakeroot breaks it:
    #    CCS_INFO: error message: dlsym(acl_get_fd): /usr/lib32/libfakeroot/libfakeroot.so: undefined symbol: acl_get_fd
    # NOTE: ti_cgt_c2000_16.9.3.LTS_linux_installer_x86.bin is executed under fakeroot, this error is simply printed,
    #       but is not fatal. But, when the whole CCS installer is run under fakeroot is 
    ./ccs_setup_linux64_${pkgver}.bin --mode unattended --apps-select-all true --prefix $srcdir/$_installpath

    # Move .desktop out of the dir about to be copied (avoiding rm), and fix path
    mv "$srcdir/$_installpath/$_desktop" $srcdir/$pkgname.desktop
}

package() {
    sed -i "s#$srcdir/$_installdir##" $srcdir/$pkgname.desktop
    install -D -m0755 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

    # Hardlink to avoid time and space overhead
    cp -ral $srcdir/$_installdir/$_destdir $pkgdir/

    # Since CCS manages its own updates, and treats it's install directory as
    # its working directory, we can't leave it owned by root, so we use a group.
    chmod -R g+rw $pkgdir/$_destdir/$pkgname
    find $pkgdir/$_destdir/$pkgname -type d -exec chmod g+x {} \;

    # Extract path to executable from .desktop
    mkdir -p $pkgdir/usr/bin
    ln -s $(grep 'Exec=' $srcdir/$pkgname.desktop | cut -d'=' -f2) $pkgdir/usr/bin/$pkgname

    # Udev rules for hardware
    # NOTE: not installing Blackhawk rules, since it also requires kernel module
    _rules=("${_scriptsdir}/71-ti-permissions.rules"
            "${_scriptsdir}/70-mm-no-ti-emulators.rules"
            "${_scriptsdir}/99-jlink.rules"
            "61-msp430uif.rules"
            "71-sd-permissions.rules")

    for _rule in "${_rules[@]}"
    do
        install -D -m0644 $srcdir/$_rule $pkgdir/usr/lib/udev/rules.d/$(basename $_rule)
    done

    install -D -m0644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
