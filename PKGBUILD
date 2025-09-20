# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ouyang Jun <ouyangjun1999@gmail.com>
# Contributor: Jove Yu <yushijun110 [at] gmail.com>
# Contributor: Ariel AxionL <axionl at aosc dot io>
# Contributor: v71
# Contributor: witt <1989161762 at qq dot com>

pkgbase=wps-office-cn
pkgname=('wps-office-cn' 'wps-office-mime-cn' 'wps-office-mui-zh-cn')
pkgver=12.1.2.22571
pkgrel=1
pkgdesc="Kingsoft Office (WPS Office) CN version - an office productivity suite"
#arch=('x86_64' 'aarch64')
arch=('x86_64')
license=('LicenseRef-WPS-EULA')
url="https://linux.wps.cn"
options=('!emptydirs')
#DLAGENTS=("https::/usr/bin/curl -e https://www.wps.cn/product/wpslinux -o %o %u")

# https://gitlab.com/cwittlut/wps-tsk/-/blob/main/tsk.sh?ref_type=heads by Ryan Tsien
# https://pastebin.com/29TeRUMj by Asuka Minato
_get_source_url() {
    local furl="https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2023/${pkgver##*.}/wps-office_${pkgver}.AK.preread.sw_480057_$1.deb"
    local uri="${furl#https://wps-linux-personal.wpscdn.cn}"
    local secrityKey='7f8faaaa468174dc1c9cd62e5f218a5b'
    local timestamp10=$(date '+%s')
    local md5hash=$(echo -n "${secrityKey}${uri}${timestamp10}" | md5sum)
    #echo "$md5hash"
    #echo "$md5hash"
    #exit 1
    echo "${furl}?t=${timestamp10}&k=${md5hash%% *}"
}

#source_x86_64=("https://mirrors.163.com/ubuntukylin/pool/partner/wps-office_${pkgver}_amd64.deb")
source_x86_64=("wps-office_${pkgver}_amd64.deb::$(_get_source_url amd64)")
#source_aarch64=("wps-office_${pkgver}_arm64.deb::https://pubwps-wps365-obs.wpscdn.cn/download/Linux/21176/wps-office_${pkgver}.AK.preload.sw_arm64.deb")
#source=('fix-wps-python-parse.patch')
sha256sums_x86_64=('681d4458fd04bf95ae02ece2877c9b0f6dea6914535239444b57a66acfac5030')

prepare() {
    bsdtar -xpf data.tar.xz

    cd "${srcdir}/usr/bin"
    sed -i 's|/opt/kingsoft/wps-office|/usr/lib|' *
    [[ "$CARCH" = "aarch64" ]] && sed -i '2a export LD_PRELOAD=/usr/lib/libfreetype.so' *

#   cd "${srcdir}/usr/share/icons/hicolor"
#   for _file in ./*; do
#       if [ -e ${_file}/mimetypes/wps-office2019-etmain.png ]; then
#           mkdir -p ${_file}/apps
#           cp -p ${_file}/mimetypes/wps-office2019* ${_file}/apps
#       fi
#   done

    cd "${srcdir}"
    #patch -Np1 -i "${srcdir}/fix-wps-python-parse.patch"
}

package_wps-office-cn() {
    depends=('fontconfig' 'xorg-mkfontscale' 'libxrender' 'desktop-file-utils' 'shared-mime-info' 'xdg-utils' 'glu' 'sdl2' 'libpulse' 'hicolor-icon-theme' 'libxss' 'sqlite' 'libtool' 'libxslt' 'libjpeg-turbo')
    optdepends=('cups: for printing support'
                'libjpeg-turbo: JPEG image codec support'
                'pango: for complex (right-to-left) text support'
                'curl: An URL retrieval utility and library'
                'ttf-wps-fonts: Symbol fonts required by wps-office'
                'ttf-ms-fonts: Microsft Fonts recommended for wps-office'
                'wps-office-fonts: FZ TTF fonts provided by wps community'
                'wps-office-mime-cn: Use mime files provided by Kingsoft'
                'wps-office-mui-zh-cn: zh_CN support for WPS Office')
    install="${pkgname}.install"
    conflicts=('kingsoft-office' 'wps-office')
    provides=('wps-office')
    cd "${srcdir}/opt/kingsoft/wps-office/"

    install -d "${pkgdir}/usr/lib"
    cp -r office6 "${pkgdir}/usr/lib"
    # Fix for icu>=71.1
    rm "${pkgdir}/usr/lib/office6/libstdc++.so"*
    # Use system libjpeg
    rm "${pkgdir}/usr/lib/office6/libjpeg.so"*
    [[ "$CARCH" = "aarch64" ]] && rm "${pkgdir}"/usr/lib/office6/libfreetype.so*
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" office6/mui/default/*.html
    rm -r "${pkgdir}/usr/lib/office6/mui/en_US/resource/help"
    rm -r "${pkgdir}/usr/lib/office6/mui/zh_CN"

    install -d "${pkgdir}/usr/bin"
    cd "${srcdir}/usr/bin"
    install -m755 * "${pkgdir}/usr/bin"

    cd "${srcdir}/usr/share"

    install -d "${pkgdir}/usr/share/applications"
    cp -r applications/* "${pkgdir}/usr/share/applications"

    install -d "${pkgdir}/usr/share/desktop-directories"
    cp -r desktop-directories/* "${pkgdir}/usr/share/desktop-directories"

    install -d "${pkgdir}/usr/share/icons"
    cp -r icons/* "${pkgdir}/usr/share/icons"

    install -Dm644 -t "${pkgdir}/usr/share/fonts/wps-office" fonts/wps-office/*

    install -Dm644 -t "${pkgdir}/etc/xdg/menus/applications-merged" "${srcdir}/etc/xdg/menus/applications-merged/wps-office.menu"
}

package_wps-office-mui-zh-cn() {
    pkgdesc="Chinese (Simplified) mui package for WPS Office"
    arch=('any')
    cd "${srcdir}/opt/kingsoft/wps-office/office6/mui"

    install -d "${pkgdir}/usr/lib/office6/mui/en_US/resource"
    cp -r en_US/resource/help "${pkgdir}/usr/lib/office6/mui/en_US/resource"
    cp -r zh_CN "${pkgdir}/usr/lib/office6/mui"

    cd "${srcdir}/opt/kingsoft/wps-office/"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" office6/mui/default/*.html
}

package_wps-office-mime-cn() {
    pkgdesc="Mime files provided by Kingsoft Office (WPS Office) cn version"
    arch=('any')
    depends=('shared-mime-info')
    conflicts=('wps-office-mime')
    provides=('wps-office-mime')
    cd "${srcdir}/usr/share"

    install -d "${pkgdir}/usr/share/mime"
    cp -r mime/* "${pkgdir}/usr/share/mime"
    
    cd "${srcdir}/opt/kingsoft/wps-office/"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" office6/mui/default/*.html

    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
}
