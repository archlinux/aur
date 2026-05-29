# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgbase=python-moteus
pkgname=(python-moteus python-moteus-gui)
_name0=${pkgname[0]#python-}
_name1=${pkgname[1]#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="moteus brushless controller library and tools"
url="https://pypi.org/project/moteus/"
arch=('any')
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'mypy' 'nodejs')

source=("$pkgbase::git+https://github.com/mjbots/moteus.git#tag=python/v$pkgver"
        "https://github.com/mjbots/fdcanusb/blob/master/70-fdcanusb.rules")

sha256sums=('b5f9fdf12a6eb7baf6e00a5db154b2115323708fe8a9310f1f806d04d7d273fd'
            '433de43876d9f6abd1a3895924fd47e4a634d102ffd6604cd05d8290d266dc6f')

build() {
    cd "$srcdir/$pkgbase"
    "tools/bazel" build --config=host //lib/python:bdist_wheel //utils/gui:bdist_wheel
}

package_python-moteus() {
echo build moteus
    depends=('python-importlib-metadata' 'python-pyelftools' 'python-pyserial' 'python-can' 'python-scipy' 'python-packaging')
    python -m installer --destdir="$pkgdir" "$srcdir/$pkgbase/bazel-bin/lib/python/moteus-$pkgver-py3-none-any.whl"
    install -Dm 644 70-fdcanusb.rules "$pkgdir/etc/udev/rules.d/70-fdcanusb.rules"
}

package_python-moteus-gui() {
echo build moteus gui
    depends=('pyside6' 'python-asyncqt' 'python-matplotlib' 'python-moteus' 'python-scipy' 'python-qtconsole' 'python-qtpy')
    python -m installer --destdir="$pkgdir" "$srcdir/$pkgbase/bazel-bin/utils/gui/moteus_gui-$pkgver-py3-none-any.whl"
}
