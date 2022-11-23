# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: Trustin Lee <t@motd.kr>
# Contributor: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=trash-cli-git
_pkgname=trash-cli
pkgver=0.22.10.20.r52.g0b476b1
pkgrel=1
epoch=1
pkgdesc='Command line trashcan (recycle bin) interface'
arch=('any')
url="https://github.com/andreafrancia/${_pkgname}"
license=('GPL')
depends=('python-psutil' 'python-six')
makedepends=('python-setuptools' 'python-shtab' 'git')
checkdepends=('python-pytest' 'python-flexmock' 'python-parameterized')
provides=('trash-cli')
conflicts=('trash-cli')
source=("git+http://github.com/andreafrancia/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"

    # don't depend on thirdparty copies of the stdlib
    find tests -type f -name "*.py" -exec \
        sed -i 's/^import mock$/from unittest import mock/;s/from mock /from unittest.mock /;s/from mock.mock /from unittest.mock /' {} +
}

build() {
    cd "${_pkgname}"

    python setup.py build
    for cmd in trash-empty trash-list trash-restore trash-put trash; do
      ./$cmd --print-completion bash > ./$cmd-completion
      ./$cmd --print-completion zsh > ./_$cmd-completion
    done
}

check() {
    cd "${_pkgname}"

    python -m pytest
}

package(){
    cd "${_pkgname}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    for cmd in trash-empty trash-list trash-restore trash-put trash; do
      install -vDm 644 ./$cmd-completion "$pkgdir/usr/share/bash-completion/completions/$cmd"
      install -vDm 644 ./_$cmd-completion "$pkgdir/usr/share/zsh/site-functions/_$cmd"
    done
}
