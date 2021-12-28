## Maintainer:     barfin <barfin@protonmail.com>
## Co-Maintainer:  Jaja <jaja@mailbox.org>
## Co-Maintainer:  floriplum <floriplum@mailbox.org>

## pkginfo
pkgdesc="A fancy custom distribution of Valves Proton with various patches"
pkgname=proton-ge-custom-bin
pkgver=7.0rc3_GE_1
pkgrel=1
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
changelog=changelog
provides=('proton' "proton-ge-custom=${pkgver/_/.}")
conflicts=('proton-ge-custom-stable-bin' 'proton-ge-custom')
depends=('python'
         'vulkan-icd-loader')
optdepends=('kdialog: KDE splash dialog support'
            'zenity: GNOME splash dialog support'
            'python-kivy: splash dialog support (big picture mode)'
            'steam: use proton with steam like intended'
            'lib32-vulkan-icd-loader: dxvk dependency for 32bit prefixes'
            'vulkan-driver: actually have a vulkan driver installed'
            'linux-fsync: a kernel with futex-wait-multiple support'
            'linux-zen: a kernel with futex-wait-multiple support'
            'linux-pf: a kernel with futex-wait-multiple support'
            'winetricks: protonfixes backend - highly recommended'
            'wine: support for 32bit prefixes'
            'xboxdrv: gamepad driver service'
            'python-cef: generic splash dialog support')

## makepkg options
options=('!strip')

## fix naming conventions, matching upstream
_pkgname=${pkgname//-bin/}
_pkgver=${pkgver//_/-}
_srcdir=Proton-${_pkgver}

## paths and files
_protondir=usr/share/steam/compatibilitytools.d/${_pkgname}
_licensedir=usr/share/licenses/${_pkgname}
_execfile=usr/bin/proton
_protoncfg=${_protondir}/user_settings.py

## user edited files to backup
backup=("${_protoncfg}")

## sources
url='https://github.com/GloriousEggroll/proton-ge-custom'
source=(${_pkgname}-${_pkgver}_${pkgrel}.tar.gz::"${url}/releases/download/${_pkgver}/${_srcdir}.tar.gz"
        "supplementary.tar.zst")
sha512sums=('e4e5e019023ea233341ddcdf62efd6f5396ef8aa7920602403d7bdd5af40e779252369a3f979d83dcd9424642b399b67cb710531ec6cf9066ae843f00756872b'
            '9925a9972a9bed9b9e71c2aa169db03eeb72307336c3ed004434397deb379b55eb13b249ca9c0b28f48dd5ea728a1ad32685b84e2dcab881ba428c2acb7bc58d')

build() {
## setup paths
sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" ${srcdir}/launchers/proton.sh
sed -i -r 's|"Proton-.*"|"Proton-GE"|' ${srcdir}/Proton-${_pkgver}/compatibilitytool.vdf
}

package() {
## create paths
install -d ${pkgdir}/${_protondir}/
install -d ${pkgdir}/${_licensedir}/
install -d ${pkgdir}/$(dirname ${_execfile})/
## licenses
mv ${_srcdir}/LICENSE ${pkgdir}/${_licensedir}/license
mv ${_srcdir}/LICENSE.OFL ${pkgdir}/${_licensedir}/license_OFL
mv ${_srcdir}/protonfixes/LICENSE ${pkgdir}/${_licensedir}/license_protonfixes
## config files
install --mode=0775 --group=50 ${srcdir}/configs/user_settings.py ${pkgdir}/${_protoncfg}
## executables
mv ${_srcdir}/* ${pkgdir}/${_protondir}
install --mode=0755 ${srcdir}/launchers/proton.sh ${pkgdir}/${_execfile}
}
