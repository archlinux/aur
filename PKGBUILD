# Maintainer: Einar Arnason einsiarna@gmail.com

ORG_NAME=emqx
REPO_NAME=emqx
LATEST_INFO="$(curl -s https://api.github.com/repos/${ORG_NAME}/${REPO_NAME}/releases/latest)"
TAG=$(echo "$LATEST_INFO" | grep "tag_name" | cut -d'"' -f4)

pkgname=$REPO_NAME-git
pkgver=5.0.3.49
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
depends=(ncurses erlang-nox)
makedepends=(
    cmake
    erlang-nox
    git
    unzip
    systemd
)
optdepends=()
install=$REPO_NAME.install
options=()

pkgver() {
    cd "$srcdir"/$REPO_NAME || exit
    echo "$TAG.$(git rev-list "$TAG"..HEAD --count)" | sed 's/v//g'
}

build() {
    cd "$srcdir/$REPO_NAME" || exit
    export CFLAGS="-fno-pie -no-pie -fPIC"
    make
}

package() {
    install -d "$pkgdir"/usr/bin
    install -d "$pkgdir"/usr/lib/emqx/bin
    install -d "$pkgdir"/usr/lib/emqx/plugins
    install -d "$pkgdir"/usr/lib/emqx/releases
    install -d "$pkgdir"/usr/lib/emqx/lib
    install -d "$pkgdir"/etc/
    install -d "$pkgdir"/var/lib/emqx
    install -d "$pkgdir"/var/log/emqx

    touch "$pkgdir"/usr/lib/emqx/plugins/.keep
    cp -ar "$srcdir"/emqx/_build/emqx/rel/emqx/bin "$pkgdir"/usr/lib/emqx/
    chmod +x "$pkgdir"/usr/lib/emqx/*
    ln -s /usr/lib/emqx/bin/emqx "$pkgdir"/usr/bin/emqx
    ln -s /usr/lib/emqx/bin/emqx_ctl "$pkgdir"/usr/bin/emqx_ctl
    cp -ar "$srcdir"/emqx/_build/emqx/rel/emqx/etc "$pkgdir"/usr/lib/emqx/
    ln -s /usr/lib/emqx/etc "$pkgdir"/etc/emqx
    cp -ar "$srcdir"/emqx/_build/emqx/rel/emqx/data/* "$pkgdir"/var/lib/emqx/
    cp -ar "$srcdir"/emqx/_build/emqx/rel/emqx/lib "$pkgdir"/usr/lib/emqx/
    cp -ar "$srcdir"/emqx/_build/emqx/rel/emqx/releases "$pkgdir"/usr/lib/emqx/
    cp -ar "$srcdir"/emqx/_build/emqx/rel/emqx/erts* "$pkgdir"/usr/lib/emqx/
    install -D -m 644 "$srcdir"/emqx/deploy/packages/emqx.service "$pkgdir"/usr/lib/systemd/system/emqx.service
}
