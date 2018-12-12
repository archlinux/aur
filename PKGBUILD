# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: surefire@cryptomile.net
# Contributor: Martchus <martchus@gmx.net>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

_branch=develop
_pkgname=gogs
_team=github.com/gogs
pkgname=${_pkgname}-dev-git
pkgver=0.11.79.1211+1+f43d21d0a
pkgrel=1
pkgdesc="Self Hosted Git Service in the Go Programming Language. This is the current git version from branch ${_branch}."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
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
source=("${_pkgname}::git+https://${_team}/${_pkgname}.git#branch=${_branch}"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")

prepare() {
    mkdir -p "${srcdir}/src/${_team}"
    mv -v "${srcdir}/${_pkgname}" "${srcdir}/src/${_team}/${_pkgname}"

    cd "$srcdir/src/${_team}/${_pkgname}"

    sed -E -i conf/app.ini \
        -e '0,             /^\[/ s/^(RUN_USER)\W.*$/\1 = gogs/' \
        -e '/^\[server\]/, /^\[/ s/^(STATIC_ROOT_PATH)\W.*$/\1 = \/usr\/share\/gogs/' \
        -e '/^\[log\]/,    /^\[/ s/^(ROOT_PATH)\W.*$/\1 = \/var\/log\/gogs/' \
        ;
}

pkgver() {
    cd "$srcdir/src/${_team}/${_pkgname}"
    printf '%s+%s+%s' \
        $(sed -e 's,/,+,g; s, ,,g' templates/.VERSION) \
        $(git rev-list --count HEAD...$(git log --pretty=format:%H -n 1 -- templates/.VERSION)) \
        $(git rev-parse --short HEAD) \
        ;
}

build() {
    export GOPATH="$srcdir"
    cd "$srcdir/src/${_team}/${_pkgname}"

    go fix
    LDFLAGS='-s -w' make PATH="$GOPATH/bin:$PATH" TAGS='libsqlite3 sqlite pam cert' build
}

package() {
    cd "$srcdir/src/${_team}/${_pkgname}"

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
            'ffd60cd6fa08786e6d53580a43597013753c16a0e7dec93b8ba9aef944f3225e74b032bf8a9819e0a60e1b5fb503b8378b5710d84d5dd52159b91641ee483876')
