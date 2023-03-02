# Maintainer: Lahfa Samy <'akechishiro-aur' at domain 'lahfa.xyz'>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=borg-git
_pkgname=borg
pkgver=2.0.0b5.r5.g8027c7b2
pkgrel=1
pkgdesc='Deduplicating backup program with compression and authenticated encryption'
url='https://borgbackup.github.io/'
license=('BSD')
arch=('x86_64')
depends=('acl' 'lz4' 'openssl' 'python-msgpack' 'python-setuptools' 'xz' 'zstd' 'xxhash' 'libdeflate-git')
optdepends=('openssh: repositories on remote hosts'
            'python-llfuse: mounting backups as a FUSE file system')
makedepends=('cython' 'python-sphinx' 'python-guzzle-sphinx-theme' 'git' 'python-pkgconfig' 'python-pip' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-benchmark' 'python-mock' 'python-argon2_cffi' 'python-dateutil')
provides=('borg' 'borgbackup')
conflicts=('borg' 'borgbackup')
source=("${_pkgname}::git+https://github.com/borgbackup/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname/build/lib.linux-$CARCH-cpython-"*/

  LANG=en_US.UTF-8 PYTHONPATH="$PWD:$PYTHONPATH" py.test --cov=borg \
    --benchmark-skip --pyargs borg.testsuite -v \
    -k 'not test_non_ascii_acl'
}

package() {
  cd "$srcdir/$_pkgname"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 scripts/shell_completions/bash/borg \
    "$pkgdir/usr/share/bash-completion/completions/borg"
  install -Dm644 scripts/shell_completions/fish/borg.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/borg.fish"
  install -Dm644 scripts/shell_completions/zsh/_borg "$pkgdir/usr/share/zsh/site-functions/_borg"

  install -Dm644 -t "$pkgdir/usr/share/man/man1/" "docs/man/"*.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
