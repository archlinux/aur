# Maintainer: Richard Neumann aka. rne <r dot neumann at homeinfo fullstop de>

pkgname='python-magic-git'
pkgver='0.4.6'
pkgrel=3
pkgdesc="Python 3 packages for alternative (github) implementation of python-magic"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git' 'sed')
conflicts=('python-magic')

source=("${pkgname}::git+https://github.com/ahupp/python-magic")
md5sums=('SKIP')

pkgdir='pkg'
srcdir='src'


package() {
    local PYTHON="/usr/bin/env python3"
    local USR_PATH="${pkgdir}/usr"

    # Set up /usr directory
    install -d -m 755 ${USR_PATH}

    # Clean up build dir
    rm -Rf build

    cd "${srcdir}/${pkgname}"

    # Fix setup.py for distutils.core
    sed -i 's/\(from setuptools.*\)/#\1/' setup.py
    sed -i 's/#\(from distutils.*\)/\1/' setup.py

    # Install python packages to $pkgdir
    ${PYTHON} setup.py install --prefix ${USR_PATH}

    # Make directories accessible for anyone
    find "${USR_PATH}" -type d -exec chmod 755 {} \;

    # Make library files readable for anyone but not executable
    find "${USR_PATH}" -type f -exec chmod 644 {} \;
}

