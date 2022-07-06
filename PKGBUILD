# Maintainer: Einar Arnason einsiarna@gmail.com

ORG_NAME=emqx
REPO_NAME=emqx
LATEST_INFO="$(curl -s https://api.github.com/repos/${ORG_NAME}/${REPO_NAME}/releases/latest)"
TAG=$(echo "$LATEST_INFO" | grep "tag_name" | cut -d'"' -f4)

pkgname=$REPO_NAME-git
pkgver="${TAG//v/}"
pkgrel=1
pkgdesc="EMQX, a distributed, massively scalable, highly extensible MQTT message broker."
arch=('x86_64')
url="https://github.com/$ORG_NAME/$REPO_NAME"
license=('APACHE')
backup=("etc/emqx/emqx.conf")
provides=("$REPO_NAME" "$REPO_NAME-git")
conflicts=("$REPO_NAME" "$REPO_NAME-bin")
source=(
    "git+https://github.com/$ORG_NAME/$REPO_NAME.git"
)
sha256sums=(
    'SKIP'
)
depends=(coreutils ncurses zlib erlang)
makedepends=(
    cmake
    coreutils
    erlang
    git
    unzip
)
optdepends=()
install=$REPO_NAME.install
options=()

pkgver() {
    echo "${TAG//v/}"
}

prepare() {
    cd "$srcdir/$REPO_NAME" || exit
    git checkout "$TAG"
}

build() {
    cd "$srcdir/$REPO_NAME" || exit
    BUILD_WITHOUT_JQ=false make
}

package() {
    install -d "$pkgdir"/usr/lib/emqx/bin
    install -d "$pkgdir"/usr/lib/emqx/plugins
    install -d "$pkgdir"/usr/lib/emqx/releases
    install -d "$pkgdir"/etc/emqx
    install -d "$pkgdir"/var/lib/emqx
    install -d "$pkgdir"/var/log/emqx

    local buildDir="$srcdir"/emqx/_build/emqx/rel/emqx
    touch "$pkgdir"/usr/lib/emqx/plugins/.keep
    find "$buildDir"/bin/ -type f -exec install -D -m 755 {} "$pkgdir/usr/lib/emqx/bin/$(basename "$1")" \;
    find "$buildDir"/etc/ -type f -exec install -D -m 644 {} "$pkgdir/etc/emqx/$(basename "$1")" \;
    find "$buildDir"/data/ -type f -exec install -D -m 644 {} "$pkgdir/var/lib/emqx/$(basename "$1")" \;
    find "$buildDir"/lib/ -type f -exec install -D -m 644 {} "$pkgdir/usr/lib/emqx/$(basename "$1")" \;
    find "$buildDir"/releases/ -type f -exec install -D -m 644 {} "$pkgdir/usr/lib/emqx/$(basename "$1")" \;
    find "$buildDir"/erts*/ -type f -exec install -D -m 644 {} "$pkgdir/usr/lib/emqx/$(basename "$(dirname "$1")")/$(basename "$1")" \;
    install -D -m 644 "$srcdir"/emqx/deploy/packages/emqx.service "$pkgdir"/usr/lib/systemd/system/emqx.service
}
