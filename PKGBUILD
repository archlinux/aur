pkgname=cms-germany-git
pkgver=r3802.4d519c16
pkgrel=3
pkgdesc="CMS, or Contest Management System, is a distributed system for running and (to some extent) organizing a programming contest. This is a fork used for the German IOI team selection process."
arch=('i686' 'x86_64')
url="https://github.com/ioi-germany/cms"
license=('AGPL3')
depends=(
    'python2'
    'python2-tornado'
    'python2-psycopg2'
    'python2-sqlalchemy'
    'python2-netifaces'
    'python2-crypto'
    'python2-pytz'
    'python2-psutil'
    'python2-six'
    'python2-requests'
    'python2-gevent'
    'python2-werkzeug'
    'patool-py2'
    'python2-bcrypt'
    'python2-chardet'
    'python2-ipaddress'
    'python2-yaml'
    'postgresql'
    'postgresql-client'
    'libcgroup'
    'iso-codes'
    'shared-mime-info'
    'python2-pathlib'
    'asymptote'
    'texlive-core'
    'texlive-fontsextra'
    'texlive-latexextra'
    'texlive-pstricks'
    'libcap'
)
optdepends=(
    'python2-pycups: printing support'
    'python2-pypdf: printing support'
    'a2ps: printing support'
    'fpc: support for Pascal submissions'
    'jdk8-openjdk: support for Java submissions'
)
makedepends=(
    'asciidoc'
    'python2-setuptools'
)

provides=('cms-germany' 'isolate-germany')
conflicts=('cms' 'isolate')
install=$pkgname.install

source=(
    'git://github.com/ioi-germany/cms.git'
    'git://github.com/ioi-germany/isolate.git'
)
sha256sums=(
    'SKIP' 'SKIP'
)

pkgver() {
    cd cms
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd isolate
    make PREFIX="/usr" VARPREFIX="/var" CONFIGDIR="/etc" isolate isolate.1

    cd ../cms

    git config submodule.isolate.url "$srcdir/isolate"
    git submodule update
}

package() {
    cd isolate
    make PREFIX="$pkgdir/usr" VARPREFIX="$pkgdir/var" CONFIGDIR="$pkgdir/etc" install install-doc

    # Patch the configuration file so that it uses a standard directory
    sed -i "s|/var/local/lib/isolate|/var/lib/isolate|" $pkgdir/etc/isolate

    # The isolate binary has the setuid bit set (to run as root without sudo)
    # however we should let only the owner and the group be able to run it:
    chmod o-x $pkgdir/usr/bin/isolate

    cd ../cms

    # Logs and cache directories
    install -d -m770 $pkgdir/var/log/cms
    install -d -m770 $pkgdir/var/cache/cms

    # Configuration files
    install -D -m660 config/cms.conf.sample $pkgdir/usr/lib/cms/cms.conf
    install -D -m660 config/cms.ranking.conf.sample $pkgdir/usr/lib/cms/cms.ranking.conf

    python2 prerequisites.py build_l10n --as-root
    python2 setup.py install --root="$pkgdir" --optimize=1

}
