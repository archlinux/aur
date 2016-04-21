pkgname=cms-germany-git
pkgver=r3226.ac67282
pkgrel=1
pkgdesc="CMS, or Contest Management System, is a distributed system for running and (to some extent) organizing a programming contest."
arch=('i686' 'x86_64')
url="https://github.com/ioi-germany/cms"
license=('AGPL3')
depends=('postgresql' 'postgresql-client' 'python2'
     'setuptools' 'python2-tornado' 'python2-psycopg2' 'python2-sqlalchemy'
     'python2-psutil' 'python2-netifaces' 'python2-crypto' 'python2-pytz'
     'python2-six' 'iso-codes' 'shared-mime-info' 'python2-beautifulsoup3'
     'python2-mechanize' 'python2-mock' 'python2-requests' 'python2-werkzeug'
     'python2-gevent' 'python2-coverage' 'libcgroup' 'texlive-core' 'asymptote'
     'ghostscript' 'python2-yaml' 'patool-py2' 'jdk8-openjdk' 'zip'
)
optdepends=(
  'fpc: support for Pascal submissions'
)
makedepends=(
  'asciidoc'
)

provides=('cms' 'isolate')
conflicts=('cms')
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

package() {
  cd cms
  
  git config submodule.isolate.url "$srcdir/isolate"
  git submodule update
  
  mkdir -p "$pkgdir/"lib/python2.7/site-packages/
  export PYTHONPATH="$pkgdir"/lib/python2.7/site-packages/

  ./setup.py build
  ./setup.py install --prefix="$pkgdir"

  mv "$pkgdir"/lib "$pkgdir"/usr/
  mv "$pkgdir"/bin "$pkgdir"/usr/
}
