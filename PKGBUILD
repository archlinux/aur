## Maintainer:     barfin <barfin@protonmail.com>
## Co-Maintainer:  Jaja <jaja@mailbox.org>

## pkginfo
pkgdesc="A fancy custom distribution of Valves Proton with various patches (stable branch)"
pkgname=proton-ge-custom-stable-bin
pkgver=5.11_GE_2_MF
pkgrel=1
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
changelog=changelog
provides=('proton')
conflicts=('proton-ge-custom-bin')
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
_pfxdir=var/games/pfx_${_pkgname}
_execfile=usr/local/bin/proton
_protoncfg=${_protondir}/user_settings.py

## user edited files to backup
backup=("${_protoncfg}")

## sources
url='https://github.com/GloriousEggroll/proton-ge-custom'
source=(${_pkgname}-${_pkgver}.tar.gz::"${url}/releases/download/${_pkgver}/${_srcdir}.tar.gz"
        "supplementary.tar.zst")
md5sums=('4f526fd1579146512cf47d5244f9f479'
         '757d3936d17804f36bc7357b29b2f6b4')

build() {
## setup paths
sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" ${srcdir}/launchers/proton.sh
sed -i "s|self.path(\"dist/share/default_pfx/\")|\"/${_pfxdir}/\"|" ${_srcdir}/proton
}

package() {
## create paths
install -d ${pkgdir}/${_protondir}/
install -d ${pkgdir}/${_licensedir}/
install -d --mode=2775 --group=games ${pkgdir}/${_pfxdir}/
chmod 0775 ${pkgdir}/${_pfxdir}/..
install -d ${pkgdir}/$(dirname ${_execfile})/
## licenses
mv ${_srcdir}/LICENSE ${pkgdir}/${_licensedir}/license
mv ${_srcdir}/LICENSE.OFL ${pkgdir}/${_licensedir}/license_OFL
mv ${_srcdir}/protonfixes/LICENSE ${pkgdir}/${_licensedir}/license_protonfixes
## config files
install --mode=0775 --group=games ${srcdir}/configs/user_settings.py ${pkgdir}/${_protoncfg}
## default pfx
mv ${_srcdir}/dist/share/default_pfx/* ${pkgdir}/${_pfxdir}
chown -R :games ${pkgdir}/${_pfxdir}
## executables
mv ${_srcdir}/* ${pkgdir}/${_protondir}
install --mode=0755 ${srcdir}/launchers/proton.sh ${pkgdir}/${_execfile}
}
