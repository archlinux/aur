## Maintainer:     barfin <barfin@protonmail.com>
## Co-Maintainer:  Jaja <jaja@mailbox.org>

pkgname=proton-ge-custom-bin
pkgver=5.2_GE_2
pkgrel=1
pkgdesc="A fancy custom distribution of Valves Proton with various patches"
arch=('any')
url='https://github.com/GloriousEggroll/proton-ge-custom'
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
depends=(steam)
optdepends=('winetricks: protonfixes backend'
            'wine-staging: 32bit prefixes')
source=(${pkgname}-${pkgver//_/-}.tar.gz::"${url}/releases/download/${pkgver//_/-}/Proton-${pkgver//_/-}.tar.gz"
        "supplementary.tar.zst")
md5sums=('457c948807ecd47c4c4e692485513064'
         '732f822ca65b838808d79eec6696fa6d')

## naming conventions
_pkgname=${pkgname//-bin/}
_pkgver=${pkgver//_/-}
_srcdir=Proton-${_pkgver}

prepare() {
## unpack wine
install -d ${_srcdir}/dist
bsdtar -xf ${_srcdir}/proton_dist.tar.gz -C ${_srcdir}/dist/
rm ${_srcdir}/proton_dist.tar.gz
## create empty config file
cat <<EOF > ${_srcdir}/user_settings.py
user_settings = {}
EOF
## remove: dist_lock, extract_tarball, make_default_prefix
patch ${_srcdir}/proton distlock-extract-defaultpfx.patch >/dev/null
}

package() {
## paths in pkgdir
local _protondir=${pkgdir}/usr/share/steam/compatibilitytools.d/${_pkgver}
install -d ${_protondir}/
local _licensedir=${pkgdir}/usr/share/licenses/${_pkgname}
install -d ${_licensedir}/
## licenses
mv ${_srcdir}/LICENSE ${_licensedir}/license
mv ${_srcdir}/LICENSE.OFL ${_licensedir}/license_OFL
mv ${_srcdir}/protonfixes/LICENSE ${_licensedir}/license_protonfixes
## proton executables
mv ${_srcdir}/* ${_protondir}
}