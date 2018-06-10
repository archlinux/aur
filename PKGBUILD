# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: surefire@cryptomile.net
# Maintainer: Edvinas Valatka <edacval@gmail.com>

_branch=develop
_pkgname=gogs
_team=github.com/gogs
_gogsdir="${_team}/${_pkgname}"
pkgname=${_pkgname}-dev-git
pkgver=0.11.55.0609+3+459c8be94
pkgrel=1
pkgdesc="Self Hosted Git Service in the Go Programming Language. This is the current git version from branch ${_branch}."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://${_pkgname}.io"
license=('MIT')
depends=('git' 'pam')
optdepends=("sqlite: SQLite support"
            "mariadb: MariaDB support"
            "postgresql: PostgreSQL support"
            "redis: Redis support"
            "memcached: MemCached support"
            "openssh: GIT over SSH support"
            "bash: GIT over SSH support")
makedepends=('git' 'go' 'go-bindata-git' 'nodejs-less' 'sqlite')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!buildflags' '!strip' 'emptydirs')
install=${_pkgname}.install

source=("git+https://${_team}/${_pkgname}.git#branch=${_branch}"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")

prepare() {
    export GOPATH="$srcdir"

    mkdir -p "$srcdir/${_team}"
    mv -v -t "$srcdir/${_team}"   ./${_pkgname}

    cd "$srcdir/$_gogsdir"

    sed -E -i conf/app.ini \
        -e '0,             /^\[/ s/^(RUN_USER)\W.*$/\1 = gogs/' \
        -e '/^\[server\]/, /^\[/ s/^(STATIC_ROOT_PATH)\W.*$/\1 = \/usr\/share\/gogs/' \
        -e '/^\[log\]/,    /^\[/ s/^(ROOT_PATH)\W.*$/\1 = \/var\/log\/gogs/' \
        ;
}

pkgver() {
    cd "$srcdir/$_gogsdir"
    printf '%s+%s+%s' \
        $(sed -e 's,/,+,g; s, ,,g' templates/.VERSION) \
        $(git rev-list --count HEAD...$(git log --pretty=format:%H -n 1 -- templates/.VERSION)) \
        $(git rev-parse --short HEAD) \
        ;
}

build() {
    export GOPATH="$srcdir"

    cd "$srcdir/$_gogsdir"

    go fix
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
    install -Dm0644 "$srcdir/${_pkgname}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
}

sha512sums=('SKIP'
            '26fa3b9579ec2780e56f4a52870461b9cc1e4c1608e006b0759de7c5de137895d48e94a1694341b545be0dae87c966a982d8b581397d56fad83ab12e297f98df'
            '0a546902ffb9fe99f61b301183059cc85c75408cd735f04ee93829ad6e3d66a07ebc73ce663743f109ea6303c1815933a17fe2b83bf9104d1528acb5aa63faf8'
            'a48c51665079575aa9e4774e9d6ccaf15880c81d3d8d77dbcc0871133be7907177694986f12a5d880aa1930a636ca42b5ccb2dbb91874ad9f3c31fa6e5218c6b')
