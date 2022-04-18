# Maintainer: Einar Arnason einsiarna@gmail.com

ORG_NAME=thingsboard
REPO_NAME=thingsboard
LATEST_INFO="$(curl -s https://api.github.com/repos/${ORG_NAME}/${REPO_NAME}/releases/latest)"

pkgname=$REPO_NAME-bin
pkgver=$(echo "$LATEST_INFO" | grep "tag_name" | cut -d'"' -f4 | sed 's/v//g')
pkgrel=1
pkgdesc="ThingsBoard is an open-source IoT platform for data collection, processing, visualization, and device management."
arch=('any')
url="https://github.com/thingsboard/thingsboard"
license=('APACHE')
backup=('etc/thingsboard/conf')
provides=('thingsboard' 'thingsboard-bin')
conflicts=('thingsboard' 'thingsboard-git')
source=("$(echo "$LATEST_INFO" | grep "browser_download_url.*\.deb" | cut -d'"' -f4)")
sha256sums=('SKIP')
depends=(jdk11-openjdk)
install=$REPO_NAME.install

pkgver() {
    echo "$LATEST_INFO" | grep "tag_name" | cut -d'"' -f4 | sed 's/v//g'
}

package() {
    cd "$srcdir" || exit
    tar -xvzf data.tar.gz -C "$pkgdir"
    mv "$pkgdir"/lib "$pkgdir"/usr/
    sed -i '/^[Service].*/a Group=thingsboard\nWorkingDirectory=/usr/share/thingsboard' "$pkgdir"/usr/lib/systemd/system/thingsboard.service
}
