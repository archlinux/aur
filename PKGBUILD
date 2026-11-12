# Maintainer: Martin Schrodt <martin@schrodt.org>

pkgname=vfio-isolate
_name=vfio_isolate
pkgver=1.0.0
pkgrel=1
pkgdesc="commandline tool to facilitate CPU core isolation"
arch=('any')
url="https://github.com/spheenik/vfio-isolate"
license=('MIT')
depends=('python' 'python-click' 'python-psutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_name-$pkgver.tar.gz")
sha256sums=('ad52c3cd4a544bf4543e10e73ad479e600b00ab65592ee94bef639a8357a3380')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    local site_packages
    site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/usr/share/zsh/site-functions" "$pkgdir/usr/share/bash-completion/completions"
    PYTHONPATH="$pkgdir$site_packages" _VFIO_ISOLATE_COMPLETE=zsh_source \
        python "$pkgdir/usr/bin/vfio-isolate" > "$pkgdir/usr/share/zsh/site-functions/_vfio-isolate"
    PYTHONPATH="$pkgdir$site_packages" _VFIO_ISOLATE_COMPLETE=bash_source \
        python "$pkgdir/usr/bin/vfio-isolate" > "$pkgdir/usr/share/bash-completion/completions/vfio-isolate"
}
