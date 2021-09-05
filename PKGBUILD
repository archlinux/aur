# Maintainer: Maarten de Boer <maarten@cloudstek.nl>
# Contributor: Shining Xu <skyfiretime@gmail.com>

pkgname=timecamp-bin
pkgver=1.7.2.0
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
    "timecamp-${pkgver}.tar.gz::https://timecamp.s3.amazonaws.com/downloadsoft/${pkgver}/TimeCampSetup_LinAmd64.tar.gz"
    'LICENSE.html'
)

sha256sums=('0429a006ff65d421d3041c5806e514971a95cefa554e5916337a30cc92e70650'
            '47c5c4cefd061e1f4f2d2fbeaf49b3c13954dce3582e35e6eda732d2e55287fa')

prepare() {
    ar x timecamp.deb
}

package() {
    tar xzf data.tar.gz -C "$pkgdir"

    # Install license
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/timecamp" LICENSE.html

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
