# -*- mode: shell-script -*-
# Maintainer: Dylon Edwards <deltaecho at archlinux dot us>

pkgbase='python-tensorly'
pkgname=(
    python{,2}-tensorly
)
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple and Fast Tensor Learning in Python"
arch=('x86_64')
url="http://tensorly.org/stable/home.html"
license=('BSD')
depends=(
    python{,2}
)
checkdepends=(
    python{,2}-pytest
)
optdepends=(
    mxnet
    python{,2}-numpy
    python{,2}-pytorch{,-cuda}
)
changelog="${pkgbase}.changelog"
source=("tensorly-${pkgver}.tar.gz::https://github.com/tensorly/tensorly/archive/${pkgver}.tar.gz")
md5sums=('d2bb823c87246b4ff45a175f984beb3d')

function check() {
    cd "tensorly-${pkgver}"

    # ------- #
    # Python3 #
    # ------- #

    if pacman -Qsq '^python-numpy$' &>/dev/null; then
        echo "Testing against the numpy backend for Python3 ..."
        TENSORLY_BACKEND='numpy' pytest -v tensorly
    fi

    if pacman -Qsq '^python-pytorch(-cuda)?$' &>/dev/null; then
        echo "Testing against the pytorch backend for Python3 ..."
        TENSORLY_BACKEND='pytorch' pytest -v tensorly
    fi

    if pacman -Qsq '^mxnet$' &>/dev/null; then
        echo "Testing against the mxnet backend for Python3 ..."
        TENSORLY_BACKEND='mxnet' pytest -v tensorly
    fi

    # ------- #
    # Python2 #
    # ------- #

    if pacman -Qsq '^python2-numpy$' &>/dev/null; then
        echo "Testing against the numpy backend for Python2 ..."
        TENSORLY_BACKEND='numpy' pytest2 -v tensorly
    fi

    if pacman -Qsq '^python2-pytorch(-cuda)?$' &>/dev/null; then
        echo "Testing against the pytorch backend for Python2 ..."
        TENSORLY_BACKEND='pytorch' pytest2 -v tensorly
    fi
}

function package_python-tensorly() {
    depends=(
        python
    )
    optdepends=(
        mxnet
        python-numpy
        python-pytorch{,-cuda}
    )

    cd "tensorly-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}

function package_python2-tensorly() {
    depends=(
        python2
    )
    optdepends=(
        python2-numpy
        python2-pytorch{,-cuda}
    )

    cd "tensorly-${pkgver}"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
