# $Id$
# Maintainer: José Luis Lafuente <jl@lafuente.me>

pkgname='python-pew_deps'
pkgver=0.1.25
_pythonz_ver=1.11.3
_resumableurl_ver=0.1.4
pkgrel=1
pkgdesc="Python Env Wrapper, a set of tools to manage multiple virtual environments, with its hard dependencies"
url="https://github.com/berdario/pew"
arch=('any')
license=('MIT')
depends=('python' 'python-virtualenv' 'python-virtualenv-clone')
makedepends=('python' 'python-setuptools')
optdepends=('libtinfo: for running pypy')
replaces=('python-pew' 'python-pythonz' 'python-pythonz-bd' 'python-resumable-urlretrieve')
conflicts=('python-pew' 'python-pythonz' 'python-pythonz-bd' 'python-resumable-urlretrieve')
source=("https://github.com/berdario/pew/archive/${pkgver}.tar.gz"
"https://github.com/berdario/resumable-urlretrieve/archive/${_resumableurl_ver}.tar.gz"
"https://pypi.python.org/packages/41/66/477eef589811b02559a7dc530a599eb5315938182a5437ae34f25ded7403/pythonz-bd-${_pythonz_ver}.tar.gz"
)

_scripts_path='pew/shell_config'

package() {

  # ----- resumable-url
  cd "${srcdir}/resumable-urlretrieve-${_resumableurl_ver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"

  # ------ pythonz
  cd "$srcdir/pythonz-bd-${_pythonz_ver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="$pkgdir"

  # ----- pew
  cd "$srcdir/pew-$pkgver"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="$pkgdir"

  # link to a version with 3 suffix as well
  ln "$pkgdir/usr/bin/pew" "$pkgdir/usr/bin/pew3"

  install -D -m644 $_scripts_path/complete.fish \
    "$pkgdir/usr/share/fish/completions/pew.fish"

  install -D -m644 $_scripts_path/complete.bash \
    "$pkgdir/usr/share/bash-completion/completions/pew"

  install -D -m644 $_scripts_path/complete.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_pew"
}

md5sums=('487b8bc4086197fc25d7ce906316c580'
         'c50d74066d5ef801cc76dee1fac4a57f'
         'bc2922bc1fbb97d2060dbaada8bf1e74')

# vim:set ts=2 sw=2 et:
