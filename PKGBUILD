# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgbase=python-moteus
pkgname=(python-moteus python-moteus-gui)
_name0=${pkgname[0]#python-}
_name1=${pkgname[1]#python-}
pkgver=1.1.1
pkgrel=2
pkgdesc="moteus brushless controller library and tools"
url="https://pypi.org/project/moteus/"
arch=('any')
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'mypy' 'nodejs')

source=("$pkgbase::git+https://github.com/mjbots/moteus.git#tag=python/v$pkgver"
        "https://raw.githubusercontent.com/mjbots/fdcanusb/refs/heads/master/70-fdcanusb.rules")

sha256sums=('ed37176dbd53cae51ec3b5b1b6d24d70ebb577d552401b4a1433b8e791e558c6'
            '6008f3b20baca0e4a077bc45c8e541717d6e3fc63ba7621dc3b1bcb14d86cb23')

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
