pkgname=python-pysignald-git
pkgver=0.0.6.r30.g95dae82
pkgrel=1
pkgdesc="Signald python bindings"
arch=('i686' 'x86_64')
url="https://gitlab.com/stavros/pysignald/"
license=('GPL')
depends=('python' 'python-deprecated')

# template start; name=git; version=1;
# template start; name=git-source; version=1;
makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")

# vim: filetype=sh
# template end;
# template start; name=git-pkgver; version=1;
pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -eq 0 ] || \
# template start; name=git-revcount; version=1;
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# template end;
}

# vim: filetype=sh
# template end;
# template end;

# template start; name=prproject.toml; version=1;
makedepends+=("python-setuptools" "python-dephell")

prepare() {
  cd ${_gitname:-$pkgname}
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd ${_gitname:-$pkgname}
  python setup.py build
}

package() {
  cd ${_gitname:-$pkgname}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# template end;
