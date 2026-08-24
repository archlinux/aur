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
_borgstore_pkgver=0.6.1
_borghash_pkgver=0.2.0
pkgver=2.0.0b23
pkgrel=1
pkgdesc='Deduplicating backup program with compression and authenticated encryption'
url='https://borgbackup.org'
license=('BSD-3-Clause')
arch=('x86_64')
depends=(
	'acl'
	'lz4'
	'openssl'
	'xz'
	'zstd'
	'libdeflate'
	'python-argon2-cffi'
	"python-borgstore=${_borgstore_pkgver}"
	"python-borghash=${_borghash_pkgver}"
	'python-jsonargparse'
	'python-blake3'
	'python-msgpack'
	'python-packaging'
	'python-platformdirs'
	'python-shtab'
	'python-yaml'
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
optdepends=(
    'python-llfuse'
    'python-mfusepy'
    'python-pyfuse3'
    'python-textual'
)
provides=('borg' 'borgbackup')
conflicts=('borg' 'borgbackup')
_src='https://github.com/borgbackup/borg'
source=("$_src/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz" #{,.asc}
#	"${_src}store/releases/download/$_borgstore_pkgver/borgstore-$_borgstore_pkgver.tar.gz"
)
b2sums=('0e516a57bc01bc9ce65e74e138492d95b1cd96aab12d09b75cd9b2f6f32a98eb1793480953d8b68a8aa242c8762f12e80e65d1737d8b5d33c7f5b333ef3f3e97')
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>

build() {
	#python -m build --wheel --no-isolation "borgstore-$_borgstore_pkgver"
	python -m build --wheel --no-isolation "$_pkgname-$pkgver"
}

check() {
	python -m venv python-venv --prompt borg
	source python-venv/bin/activate
	#python-venv/bin/python -m pip install borgstore-${_borgstore_pkgver}/dist/borgstore-${_borgstore_pkgver}-py3-none-any.whl 
	python-venv/bin/python -m pip install $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl pytest pytest-cov pytest-benchmark msgpack
	cd "$_pkgname-$pkgver/build/lib.linux-$CARCH-"*/
	local skip='not test_non_ascii_acl and not test_with_socket and not test_socket_permissions'
	skip+=' and not shell_completions_test and not test_rclone_repo_basics and not test_zsh_completion_syntax'
	skip+=' and not test_prune_repository_example_interval and not test_prune_retain_and_expire_oldest'
	skip+=' and not test_spinner_colour'
	env LANG=en_US.UTF-8 PYTHONPATH="$PWD:$PYTHONPATH" "$srcdir/python-venv/bin/python" \
        -m pytest --cov=borg --benchmark-skip --pyargs borg.testsuite -v -k "$skip"
	deactivate
}

package() {
	cd "$_pkgname-$pkgver"

	python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
	install -Dm644 docs/man/*.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	cd "$pkgdir/usr/bin/"
	./borg completion bash 2>/dev/null | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/borg"
	./borg completion fish 2>/dev/null | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/borg.fish"
	./borg completion tcsh 2>/dev/null | install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/borg.tcsh"
	./borg completion zsh  2>/dev/null | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_borg"
}
