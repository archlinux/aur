# Maintainer: fran-dv <franciscodellav@gmail.com>
pkgname=kth-node
pkgver=0.75.0
pkgrel=1
pkgdesc="High-performance Bitcoin Cash node written in C++23"
arch=(x86_64)
url="https://kth.cash/"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('conan' 'cmake' 'git' 'python-pip')
options=('!strip')
source=()
sha256sums=()

# installation instructions from https://kth.cash/#content-a-executable
build() {
    export CC=gcc
    export CXX=g++

    export CONAN_HOME="$srcdir/conan_home"
    mkdir -p "$CONAN_HOME"


    echo "Installing build helper (kthbuild) locally..."

    mkdir -p "$srcdir/pip-tools"
    pip install kthbuild --target="$srcdir/pip-tools" --no-warn-script-location
    
    export PYTHONPATH="$srcdir/pip-tools:$PYTHONPATH"

    echo "Configuring Conan sandbox..."

    conan profile detect --force
    
    if ! conan remote list | grep -q "kth"; then
        conan remote add kth https://packages.kth.cash/api
    fi

    conan config install https://github.com/k-nuth/ci-utils/raw/master/conan/config2023.zip

    echo "Installing Knuth Node executable..."

   conan install --requires=kth/${pkgver} \
        --build=missing \
        --update \
        --deployer=direct_deploy \
        -s compiler.cppstd=23
}

package() {
    cd "$srcdir"
    
    install -d "$pkgdir/usr/bin"
    
    install -m755 "direct_deploy/kth/bin/kth" "$pkgdir/usr/bin/kth"
}
