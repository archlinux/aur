# Maintainer:  Alexei Colin <ac at alexeicolin dot com>
# Contributor: Kai Geißdörfer <kai.s.geissdoerfer at campus.tu-berlin.de>

pkgname=ccstudio
_semver=9.2.0
_bldver=00013
pkgver=$_semver.$_bldver
pkgrel=1
pkgdesc="Texas Instruments Code Composer Studio IDE"
arch=('x86_64')
url="http://www.ti.com/tool/ccstudio"
license=('custom:TSPA')

makedepends=('glibc')

# Needed for builtin jxBrowser plugin (otherwise exception exit code 127)
# lib32-glibc needed for installers of some components (C2000 tools)
depends=('gconf' 'python2' 'gtk2' 'libxtst' 'nss' 'libxss' 'alsa-lib' 'lib32-glibc')

# Without some ttf fonts installed, UI is ugly
optdepends=('ttf-dejavu')

# The license file was copy-pasted from the installer's GUI
_archive=CCS${pkgver}_linux-x64
source=("http://software-dl.ti.com/ccs/esd/CCSv9/CCS_$(echo $_semver | sed 's@[.]@_@g')/exports/${_archive}.tar.gz"
        "LICENSE"
        "61-msp430uif.rules"
        "71-sd-permissions.rules")

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

    ./ccs_setup_${pkgver}.bin --mode unattended --prefix $srcdir/$_installpath
}

package() {
    sed -i "s#$srcdir/$_installdir##" "$srcdir/$_installpath/$_desktop"
    install -D -m0755 "$srcdir/$_installpath/$_desktop" $pkgdir/usr/share/applications/$pkgname.desktop

    # Hardlink to avoid time and space overhead
    cp -ral $srcdir/$_installdir/$_destdir $pkgdir/

    # Since CCS manages its own updates, and treats it's install directory as
    # its working directory, we can't leave it owned by root, so we use a group.
    chmod -R g+rw $pkgdir/$_destdir/$pkgname
    chmod -R a+r $pkgdir/$_destdir/$pkgname # fixes permission issues
    find $pkgdir/$_destdir/$pkgname -type d -exec chmod g+x {} \;

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

    for _rule in "${_rules[@]}"
    do
	if [ -e "$_rule" ]
	then
            install -D -m0644 $srcdir/$_rule $pkgdir/usr/lib/udev/rules.d/$(basename $_rule)
	else
	    echo ">>> udev rule $_rule not present, skipping."
	fi
    done

    # Workaround conflict with jlink-software-and-documentation
    mv $pkgdir/usr/lib/udev/rules.d/99-jlink.rules $pkgdir/usr/lib/udev/rules.d/99-ti-jlink.rules

    install -D -m0644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('2ab872dc456d7ea08bf53ae81ff5c6ebebddef66d5bec157e41eaeb127655572'
            'adc0dd74f5b95e373db4b45c74b034ec3d45e2df462b3a1a35f6d56aa8181076'
            '97061c190d86ac2de195e54070d86d8bde34774ea35261942ee44626ca3c23db'
            'ad63fd5e8a11e1ddcbe1d0d56a739f1c2f573a2781e46f4d52b5a93dd5810d1a')
