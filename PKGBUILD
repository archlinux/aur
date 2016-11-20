pkgbase=python-pygmail-git
pkgname=('python-pygmail-git' 'python2-pygmail-git')
pkgver=r73.4626823
pkgrel=1
pkgdesc="A Pythonic interface for Google Mail"
url="http://trac.mystic.cacr.caltech.edu/project/pygmail/wiki.html"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
conflicts=('python-pygmail')
provides=('python-pygmail')
source=("git+https://github.com/charlierguo/gmail.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gmail"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/gmail

  # Python 3 Port
  wget -c https://github.com/charlierguo/gmail/pull/48.patch
  patch -p1 -i 48.patch
}

build() {
  cp -r "${srcdir}"/gmail "${srcdir}"/gmail-py2

  cd "${srcdir}"/gmail
  python setup.py build

  cd "${srcdir}"/gmail-py2
  python2 setup.py build
}

package_python-pygmail-git() {
  depends=('python')

  cd "${srcdir}/gmail"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-pygmail-git() {
  depends=('python2')

  cd "${srcdir}/gmail"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
