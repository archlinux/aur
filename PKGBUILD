# Maintainer: James Knight <james.d.knight@live.com>

pkgbase=releng-tool
pkgname=(releng-tool python2-releng-tool)
pkgver=0.12.0
_pkgtarget=tag=v0.12
pkgrel=1
pkgdesc='Tool to assist in the release engineering of a project'
url=https://releng.io/
arch=(any)
license=(BSD)
makedepends=(
  git
  python-setuptools
  python2-setuptools
  sed
)
optdepends=(
  'autoconf: support for autotools package management'
  'bash-completion: shell completion for bash'
  'bzr: supporting for Bazaar cloning'
  'cmake: support for CMake package management'
  'cvs: supporting for CVS checkouts'
  'fish: shell completion for fish'
  'git: support for Git cloning'
  'gnupg: support for GPG verification of downloaded packages'
  'make: support for building make-dependent packages'
  'mercurial: support for Mercurial cloning'
  'openssh: support for secure-copy fetching of sources'
  'patch: support for patching package sources'
  'subversion: supporting for Subversion checkouts'
  'zsh-completions: shell completion for zsh'
)
source=($pkgname-$pkgver::git+https://github.com/releng-tool/releng-tool.git#$_pkgtarget)
sha512sums=(SKIP)

prepare() {
  cp -a $pkgbase-$pkgver{,-py2}

  cd $pkgbase-$pkgver-py2/releng
  sed 's_#!/usr/bin/env python_#!/usr/bin/env python2_' \
      -i $(find . -name '*.py')
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py build

  cd "$srcdir/$pkgbase-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/$pkgbase-$pkgver"
  PYTHONDONTWRITEBYTECODE=1 python -m tests || warning "python tests failed"

  cd "$srcdir/$pkgbase-$pkgver-py2"
  TOX_INI_DIR="$srcdir/$pkgbase-$pkgver-py2" \
  PYTHONDONTWRITEBYTECODE=1 python2 -m tests || warning "python2 tests failed"
}

package_releng-tool() {
  depends=(python)
  cd $pkgbase-$pkgver

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build --verbose

  install -vDm644 scripts/completion/bash \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 scripts/completion/fish \
    "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -vDm644 scripts/completion/zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -vDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-releng-tool() {
  depends=(python2)
  cd $pkgbase-$pkgver-py2

  export PYTHONHASHSEED=0
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build --verbose

  mv "$pkgdir/usr/bin/releng-tool" "$pkgdir/usr/bin/$pkgname"

  install -vDm644 scripts/completion/bash \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 scripts/completion/fish \
    "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -vDm644 scripts/completion/zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -vDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _completion_script
  local _completion_scripts=(
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    "$pkgdir/usr/share/fish/completions/$pkgname.fish"
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  )
  for _completion_script in ${_completion_scripts[*]}; do
      sed -i s/releng-tool/$pkgname/ "$_completion_script"
      sed -i s/_releng_tool/_releng_tool_py2/ "$_completion_script"
  done
}
