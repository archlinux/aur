## Maintainer:     barfin <barfin@protonmail.com>
## Co-Maintainer:  Jaja <jaja@mailbox.org>

## pkginfo
pkgdesc="A fancy custom distribution of Valves Proton with various patches - legacy branch"
pkgname=proton-ge-custom-legacy-bin
pkgver=4.21_GE_2
pkgrel=1
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
depends=('python')
optdepends=('winetricks: protonfixes backend'
            'wine-staging: 32bit prefixes'
            'python-cef: splash dialog support'
            'zenity: splash dialog support'
            'steam: use proton with steam like intended')

## fix naming conventions, matching upstream
_pkgname=${pkgname//-bin/}
_pkgver=${pkgver//_/-}
_srcdir=Proton-${_pkgver}

## paths and files
_protondir=usr/share/steam/compatibilitytools.d/${_pkgver}
_licensedir=usr/share/licenses/${_pkgname}
_pfxdir=var/games/pfx_${_pkgver}
#_configfile=usr/local/etc/proton/user_settings.py
#backup=("${_configfile}")

## sources
url='https://github.com/GloriousEggroll/proton-ge-custom'
source=(${_pkgname}-${_pkgver}.tar.gz::"${url}/releases/download/${_pkgver}/${_srcdir}.tar.gz"
        "supplementary.tar.zst")
md5sums=('19c4163bad6d868ce7990f258369a4c6'
         '07c5abd3c7d734661ac9d889918a5cf3')

prepare() {
## unpack wine
install -d ${_srcdir}/dist
#bsdtar -xf ${_srcdir}/proton_dist.tar.gz -C ${_srcdir}/dist/
#rm ${_srcdir}/proton_dist.tar.gz
}

build() {
## remove unused: dist_lock, extract_tarball(), make_default_prefix()
patch ${_srcdir}/proton patches/distlock-extract-defaultpfx.patch
## setup paths
#sed -i "s|self.path(\"user_settings.py\")|\"/${_configfile}\"|" ${_srcdir}/proton
sed -i "s|self.path(\"dist/share/default_pfx/\")|\"/${_pfxdir}/\"|" ${_srcdir}/proton
}

package() {
## create paths
install -d ${pkgdir}/${_protondir}/
install -d ${pkgdir}/${_licensedir}/
install -d --mode=2775 --group=games ${pkgdir}/${_pfxdir}/
chmod 0775 ${pkgdir}/${_pfxdir}/..
#install -d ${pkgdir}/$(dirname ${_configfile})/
## licenses
mv ${_srcdir}/LICENSE ${pkgdir}/${_licensedir}/license
## config files
#install --mode=0775 --group=games ${srcdir}/configs/user_settings.py ${pkgdir}/${_configfile}
## default pfx
mv ${_srcdir}/dist/share/default_pfx/* ${pkgdir}/${_pfxdir}
chown -R :games ${pkgdir}/${_pfxdir}
## executables
mv ${_srcdir}/* ${pkgdir}/${_protondir}
}
