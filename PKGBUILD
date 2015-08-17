pkgname=pb-git
pkgver=r254.ab55849
pkgrel=1
pkgdesc="My attempt at a light pastebin"
arch=('any')
url="https://github.com/ptpb/pb"
license=('GPLv3')

depends=('python' 'python-werkzeug' 'python-flask-git' 'python-yaml'
         'python-requests' 'python-docutils' 'python-xdg'
         'python-pymongo' 'python-markdown' 'uwsgi'
         'uwsgi-plugin-python')

makedepends=('python-setuptools' 'git' 'graphicsmagick' 'npm')
#checkdepends=('tox' 'python-pytest' 'python-pytest-cov')

provides=('pb')
backup=('etc/xdg/pb/config.yaml' 'etc/uwsgi/pb.ini')

source=("$pkgname::git+https://github.com/ptpb/pb.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname

  npm install
  npm install grunt-cli

  node_modules/grunt-cli/bin/grunt
}

build() {
  cd $pkgname

  python setup.py build
}

#check() {
#  cd $pkgname
#
#  tox
#}

package() {
  cd $pkgname

  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname"
  install -D -m644 config.yaml.example "${pkgdir}/etc/xdg/pb/config.yaml"
  install -D -m644 pkg/pb.ini.example "${pkgdir}/etc/uwsgi/pb.ini"
  install -D -m644 pkg/pb.service "${pkgdir}/usr/lib/systemd/system/pb.service"
}
