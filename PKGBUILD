# Maintainer:  Davide Ferrero <bad dot deid at gmail dot com>
# Contributor: Kai Geißdörfer <kai.s.geissdoerfer at campus.tu-berlin.de>
# Contributor: Amr Okasha <amradel55 at gmail.com>

pkgname=ccstudio
_semver=12.6.0
_bldver=00008
pkgver=$_semver.$_bldver
pkgrel=1
pkgdesc="Texas Instruments Code Composer Studio IDE"
arch=('x86_64')
url="http://www.ti.com/tool/ccstudio"
license=('custom:TSPA')

makedepends=('glibc')

# Needed for builtin jxBrowser plugin (otherwise exception exit code 127)
# lib32-glibc needed for installers of some components (C2000 tools)
#!! 'ncurses5-compat-libs' and 'gconf' are aur packages
depends=('python2' 'gtk2' 'gtk3' 'libxtst' 'nss' 'libxss' 'alsa-lib' 'lib32-glibc' 'ncurses5-compat-libs' 'libusb-compat' 'libsecret' 'libcanberra' 'gconf' 'binutils')

# Without some ttf fonts installed, UI is ugly
optdepends=('ttf-dejavu')

# The license file was copy-pasted from the installer's GUI
_archive=CCS${pkgver}_linux-x64
source=("https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/${_semver}/${_archive}.tar.gz"
"LICENSE"
"61-msp430uif.rules"
"71-sd-permissions.rules"
)

install=$pkgname.install

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_desktop="Code Composer Studio ${_semver}.desktop"

_destdir=opt
_installdir=installdir
_installpath=$_installdir/$_destdir/$pkgname
_scriptsdir=$_installpath/ccs/install_scripts

build() {
    cd $srcdir/${_archive}

    echo ">>> Tip: to avoid waiting for compression, build an uncompresed tar archive:"
    echo ">>>     PKGEXT='.pkg.tar' makepkg"
    echo

    echo ">>> Executing installer. You can monitor progress in files in this directory:"
    echo ">>>     ${srcdir}/${_installpath}/ccs/install_logs/*/"

    # Can't run this in package, because running as fakeroot breaks it:
    #    CCS_INFO: error message: dlsym(acl_get_fd): /usr/lib32/libfakeroot/libfakeroot.so: undefined symbol: acl_get_fd
    # NOTE: ti_cgt_c2000_16.9.3.LTS_linux_installer_x86.bin is executed under fakeroot, this error is simply printed,
    #       but is not fatal. But, when the whole CCS installer is run under fakeroot is
    HOME="$srcdir/fakehome" ./ccs_setup_${pkgver}.run --mode unattended --prefix $srcdir/$_installpath

}

package() {

    # correct the files that refer to the srcdir because the setup didn't run under fakeroot
    sed -i "s#$srcdir/$_installdir##g" "$srcdir/$_installpath/$_desktop"
    find $srcdir/$_installpath/ccs/install_scripts/uninstall_drivers.sh -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##" 
    find $srcdir/$_installpath/ccs/install_scripts/install_drivers.sh -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##" 
    find $srcdir/$_installpath/ccs/tools/compiler/dmed/dmed.xml -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##" 
    find $srcdir/$_installpath/ccs/eclipse/ccs.properties -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##" 
    find $srcdir/$_installpath/ccs/eclipse/p2/org.eclipse.equinox.p2.engine/profileRegistry/epp.package.cpp.profile/.data/.settings/org.eclipse.equinox.p2.artifact.repository.prefs -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##" 
    find $srcdir/$_installpath/ccs/eclipse/p2/org.eclipse.equinox.p2.engine/profileRegistry/epp.package.cpp.profile/.data/.settings/org.eclipse.equinox.p2.metadata.repository.prefs -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##" 
    find $srcdir/$_installpath/ccs/eclipse/plugins/com.ti.ccstudio.base_*/properties -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##" 
    find $srcdir/$_installpath/ccs/eclipse/configuration/org.eclipse.osgi/*/data/*/*.xml -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##" 
    find $srcdir/$_installpath/ccs/eclipse/configuration/org.eclipse.osgi/*/data/timestamps* -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##"
    find $srcdir/$_installpath/ccs/eclipse/configuration/org.eclipse.osgi/*/data/cache.timestamps -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##"
    find $srcdir/$_installpath/ccs/eclipse/configuration/ccs.properties -print0 | xargs -0 sed -i "s#$srcdir/$_installdir##" 

    # Bug corrections
    find $srcdir/$_installpath/ccs/eclipse/ccstudio.ini -print0 | xargs -0 sed -i '1,2d'

    install -D -m0644 "$srcdir/$_installpath/$_desktop" $pkgdir/usr/share/applications/$pkgname.desktop

    # Hardlink to avoid time and space overhead
    cp -ral $srcdir/$_installdir/$_destdir $pkgdir/

    # Since CCS manages its own updates, and treats it's install directory as
    # its working directory, we can't leave it owned by root, so we use a group.
    chmod -R g+rw $pkgdir/$_destdir/$pkgname
    chmod -R a+r $pkgdir/$_destdir/$pkgname # fixes permission issues
    find $pkgdir/$_destdir/$pkgname -type d -print0 | xargs -0 chmod g+x 

    # Extract path to executable from .desktop
    mkdir -p $pkgdir/usr/bin
    ln -f -s $(grep 'Exec=' "$srcdir/$_installpath/$_desktop" | cut -d'=' -f2) $pkgdir/usr/bin/$pkgname

    # Udev rules for hardware
    # NOTE: not installing Blackhawk rules, since it also requires kernel module
    _rules=("${_scriptsdir}/71-ti-permissions.rules"
        "${_scriptsdir}/70-mm-no-ti-emulators.rules"
        "${_scriptsdir}/99-jlink.rules"
        "61-msp430uif.rules"
        "71-sd-permissions.rules")

    for _rule in "${_rules[@]}"; do
        if [ -e "$_rule" ]; then
            install -D -m0644 $srcdir/$_rule $pkgdir/usr/lib/udev/rules.d/$(basename $_rule)
        else
            echo ">>> udev rule $_rule not present, skipping."
        fi
    done

    # Workaround conflict with jlink-software-and-documentation
    mv $pkgdir/usr/lib/udev/rules.d/99-jlink.rules $pkgdir/usr/lib/udev/rules.d/99-ti-jlink.rules

    install -D -m0644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('f44a90713b57acee82eac9c0881cffdd'
         'cf7222e486f8f1d2a0f99d3d946e1f01'
         '7c570e9f93da6f01986285db81d497ef'
         'af8a8c199be432919b4ca66106591c25')
