# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=dida-nativefier
pkgdesc="滴答清单 for Linux（使用 nativefier 构建）"
pkgver=1.0.0
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'pentium4')
url="https://dida365.com/"
license=('custom')

_electronv= # See todoist-nativefier for rationale
depends=("electron${_electronv}")
makedepends=('imagemagick'
    'nodejs-nativefier'
    'gendesk'
)

_appname=("滴答清单")
_pressfile=("press.zip")
_icon=("press-dida/Logo/Dida-Logo.png")
source=("${_pressfile}::https://s3.cn-north-1.amazonaws.com.cn/appest-public/download/press.zip")
sha256sums=('2dc9722cf147f53741fbe5e0de246b2f7c18397a619897cb0446a14d88d85020')

prepare() {
    cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron${_electronv} /usr/share/${pkgname} "\$@"
EOF
    gendesk \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${_appname}" \
        --categories "Network;Office;ProjectManagement;Utility" \
        -n \
        -f
}

build() {
    cd $srcdir

    nativefier \
        --name "${_appname}" \
        --icon "${_icon}" \
        --width "800px" \
        --height "600px" \
        --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0" \
        --verbose \
        --single-instance \
        --disable-dev-tools \
        --tray \
        https://dida365.com/signin
}


package() {
    mkdir -p "${pkgdir}/usr/share"

    _distdir=`ls ${srcdir} | grep "^${_appname}-linux"`
    cp -r "${_distdir}/resources/app" "${pkgdir}/usr/share/${pkgname}"

    install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_distdir}/LICENSE"

	_iconpath="${srcdir}/${_icon}"
	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    	install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    	convert "${_iconpath}" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  	done
}
