# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-biosutilities
_name=${pkgname#python-}
pkgver=25.4.2
pkgrel=1
epoch=
pkgdesc="Various BIOS Utilities for Modding/Research"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(BSD-2-Clause-Patent)
groups=()
provides=(${pkgname} ${_name})
conflicts=(${pkgname} ${_name})
depends=(
    #     7zip
    python
    python-pefile
    #     uefitool
    #AUR
    #     bgscripttool
    python-dissect.util
    #     toshibacomextractor
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=(
    '7zip: File archiver for extremely high compression'
    'uefitool: UEFI firmware image viewer and editor and utilities'
    'bgscripttool: Intel BIOS Guard Script Tool'
    'toshibacomextractor: Quick and dirty tool to extract Toshiba .COM firmware files, released so it does not get lost.'
)
options=('!strip' '!debug')
source=(
    "${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "main-$pkgver.py::https://github.com/platomav/BIOSUtilities/raw/refs/heads/main/main.py"
)
noextract=()
sha256sums=('e2bcc4a2b73905b3b8c8621c3cf4fb5440d5fbd1df74fd8603e85e443adb27ce'
            '5a4b7e3b7a46de5e6c3477f3157ffb6e9860a3fe5208f614ce6ffdbbda2579a4')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"

    echo -e "[project.entry-points.\"console_scripts\"]\nbiosutilities = 'biosutilities:main'" >>pyproject.toml

    cp -rv ${srcdir}/main-$pkgver.py biosutilities/main.py

    cd biosutilities

    echo -e "from .main import BIOSUtilities\n\ndef main():\n    BIOSUtilities().run_main()\n\nif __name__ == \"__main__\":\n    main()" >>__init__.py
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
