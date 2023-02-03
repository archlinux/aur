pkgname=cms-germany-git
pkgver=r5032.b78d8a4e
pkgrel=1
pkgdesc="CMS, or Contest Management System, is a distributed system for running and (to some extent) organizing a programming contest. This is a fork used for the German IOI team selection process."
arch=('i686' 'x86_64')
url="https://github.com/ioi-germany/cms"
license=('AGPL3')
depends=(
    'isolate'
    'python'
    'python-tornado'
    'python-psycopg2'
    'python-sqlalchemy'
    'python-netifaces'
    'python-pycryptodomex'
    'python-pytz'
    'python-psutil'
    'python-six'
    'python-requests'
    'python-gevent'
    'python-werkzeug'
    'python-bcrypt'
    'python-chardet'
    'python-yaml'
    'python-future'
    'python-jinja'
    'python-markupsafe'
    'python-xdg'
    'postgresql'
    'postgresql-client'
    'iso-codes'
    'shared-mime-info'
    'asymptote'
    'texlive-core'
    'texlive-fontsextra'
    'texlive-latexextra'
    'texlive-pstricks'
    'libcap'
    'python-babel'
)
optdepends=(
    'python-pycups: printing support'
    'python-pypdf: printing support'
    'a2ps: printing support'
    'fpc: support for Pascal submissions'
    'jdk8-openjdk: support for Java submissions'
)
makedepends=(
    'git'
    'asciidoc'
    'python-setuptools'
)
backup=(
    'etc/cms.conf'
    'etc/cms.ranking.conf'
)

provides=('cms-germany')
conflicts=('cms')
install=$pkgname.install

source=(
    'git+https://github.com/ioi-germany/cms.git#branch=main'
    'dont_install_isolate.patch'
    'new_jinja2_1.patch'
    'new_jinja2_2.patch'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd cms
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    true
}

package() {
    cd cms

    patch prerequisites.py ../dont_install_isolate.patch
    patch cms/grading/ParameterTypes.py ../new_jinja2_1.patch
    patch cms/server/jinja2_toolbox.py ../new_jinja2_2.patch

    # Logs and cache directories
    install -d -m770 $pkgdir/var/log/cms
    install -d -m770 $pkgdir/var/cache/cms

    # Configuration files
    install -D -m660 config/cms.conf.sample $pkgdir/etc/cms.conf
    install -D -m660 config/cms.ranking.conf.sample $pkgdir/etc/cms.ranking.conf

    # I'm not even sure if this is needed at all
    install -d -m770 $pkgdir/var/lib/cms

    python3 prerequisites.py --as-root build
    python3 setup.py install --root="$pkgdir" --optimize=1

    install -d $pkgdir/var/local/log
    install -d $pkgdir/var/local/cache
    install -d $pkgdir/var/local/lib
    install -d $pkgdir/var/local/run
    ln -s /var/log/cms $pkgdir/var/local/log/cms
    ln -s /var/cache/cms $pkgdir/var/local/cache/cms
    ln -s /var/lib/cms $pkgdir/var/local/lib/cms
}
