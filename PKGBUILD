# Maintainer: Einar Arnason einsiarna@gmail.com

ORG_NAME=jsreport
REPO_NAME=jsreport
LATEST_INFO="$(curl -s https://api.github.com/repos/${ORG_NAME}/${REPO_NAME}/releases/latest)"
TAG=$(echo "$LATEST_INFO" | grep "tag_name" | cut -d'"' -f4)

pkgname=$REPO_NAME-bin
pkgver="${TAG//v/}"
pkgrel=1
pkgdesc="An open-source platform for designing and rendering various reports."
arch=("any")
url="https://github.com/$ORG_NAME/$REPO_NAME"
license=("GNU")
backup=()
provides=("$REPO_NAME" "$REPO_NAME-bin")
conflicts=("$REPO_NAME" "$REPO_NAME-git")
source=(
    "https://github.com/$REPO_NAME/$REPO_NAME/releases/download/$TAG/jsreport-linux.tar.gz"
    "$REPO_NAME.service"
    "$REPO_NAME.config.json"
)
sha256sums=(
    "SKIP"
    "SKIP"
    "SKIP"
)
depends=(nodejs)
makedepends=(yarn npm nodejs git)
optdepends=(phantomjs)
install=$REPO_NAME.install
options=(!strip)

pkgver() {
    echo "${TAG//v/}"
}

package() {
    install -d "${pkgdir}/etc/$REPO_NAME"
    install -d "${pkgdir}/usr/bin"

    install -Dm 755 "$srcdir/$REPO_NAME" "$pkgdir/opt/$REPO_NAME/$REPO_NAME"
    install -Dm 644 "$srcdir/$REPO_NAME.service" "$pkgdir/usr/lib/systemd/system/$REPO_NAME.service"
    install -Dm 644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$REPO_NAME/LICENSE"
    install -Dm 644 "$srcdir/$REPO_NAME.config.json" "$pkgdir/opt/$REPO_NAME/$REPO_NAME.config.json"

    ln -s "/opt/$REPO_NAME/$REPO_NAME" "$pkgdir/usr/bin/$REPO_NAME"
    ln -s "/opt/$REPO_NAME/$REPO_NAME.config.json" "$pkgdir/etc/$REPO_NAME/$REPO_NAME.config.json"
}
