# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor surefire@cryptomile.net
# Maintainer: Edvinas Valatka <edacval@gmail.com>

_branch=develop
_pkgname=gogs
_team=github.com/gogits
_gogsdir="src/${_team}/${_pkgname}"
pkgname=${_pkgname}-dev-git
pkgver=0.9.158.0218+5+c6990032
pkgrel=1
pkgdesc="Self Hosted Git Service in the Go Programming Language. This is the current git version from branch ${_branch}."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://${_pkgname}.io/"
license=('MIT')
depends=('git' 'sqlite' 'bash')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("gogs-git-dev")
options=('!buildflags' '!strip')
optdepends=(
"mariadb: MariaDB support"
"postgresql: PostgreSQL support"
"redis: Redis support"
"memcached: MemCached support"
"openssh: GIT over SSH support"
)
makedepends=('go' 'git' 'nodejs-less')
install=${_pkgname}.install

source=(
"git+https://${_team}/${_pkgname}.git#branch=${_branch}"
"git+https://github.com/jteeuwen/go-bindata.git" #Because сommunity package is very outdated
"${_pkgname}.service"
"${_pkgname}.tmpfiles"
)

pkgver() {
    cd "$_gogsdir"
    printf '%s+%s+%s' \
        $(<templates/.VERSION) \
        $(git rev-list --count HEAD...$(git log --pretty=format:%H -n 1 -- templates/.VERSION)) \
        $(git rev-parse --short HEAD) \
        ;
}

prepare() {
    export GOPATH="$srcdir"

    mkdir -p ./src/${_team}
    mv    -t ./src/${_team}   ./${_pkgname}

    mkdir -p ./src/github.com/jteeuwen
    mv    -t ./src/github.com/jteeuwen ./go-bindata

    cd "$_gogsdir"

    sed -E -i conf/app.ini \
        -e '0,             /^\[/ s/^(RUN_USER)\W.*$/\1 = gogs/' \
        -e '/^\[server\]/, /^\[/ s/^(STATIC_ROOT_PATH)\W.*$/\1 = \/usr\/share\/gogs/' \
        -e '/^\[log\]/,    /^\[/ s/^(ROOT_PATH)\W.*$/\1 = \/var\/log\/gogs/' \
        ;

    ## Dirty hack
    #sed -i vendor/github.com/go-xorm/xorm/logger.go \
        #   -e '/DEFAULT_LOG_LEVEL/ s/core\.LOG_DEBUG/core.LOG_WARNING/' vendor/github.com/go-xorm/xorm/logger.go \
        #   ;
}


build() {
    export GOPATH="$srcdir"

    cd "$srcdir/src/github.com/jteeuwen/go-bindata/go-bindata"
    go install -v

    cd "$srcdir/$_gogsdir"

    LDFLAGS='-s -w' make PATH="$GOPATH/bin:$PATH" TAGS='libsqlite3 sqlite pam cert' build
}

package() {
    cd "$_gogsdir"

    rm -rf ./public/{less,config.codekit}

    install -d "$pkgdir/usr/share/${_pkgname}"
    cp     -rt "$pkgdir/usr/share/${_pkgname}" ./{templates,public}

    install -Dm0755 -t "$pkgdir/usr/bin"                 ./${_pkgname}

    install -Dm0644 -t "$pkgdir/usr/lib/systemd/system"  "$srcdir/${_pkgname}.service"

    install -Dm0644 "$srcdir/${_pkgname}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"

}

sha512sums=('SKIP'
            'SKIP'
            '9d97d63fb74f9dc824875755e165f6fd11f2529b73b09020f62936a4d3f494102c018444429a20286dc287ad5d301e4e7f4000312ab82e382cd4635ebb0007cf'
            '658935dc129d41b4bfc205ea8e9c225122862431f8b96932942ec345bc23cc7b55644247a8844c1f66bfd16ee35fc9da766f62f07603cbe6d573102edb4222f8')
