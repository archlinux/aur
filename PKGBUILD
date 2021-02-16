# Maintainer: Maarten de Boer <maarten@cloudstek.nl>

pkgname=timecamp-bin
pkgver=1.7.1.6
pkgrel=1
pkgdesc='Client application for TimeCamp software (Binary).'
arch=('x86_64')
url='https://www.timecamp.com/en/desktop-app'
license=('custom')
depends=('libappindicator-gtk2' 'libnotify' 'libxss' 'libsm')
makedepends=()
provides=('timecamp')
options=()

source=(
    "https://timecamp.s3.amazonaws.com/downloadsoft/${pkgver}/TimeCampSetup_LinAmd64.tar.gz"
    'LICENSE.html::https://docs.google.com/document/d/e/2PACX-1vSj_4_AJgXCuyKze5XFckN9-DwR8Jobo5lUyrgimRgKXjgpGdxUkFetSK8Nogxe7YkuPySCpUhRfrjz/pub?embedded=true'
)

sha256sums=(
	'a7ac692f04ccb6ef31bdac21eb34a72be14366df89ac771480ca85480413bd4d'
	'SKIP'
)

prepare() {
    ar x timecamp.deb
}

package() {
    tar xzf data.tar.gz -C "$pkgdir"

    # Install license
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.html

    # Move binary to /usr/bin
    install -Dm 755 -t "${pkgdir}/usr/bin" "${pkgdir}/usr/share/timecamp/timecamp"
    rm -f "${pkgdir}/usr/share/timecamp/timecamp"
    sed -i 's|Exec=/usr/share/timecamp/timecamp|Exec=/usr/bin/timecamp|' "${pkgdir}/usr/share/applications/timecamp.desktop"

    # Install icons
    for icon_size in 1024 512 256 128 96 64 48 32 24 16; do
    	icon_dir="${icon_size}x${icon_size}"
    	install -Dm 644 -t "${pkgdir}/usr/share/icons/hicolor/${icon_dir}/apps" "${pkgdir}/usr/share/timecamp/icons/hicolor/${icon_dir}/apps/timecamp.png"
    done

    # Set correct icon
    sed -i 's|Icon=/usr/share/timecamp/icons/tc.png|Icon=timecamp|' "${pkgdir}/usr/share/applications/timecamp.desktop"

    # Set working directory
    echo "Path=/usr/share/timecamp" >> "${pkgdir}/usr/share/applications/timecamp.desktop"
}
