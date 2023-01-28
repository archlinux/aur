# Maintainer: RubenKelevra <cyrond@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Lahfa Samy <'akechishiro-aur' at domain 'lahfa.xyz'>
# Contributor: Lauri Niskanen <ape@ape3000.com>

pkgname=borg2
_pkgname=borgbackup
pkgver=2.0.0b4
pkgrel=1
pkgdesc='Deduplicating backup program with compression and authenticated encryption'
url='https://github.com/borgbackup/borg'
license=('BSD')
arch=('x86_64')
depends=('acl' 'lz4' 'openssl' 'python-msgpack' 'python-setuptools' 'xz' 'zstd' 'xxhash' 'libdeflate')
makedepends=('cython' 'python-sphinx' 'python-guzzle-sphinx-theme' 'git' 'python-pkgconfig' 'python-pip' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-benchmark' 'python-mock' 'python-argon2_cffi' 'python-dateutil')
provides=('borg' 'borgbackup')
conflicts=('borg' 'borgbackup')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"{,.asc})
b2sums=('9835175c3559eabe9e24176c3df9300c3646ce068b19d38cb589c2ae6b8f9f25e0135bf8bed396be0a65065044e80b952832a58a185de7013f119a6f14335108'
        'SKIP')
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check() {
  echo "$CARCH"
  cd "$srcdir/$_pkgname-$pkgver/build/lib.linux-$CARCH-"*/
  LANG=en_US.UTF-8 PYTHONPATH="$PWD:$PYTHONPATH" py.test --cov=borg \
    --benchmark-skip --pyargs borg.testsuite -v \
    -k 'not test_non_ascii_acl'
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 scripts/shell_completions/bash/borg \
    "$pkgdir/usr/share/bash-completion/completions/borg"
  install -Dm644 scripts/shell_completions/fish/borg.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/borg.fish"
  install -Dm644 scripts/shell_completions/zsh/_borg "$pkgdir/usr/share/zsh/site-functions/_borg"

  install -Dm644 -t "$pkgdir/usr/share/man/man1/" "docs/man/"*.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

