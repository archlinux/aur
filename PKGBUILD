# Maintainer: Kimiblock Moe
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ouyang Jun <ouyangjun1999@gmail.com>
# Contributor: Jove Yu <yushijun110 [at] gmail.com>
# Contributor: Ariel AxionL <axionl at aosc dot io>
# Contributor: v71
# Contributor: witt <1989161762 at qq dot com>

pkgbase=wps-office-cn-bwrap
pkgname=('wps-office-cn-bwrap')
pkgver=12.1.2.22570
pkgrel=1
pkgdesc="Kingsoft Office (WPS Office) CN version - an office productivity suite"
makedepends+=(desktop-file-utils)
arch=('x86_64')
license=('LicenseRef-WPS-EULA')
url="https://linux.wps.cn"
options=('!emptydirs')

# https://gitlab.com/cwittlut/wps-tsk/-/blob/main/tsk.sh?ref_type=heads by Ryan Tsien
# https://pastebin.com/29TeRUMj by Asuka Minato
_get_source_url() {
    local furl="https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2023/${pkgver##*.}/wps-office_${pkgver}.AK.preread.sw_474164_$1.deb"
    local uri="${furl#https://wps-linux-personal.wpscdn.cn}"
    local secrityKey='7f8faaaa468174dc1c9cd62e5f218a5b'
    local timestamp10=$(date '+%s')
    local md5hash=$(echo -n "${secrityKey}${uri}${timestamp10}" | md5sum)
    #echo "$md5hash"
    #echo "$md5hash"
    #exit 1
    echo "${furl}?t=${timestamp10}&k=${md5hash%% *}"
}

source_x86_64=("wps-office_${pkgver}_amd64.deb::$(_get_source_url amd64)")
source=("portable-config" "wps-helper")
sha1sums=('27d72f36d5eb12702a10c5f4686e29f7a4398a27'
          'cf90e963dc8d36479d486a1fd87cb554516e8773')
sha1sums_x86_64=('2c96e17f862e033662ce598ad0b9472fcb4f68cc')

prepare() {
    bsdtar -xpf data.tar.xz
    cd "${srcdir}/usr/bin"
    sed -i 's|/opt/kingsoft/wps-office|/usr/lib|' *
    cd "${srcdir}"
}

package_wps-office-cn-bwrap() {
    depends=('fontconfig' 'xorg-mkfontscale' 'libxrender' 'desktop-file-utils' 'shared-mime-info' 'xdg-utils' 'glu' 'sdl2' 'libpulse' 'hicolor-icon-theme' 'libxss' 'sqlite' 'libtool' 'libxslt' 'libjpeg-turbo' "portable")
    optdepends=('cups: Printing support'
                'libjpeg-turbo: JPEG image codec support'
                'pango: for complex (right-to-left) text support'
                'curl: An URL retrieval utility and library'
                'ttf-wps-fonts: Symbol fonts required by wps-office'
                'ttf-ms-fonts: Microsft Fonts recommended for wps-office'
                'wps-office-fonts: FZ TTF fonts provided by wps community'
                'wps-office-mime-cn: Use mime files provided by Kingsoft'
                'wps-office-mui-zh-cn: zh_CN support for WPS Office')
    conflicts=('kingsoft-office' 'wps-office' "wps-office-cn")
    provides=('wps-office' "wps-office-cn")
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

    # Avoid .desktop leaking
    #install -d "${pkgdir}/usr/share/applications"
    #cp -r applications/* "${pkgdir}/usr/share/applications"

    install -d "${pkgdir}/usr/share/desktop-directories"
    cp -r desktop-directories/* "${pkgdir}/usr/share/desktop-directories"

    install -d "${pkgdir}/usr/share/icons"
    cp -r icons/* "${pkgdir}/usr/share/icons"

    install -Dm644 -t "${pkgdir}/usr/share/fonts/wps-office" fonts/wps-office/*
    install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/cn.wps.wps/config"
    sed -i 's|cn.wps.app|cn.wps.wps|g' \
	"${pkgdir}/usr/lib/portable/info/cn.wps.wps/config"
	sed -i 's|WPS-Generic|WPS-WPS|g' \
		"${pkgdir}/usr/lib/portable/info/cn.wps.wps/config"
    install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/cn.wps.wpp/config"

    sed -i 's|cn.wps.app|cn.wps.wpp|g' \
	"${pkgdir}/usr/lib/portable/info/cn.wps.wpp/config"
	sed -i 's|WPS-Generic|WPS-WPP|g' \
		"${pkgdir}/usr/lib/portable/info/cn.wps.wpp/config"
    install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/cn.wps.prometheus/config"
    sed -i 's|cn.wps.app|cn.wps.prometheus|g' \
	"${pkgdir}/usr/lib/portable/info/cn.wps.prometheus/config"
	sed -i 's|WPS-Generic|WPS-Prometheus|g' \
		"${pkgdir}/usr/lib/portable/info/cn.wps.prometheus/config"
    install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/cn.wps.pdf/config"
    sed -i 's|cn.wps.app|cn.wps.pdf|g' \
	"${pkgdir}/usr/lib/portable/info/cn.wps.pdf/config"
	sed -i 's|WPS-Generic|WPS-PDF|g' \
		"${pkgdir}/usr/lib/portable/info/cn.wps.pdf/config"
    install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/cn.wps.et/config"
    sed -i 's|cn.wps.app|cn.wps.et|g' \
	"${pkgdir}/usr/lib/portable/info/cn.wps.et/config"
	sed -i 's|WPS-Generic|WPS-ET|g' \
		"${pkgdir}/usr/lib/portable/info/cn.wps.et/config"

	install -Dm644 \
		"${srcdir}/usr/share/applications/wps-office-wps.desktop" \
		"${pkgdir}/usr/share/applications/cn.wps.wps.desktop"
	desktop-file-edit \
		--set-key=Exec \
		--set-value='env _portableConfig=cn.wps.wps /usr/bin/wps-helper /usr/lib/wps-office-cn-bwrap/wps %u' \
		"${pkgdir}/usr/share/applications/cn.wps.wps.desktop"

	install -Dm644 \
		"${srcdir}/usr/share/applications/wps-office-wpp.desktop" \
		"${pkgdir}/usr/share/applications/cn.wps.wpp.desktop"
	desktop-file-edit \
		--set-key=Exec \
		--set-value='env _portableConfig=cn.wps.wpp /usr/bin/wps-helper /usr/lib/wps-office-cn-bwrap/wpp %u' \
		"${pkgdir}/usr/share/applications/cn.wps.wpp.desktop"

	install -Dm644 \
		"${srcdir}/usr/share/applications/wps-office-prometheus.desktop" \
		"${pkgdir}/usr/share/applications/cn.wps.prometheus.desktop"
	desktop-file-edit \
		--set-key=Exec \
		--set-value='env _portableConfig=cn.wps.prometheus /usr/bin/wps-helper /usr/lib/wps-office-cn-bwrap/wps %u' \
		"${pkgdir}/usr/share/applications/cn.wps.prometheus.desktop"

	install -Dm644 \
		"${srcdir}/usr/share/applications/wps-office-pdf.desktop" \
		"${pkgdir}/usr/share/applications/cn.wps.pdf.desktop"
	desktop-file-edit \
		--set-key=Exec \
		--set-value='env _portableConfig=cn.wps.pdf /usr/bin/wps-helper /usr/lib/wps-office-cn-bwrap/wpspdf %u' \
		"${pkgdir}/usr/share/applications/cn.wps.pdf.desktop"

	install -Dm644 \
		"${srcdir}/usr/share/applications/wps-office-et.desktop" \
		"${pkgdir}/usr/share/applications/cn.wps.et.desktop"
	desktop-file-edit \
		--set-key=Exec \
		--set-value='env _portableConfig=cn.wps.et /usr/bin/wps-helper /usr/lib/wps-office-cn-bwrap/et %u' \
		"${pkgdir}/usr/share/applications/cn.wps.et.desktop"
	install -d "${pkgdir}/usr/lib"
	mv "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/wps-office-cn-bwrap"
	ln -sf /usr/bin/true "${pkgdir}/usr/lib/office6/wpscloudsvr"
	install -Dm755 "${srcdir}/wps-helper" "${pkgdir}/usr/bin/wps-helper"
}
