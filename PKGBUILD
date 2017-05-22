pkgname=pb-git
pkgver=r357.dc04f7f
pkgrel=1
pkgdesc="My attempt at a light pastebin"
arch=('any')
url="https://github.com/ptpb/pb"
license=('GPLv3')

depends=('python' 'python-werkzeug' 'python-flask' 'python-yaml'
         'python-requests' 'python-docutils' 'python-xdg'
         'python-pymongo' 'python-markdown' 'python-dateutil'
         'uwsgi' 'uwsgi-plugin-python'
         'python-click' 'python-pygments' 'python-pytz')

makedepends=('python-setuptools' 'git')
#checkdepends=('tox' 'python-pytest' 'python-pytest-cov')
optdepends=('pbs-git: pb styles and static resources')

provides=('pb')
backup=('etc/xdg/pb/config.yaml' 'etc/uwsgi/pb.ini')

source=("$pkgname::git+https://github.com/ptpb/pb.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
