# Maintainer: Shining Xu <skyfiretime@gmail.com>

pkgname=timecamp-bin
pkgver=1.4.6.2
pkgrel=2
pkgdesc='Client application for TimeCamp software (Binary).'
arch=('x86_64')
url='https://www.timecamp.com/en/desktop-app'
license=('custom')
depends=('libappindicator-gtk2' 'libnotify' 'libsm' 'libxss')
makedepends=('binutils' 'imagemagick')
provides=('timecamp')
options=('!strip' '!emptydirs')
source=(
    "https://timecamp.s3.amazonaws.com/downloadsoft/${pkgver}/TimeCampSetup_LinAmd64.tar.gz"
    'LICENSE.html::https://docs.google.com/document/d/e/2PACX-1vSj_4_AJgXCuyKze5XFckN9-DwR8Jobo5lUyrgimRgKXjgpGdxUkFetSK8Nogxe7YkuPySCpUhRfrjz/pub?embedded=true'
)
md5sums=(
    '10c0a76dd883e9e39fadcb6da5e7dc91'
    '11ba2f09367a42afed608efd8742045d'
)

prepare() {
    ar x timecamp.deb
}

package() {
    # Extract package data
    tar xzf data.tar.gz -C "$pkgdir"

    install -Dm 644 -t "$pkgdir"/usr/share/licenses/timecamp LICENSE.html

    cd "$pkgdir"
    install -Dt usr/bin usr/share/timecamp/timecamp
    # set the working directory to /usr/share/timecamp in the desktop entry
    # so that it can find its icons
    sed -i 's_Exec=/usr/share/timecamp/timecamp_Exec=cd /usr/share/timecamp \&\& timecamp_' \
        usr/share/applications/timecamp.desktop

    # install icons from ico file
    convert usr/share/timecamp/icons/programicon.ico timecamp.png
    local size=256
    for i in `seq 0 4`; do
        install -Dm 644 timecamp-$i.png \
            usr/share/icons/hicolor/${size}x${size}/apps/timecamp.png
        size=$(($size / 2))
    done

    sed -i 's_Icon=/usr/share/timecamp/icons/programicon.ico_Icon=timecamp_' \
        usr/share/applications/timecamp.desktop
    rm timecamp-*.png usr/share/timecamp/timecamp
}
