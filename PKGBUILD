# Maintainer: Ketmorco <ketmorco+aur@waynewerner.com>
# Contributor: RubenKelevra <cyrond@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Lahfa Samy <'akechishiro-aur' at domain 'lahfa.xyz'>
# Contributor: Lauri Niskanen <ape@ape3000.com>

pkgname=borg2
_pkgname=borgbackup
_borgstore_pkgver=0.3.0
_borghash_pkgver=0.1.0
pkgver=2.0.0b18
pkgrel=1
pkgdesc='Deduplicating backup program with compression and authenticated encryption'
url='https://github.com/borgbackup/borg'
license=('BSD-3-Clause')
arch=('x86_64')
depends=(
	'acl'
	'lz4'
	'openssl'
	'python-msgpack'
	'xz'
	'zstd'
	'xxhash'
	'libdeflate'
	"python-borgstore=${_borgstore_pkgver}"
	"python-borghash=${_borghash_pkgver}"
)
makedepends=(
	'cython'
	'python-sphinx'
	'python-guzzle-sphinx-theme'
	'git'
	'python-pkgconfig'
        'python-build'
        'python-installer'
        'python-wheel'
	'python-setuptools'
	'python-setuptools-scm'
)
checkdepends=(
	'python-pytest'
	'python-pytest-cov'
	'python-pytest-benchmark'
	'python-argon2-cffi'
	'python-dateutil'
)
provides=('borg' 'borgbackup')
conflicts=('borg' 'borgbackup')
source=(
	"$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"{,.asc}
	"https://github.com/borgbackup/borgstore/releases/download/0.3.0/borgstore-0.3.0.tar.gz"
)
sha256sums=('51abe06a0220956a458e52db48ab6b680508200f694a897d7576d2f1345af15d'
        'SKIP'
        'a9049f730c9e31ce9ccdfb4ff171542dbc818fd4c8484c4eb51e65addd76fe43'
    )
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>

build() {
	cd "$srcdir/borgstore-${_borgstore_pkgver}"
	python -m build --wheel --no-isolation
	cd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	echo "$CARCH"
	python -m venv $srcdir/python-venv --prompt borg
	$srcdir/python-venv/bin/python -m pip install $srcdir/borgstore-${_borgstore_pkgver}/dist/borgstore-${_borgstore_pkgver}-py3-none-any.whl $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
	cd "$srcdir/$_pkgname-$pkgver/build/lib.linux-$CARCH-"*/
	LANG=en_US.UTF-8 PYTHONPATH="$PWD:$PYTHONPATH" $srcdir/python-venv/bin/python -m pytest --cov=borg \
		--benchmark-skip --pyargs borg.testsuite -v \
		-k 'not test_non_ascii_acl and not test_with_socket and not test_socket_permissions and not shell_completions_test'
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	
	python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
	
	install -Dm644 scripts/shell_completions/bash/borg \
		"$pkgdir/usr/share/bash-completion/completions/borg"
	install -Dm644 scripts/shell_completions/fish/borg.fish \
		"$pkgdir/usr/share/fish/vendor_completions.d/borg.fish"
	install -Dm644 scripts/shell_completions/zsh/_borg "$pkgdir/usr/share/zsh/site-functions/_borg"
	
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" "docs/man/"*.1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

