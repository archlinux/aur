# Maintainer: Russi <ixaxaar@mailbox.org> <aur@ixaxaar.in>

pkgname=pylucene
pkgver=9.10.0
pkgrel=1
pkgdesc="Python bindings for Apache Lucene"
arch=('x86_64')
url="https://lucene.apache.org/pylucene/"
license=('Apache')
depends=('jdk-openjdk' 'gradle' 'python' 'gcc' 'make' 'ant' 'python-setuptools')
makedepends=('git')
source=(
    "https://downloads.apache.org/lucene/pylucene/pylucene-${pkgver}-src.tar.gz"
)
sha256sums=('f41807c145cf57c8cc90134faa7e990d95c8a41f53d4b7478acec79bef64ece1')

prepare() {
    JAVA_BIN=$(which java)
    JAVA_HOME=$(dirname $(dirname $(readlink -f $JAVA_BIN)))
    export JCC_JDK=$JAVA_HOME
    export JCC_INCLUDES="$JAVA_HOME/include:$JAVA_HOME/include/linux"
    export JCC_LFLAGS="-L$JAVA_HOME/lib/server:-ljvm"

    PYTHON_BIN=$(which python3)
    export PREFIX_PYTHON=$(dirname $(dirname $(readlink -f $PYTHON_BIN)))
    export PREFIX=$PREFIX_PYTHON
    export PYTHON=${PREFIX_PYTHON}/bin/python3
    export JCC="${PYTHON} -m jcc"
    export NUM_FILES=16
    export INSTALL_OPT="--prefix ${startdir}/installed"

    export LD_LIBRARY_PATH="${JAVA_HOME}/lib/server:${LD_LIBRARY_PATH}"
}

build() {
    cd "$srcdir/pylucene-${pkgver}/jcc"

    # sed -i "s/enable_shared = False/enable_shared = True/" ./setup.py
    python setup.py build
    python setup.py install --user

    cd "$srcdir/pylucene-${pkgver}"

    make all || true
    make install
}

package() {
    cd "$srcdir/pylucene-$pkgver"
    PYTHON_VERSION=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    install -dm755 "$pkgdir/usr/lib/python${PYTHON_VERSION}/site-packages"
    cp -r $startdir/installed/lib/python3.12/site-packages/lucene-$pkgver-py$PYTHON_VERSION-linux-x86_64.egg/lucene "$pkgdir/usr/lib/python$PYTHON_VERSION/site-packages/"
    cp -r $startdir/installed/lib/python3.12/site-packages/lucene-$pkgver-py$PYTHON_VERSION-linux-x86_64.egg "$pkgdir/usr/lib/python$PYTHON_VERSION/site-packages/"

    # Add libjvm's path to LD_LIBRARY_PATH for lucene to dynamically load it
    install -Dm755 /dev/null "$pkgdir/etc/profile.d/pylucene.sh"
    cat << EOF > "$pkgdir/etc/profile.d/pylucene.sh"
#!/bin/sh
JAVA_BIN=$(which java)
JAVA_HOME=$(dirname $(dirname $(readlink -f $JAVA_BIN)))
export LD_LIBRARY_PATH="${JAVA_HOME}/lib/server:${LD_LIBRARY_PATH}"
EOF
}
