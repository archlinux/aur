# Maintainer: Zen <dev@pyl.onl>
# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=ugrd-git
_name=${pkgname%-git}
pkgver=2.0.2.r7.g2713866
pkgrel=1
pkgdesc='Minimalistic POSIX initramfs generator, designed for encrypted systems'
arch=('any')
url="https://github.com/desultory/$_name"
license=('GPL-2.0-only')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('bc' 'pax-utils' 'python' 'python-pycpio' 'python-zenlib')
optdepends=('python-zstandard: zstd cpio compression')
provides=('initramfs' 'ugrd')
conflicts=('ugrd')
backup=('etc/ugrd/config.toml')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_name
    git clean -dfx
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 examples/example.toml "$pkgdir/etc/ugrd/config.toml"
    install -Dm644 hooks/alpm/91-ugrd.hook "$pkgdir/usr/share/libalpm/hooks/91-ugrd.hook"
    install -Dm644 completion/ugrd "$pkgdir/usr/share/bash-completion/completions/ugrd"
    install -Dm644 completion/_ugrd "$pkgdir/usr/share/zsh/site-functions/_ugrd"
}
