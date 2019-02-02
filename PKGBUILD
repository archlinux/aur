pkgname=cms-germany-git
pkgver=r4412.5c5be9dd
pkgrel=1
pkgdesc="CMS, or Contest Management System, is a distributed system for running and (to some extent) organizing a programming contest. This is a fork used for the German IOI team selection process."
arch=('i686' 'x86_64')
url="https://github.com/ioi-germany/cms"
license=('AGPL3')
depends=(
    'python'
    'python-tornado'
    'python-psycopg2'
    'python-sqlalchemy'
    'python-netifaces'
    'python-crypto'
    'python-pytz'
    'python-psutil'
    'python-six'
    'python-requests'
    'python-gevent'
    'python-werkzeug'
#    'patool-py3'
    'python-bcrypt'
    'python-chardet'
#    'python-ipaddress'
    'python-yaml'
    'python-future'
    'python-jinja'
    'python-xdg'
    'postgresql'
    'postgresql-client'
#    'libcgroup'
    'iso-codes'
    'shared-mime-info'
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
    'python-babel'
)

provides=('cms-germany' 'isolate-germany')
conflicts=('cms' 'isolate')
install=$pkgname.install

source=(
    'git://github.com/ioi-germany/cms.git#branch=master'
    'git://github.com/ioi-germany/isolate.git'
    'pgf.patch'
)
sha256sums=(
    'SKIP' 'SKIP' 'SKIP'
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

    patch cmscontrib/gerpythonformat/templates/lg/graphdrawing.tex ../pgf.patch

    # Logs and cache directories
    install -d -m770 $pkgdir/var/log/cms
    install -d -m770 $pkgdir/var/cache/cms

    # Configuration files
    install -D -m660 config/cms.conf.sample $pkgdir/usr/lib/cms/cms.conf
    install -D -m660 config/cms.ranking.conf.sample $pkgdir/usr/lib/cms/cms.ranking.conf

    # I'm not even sure if this is needed at all
    install -d -m770 $pkgdir/var/lib/cms

    # Fix testlib.h path (maybe patch CMS for this?)
    install -d -m755 $pkgdir/usr/include/cms
    ln -s /usr/include/testlib.h $pkgdir/usr/include/cms/testlib.h

    python3 prerequisites.py --as-root build
    python3 setup.py install --root="$pkgdir" --optimize=1

    install -d $pkgdir/var/local/log
    install -d $pkgdir/var/local/cache
    install -d $pkgdir/var/local/lib
    install -d $pkgdir/var/local/run
    ln -s /var/log/cms $pkgdir/var/local/log/cms
    ln -s /var/cache/cms $pkgdir/var/local/cache/cms
    ln -s /var/lib/cms $pkgdir/var/local/lib/cms
    ln -s /var/run/cms $pkgdir/var/local/run/cms
}
