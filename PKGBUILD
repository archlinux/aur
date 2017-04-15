# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: surefire@cryptomile.net
# Maintainer: Edvinas Valatka <edacval@gmail.com>

_branch=develop
_pkgname=gogs
_team=github.com/gogits
_gogsdir="src/${_team}/${_pkgname}"
pkgname=${_pkgname}-dev-git
pkgver=0.11.9.0407+0+6500aafcb
pkgrel=1
pkgdesc="Self Hosted Git Service in the Go Programming Language. This is the current git version from branch ${_branch}."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://${_pkgname}.io/"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('git')
options=('!buildflags' '!strip')
optdepends=("sqlite: SQLite support"
            "mariadb: MariaDB support"
            "postgresql: PostgreSQL support"
            "redis: Redis support"
            "memcached: MemCached support"
            "openssh: GIT over SSH support"
            "bash: GIT over SSH support"
)
makedepends=('git' 'go' 'go-bindata' 'nodejs-less' 'sqlite')
install=${_pkgname}.install

source=(
        "git+https://${_team}/${_pkgname}.git#branch=${_branch}"
        "${_pkgname}.service"
        "${_pkgname}.tmpfiles"
)
sha512sums=('SKIP'
            'c872a0c7e33c3385828af58633f194628098841adb32506fdb95d0554ecae2a472915d3fb4a964b44bf8f14e87516f50f77fbec9a3efd10bfb2f5246d294a186'
            '658935dc129d41b4bfc205ea8e9c225122862431f8b96932942ec345bc23cc7b55644247a8844c1f66bfd16ee35fc9da766f62f07603cbe6d573102edb4222f8')

prepare() {
    export GOPATH="$srcdir"

    mkdir -p ./src/${_team}
    mv    -t ./src/${_team}   ./${_pkgname}

    cd "$srcdir/$_gogsdir"

    sed -E -i conf/app.ini \
        -e '0,             /^\[/ s/^(RUN_USER)\W.*$/\1 = gogs/' \
        -e '/^\[server\]/, /^\[/ s/^(STATIC_ROOT_PATH)\W.*$/\1 = \/usr\/share\/gogs/' \
        -e '/^\[log\]/,    /^\[/ s/^(ROOT_PATH)\W.*$/\1 = \/var\/log\/gogs/' \
        ;
}

pkgver() {
    cd "$_gogsdir"
    printf '%s+%s+%s' \
        $(sed -e 's,/,+,g; s, ,,g' templates/.VERSION) \
        $(git rev-list --count HEAD...$(git log --pretty=format:%H -n 1 -- templates/.VERSION)) \
        $(git rev-parse --short HEAD) \
        ;
}

build() {
    export GOPATH="$srcdir"

    cd "$srcdir/$_gogsdir"

    LDFLAGS='-s -w' make PATH="$GOPATH/bin:$PATH" TAGS='libsqlite3 sqlite pam cert' build
}

package() {
    cd "$srcdir/$_gogsdir"

    rm -rf ./public/{less,config.codekit}

    install -Dm0644 ./conf/app.ini "$pkgdir/usr/share/${_pkgname}/conf/app.ini.default"
    cp     -rt "$pkgdir/usr/share/${_pkgname}" ./{templates,public}

    install -Dm0755 -t "$pkgdir/usr/bin"                 ./${_pkgname}
    install -Dm0644 -t "$pkgdir/usr/share/licenses/gogs" ./LICENSE
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/system"  "$srcdir/${_pkgname}.service"

    install -Dm0644 "$srcdir/${_pkgname}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
