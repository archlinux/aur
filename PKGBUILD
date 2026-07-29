# Maintainer: Softer <sft.nik@gmail.com>

pkgname=memgroups
pkgver=1.0.0
pkgrel=1
pkgdesc='Show where your RAM went: Linux memory grouped by application, no root needed'
arch=('any')
url='https://github.com/Softer/memgroups'
license=('GPL-3.0-or-later')
# Stdlib only, by design and permanently. python>=3.11 additionally enables the
# TOML config file; on an older interpreter the tool runs on its defaults and
# says so on stderr, which is why this is a plain 'python' and not a versioned
# dependency.
depends=('python')
optdepends=('docker: name container groups by image and by compose project')
# setuptools-scm normally reads the version out of the git tag. A release
# tarball has no .git, so build() hands it $pkgver instead - see below.
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('05d43aaf723bcd38476611a43d4b1facddddff818d833cfc6fe88910186389de')

build() {
    cd "$pkgname-$pkgver"
    # Without this setuptools-scm cannot find a tag and refuses to guess, which
    # fails the build outright rather than silently versioning it 0.0.0.
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    # The suite builds a fake /proc under tmp_path and never reads the real one,
    # so it is hermetic and safe in a build chroot with no access to the machine.
    python -m pytest -q
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 config.example.toml \
        "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
