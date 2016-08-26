pkgname=('rspamd-git')
_srcname='rspamd'
pkgdesc='Rapid spam filtering system'
pkgver='r1'
pkgrel='1'
arch=('i686' 'x86_64')
url="https://github.com/vstakhov/${_srcname}"
license=('Apache')

depends=('openssl' 'libevent' 'glib2' 'gmime' 'luajit' 'sqlite' 'hiredis' 'file')
makedepends=('git' 'cmake' 'pkgconfig' 'ragel')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

build() {
    cd "${srcdir}/${_srcname}"

    cmake \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCONFDIR='/etc/rspamd' \
        -DRUNDIR='/run/rspamd' \
        -DDBDIR='/var/lib/rspamd' \
        -DLOGDIR='/var/log/rspamd' \
        -DWANT_SYSTEMD_UNITS='ON' \
        .

    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make DESTDIR="${pkgdir}" install
}
