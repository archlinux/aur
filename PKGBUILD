# Contributor: Ketmorco <ketmorco+aur@waynewerner.com>
# Contributor: RubenKelevra <cyrond@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Lahfa Samy <'akechishiro-aur' at domain 'lahfa.xyz'>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=borg2
_pkgname=borgbackup
#_borgstore_pkgver=0.5.4 # latest
_borgstore_pkgver=0.4.0 # but borg2 depends on
_borghash_pkgver=0.1.0 #0.1.1
pkgver=2.0.0b21
pkgrel=1
pkgdesc='Deduplicating backup program with compression and authenticated encryption'
url='https://borgbackup.org'
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
	'python-argon2-cffi'
#	"python-borgstore=${_borgstore_pkgver}"
	"python-borghash=${_borghash_pkgver}"
	'python-jsonargparse'
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
	'python-dateutil'
)
provides=('borg' 'borgbackup')
conflicts=('borg' 'borgbackup')
_src='https://github.com/borgbackup/borg'
source=(
	"$_src/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"{,.asc}
	"${_src}store/releases/download/$_borgstore_pkgver/borgstore-$_borgstore_pkgver.tar.gz"
)
sha256sums=('08543d61dd937039f99e487c29d36e31cc726a61912f8ad814e3d5753f681cd0'
            'SKIP'
            '2950209365ddf1a5e687add8fd64877a3050bf26af97655a798fa71ead6df4c4')
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>

build() {
	python -m build --wheel --no-isolation "borgstore-$_borgstore_pkgver"
	python -m build --wheel --no-isolation "$_pkgname-$pkgver"
}

check() {
	echo "$CARCH"
	python -m venv python-venv --prompt borg
    source python-venv/bin/activate
    python-venv/bin/python -m pip install borgstore-${_borgstore_pkgver}/dist/borgstore-${_borgstore_pkgver}-py3-none-any.whl \
      $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl pytest pytest-cov pytest-benchmark msgpack
	cd "$_pkgname-$pkgver/build/lib.linux-$CARCH-"*/
	env LANG=en_US.UTF-8 PYTHONPATH="$PWD:$PYTHONPATH" "$srcdir/python-venv/bin/python" -m pytest --cov=borg \
		--benchmark-skip --pyargs borg.testsuite -v \
		-k 'not test_non_ascii_acl and not test_with_socket and not test_socket_permissions and not shell_completions_test and not test_rclone_repo_basics and not test_zsh_completion_syntax'
    # and not test_zsh_completion_syntax[archiver]
    deactivate
}

package() {
	cd "$_pkgname-$pkgver"
	
	python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
	
#	install -Dm644 scripts/shell_completions/bash/borg -t "$pkgdir/usr/share/bash-completion/completions/"
	install -Dm644 scripts/shell_completions/fish/borg.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
#	install -Dm644 scripts/shell_completions/zsh/_borg -t "$pkgdir/usr/share/zsh/site-functions/"
	
	install -Dm644 "docs/man/"*.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

