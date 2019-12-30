# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=('python2-docker-py-git')
_srcname='docker-py'
pkgver=r2940.1573028979.a0b9c3d0
pkgrel=1
pkgdesc='An API client for docker written in Python'
arch=('any')
url="https://github.com/docker/${_srcname}"
license=('Apache')

depends=(
    'python2'
    'python2-six'
    'python2-requests'
    'python-websocket-client'
)
makedepends=('git' 'python2-setuptools')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_srcname}"

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' "${file}"
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' "${file}"
  done

  python2 setup.py build
}

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

package() {
    cd "${srcdir}/${_srcname}"

    python2 setup.py install --root="${pkgdir}" --optimize=1
}
