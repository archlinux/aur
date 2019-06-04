# Maintainer: ferreum <code.danielk@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=borg-venv
_pkgname=borgbackup
pkgver=1.1.8
pkgrel=4
pkgdesc='Borgbackup in a virtualenv to use old msgpack version'
url='https://borgbackup.github.io/'
license=('BSD')
arch=('x86_64')
depends=('acl' 'lz4' 'openssl' 'python-setuptools' 'xz' 'zstd')
optdepends=('openssh: repositories on remote hosts'
            'fuse2: mounting backups as a FUSE file system')
makedepends=('cython' 'python-sphinx' 'python-guzzle-sphinx-theme')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-benchmark' 'python-mock')
provides=('borg')
conflicts=('borg')
install=borg-venv.install
source=("https://github.com/borgbackup/borg/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"{,.asc}
        'https://files.pythonhosted.org/packages/8a/20/6eca772d1a5830336f84aca1d8198e5a3f4715cd1c7fc36d3cc7f7185091/msgpack-python-0.5.6.tar.gz'
        'https://files.pythonhosted.org/packages/75/b4/5248459ec0e7e1608814915479cb13e5baf89034b572e3d74d5c9219dd31/llfuse-1.3.6.tar.bz2')
sha256sums=('0b4370480ca0114cb0bb534286241af8a35c6ffb71404dfa409ed06099661b63'
            'SKIP'
            '378cc8a6d3545b532dfd149da715abae4fda2a3adb6d74e525d0d5e51f46909b'
            '31a267f7ec542b0cd62e0f1268e1880fdabf3f418ec9447def99acfa6eff2ec9')
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  local venvdir="$srcdir/venv-$_pkgname-$pkgver"

  python -m venv --system-site-packages "$venvdir"
  "$venvdir/bin/python" -m pip install "$srcdir/msgpack-python-0.5.6.tar.gz"
  "$venvdir/bin/python" -m pip install "$srcdir/llfuse-1.3.6.tar.bz2"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  local venvdir="$srcdir/venv-$_pkgname-$pkgver"
  "$venvdir/bin/python" setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver/build/lib.linux-$CARCH-3".*/
  local venvdir="$srcdir/venv-$_pkgname-$pkgver"

  LANG=en_US.UTF-8 PYTHONPATH="$PWD:$PYTHONPATH" "$venvdir/bin/python" -m pytest --cov=borg \
    --benchmark-skip --pyargs borg.testsuite -v \
    -k 'not test_non_ascii_acl'
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  local venvdir="$srcdir/venv-$_pkgname-$pkgver"

  local venvdest="$pkgdir/opt/$pkgname/"

  # copy venv to pkg
  install -dm755 "$venvdest/lib/python3.7/site-packages/"
  cp -r "$venvdir/lib/python3.7/site-packages/"{msgpack,llfuse}* "$venvdest/lib/python3.7/site-packages/"
  install -dm755 "$venvdest/bin/"
  install -Dm644 "$venvdir/pyvenv.cfg" "$venvdest/pyvenv.cfg"
  install -Dm755 "$venvdir"/bin/{python,python3} "$venvdest/bin/"

  # install to copied venv
  "$venvdest/bin/python" setup.py install --optimize=1

  # change script interpreters to installed venv path
  sed -i "s|${pkgdir}/opt/$pkgname|/opt/$pkgname|g" "$venvdest"/bin/{borg,borgfs}

  # create symlinks in /usr/bin
  install -dm755 "$pkgdir"/usr/bin/
  ln -s /opt/"$pkgname"/bin/{borg,borgfs} "$pkgdir"/usr/bin/

  # remove junk files
  rm -f "$venvdest"/lib/python*/site-packages/"$_pkgname-"*/{.benchmarks,.coverage}

  # install misc files
  install -Dm644 scripts/shell_completions/bash/borg \
    "$pkgdir/usr/share/bash-completion/completions/borg"
  install -Dm644 scripts/shell_completions/fish/borg.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/borg.fish"
  install -Dm644 scripts/shell_completions/zsh/_borg "$pkgdir/usr/share/zsh/site-functions/_borg"

  install -Dm644 -t "$pkgdir/usr/share/man/man1/" "docs/man/"*.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
