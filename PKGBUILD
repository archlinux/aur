# Maintainer: RubenKelevra <cyrond@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Lahfa Samy <'akechishiro-aur' at domain 'lahfa.xyz'>
# Contributor: Lauri Niskanen <ape@ape3000.com>

pkgname=borg2
_pkgname=borgbackup
_borgstore_pkgver=0.1.0
pkgver=2.0.0b12
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
	'python-mock'
	'python-argon2_cffi'
	'python-dateutil'
)
provides=('borg' 'borgbackup')
conflicts=('borg' 'borgbackup')
source=(
	"$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"{,.asc}
)
b2sums=('95170f410acb6259e5c50491e99c44588961ac7f7ebec3865d7b515a52da885abdadefd72295910bfbcb61049a72ce148dc09ff6fdd43f158c5cbf07b3a88813'
        'SKIP')
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	echo "$CARCH"
	cd "$srcdir/$_pkgname-$pkgver/build/lib.linux-$CARCH-"*/
	LANG=en_US.UTF-8 PYTHONPATH="$PWD:$PYTHONPATH" py.test --cov=borg \
		--benchmark-skip --pyargs borg.testsuite -v \
		-k 'not test_non_ascii_acl and not test_with_socket and not test_socket_permissions'
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

