# Maintainer: Russi <ixaxaar@mailbox.org> <aur@ixaxaar.in>

pkgname=pylucene
pkgver=10.0.0
pkgrel=1
pkgdesc="Python bindings for Apache Lucene"
arch=('x86_64')
url="https://lucene.apache.org/pylucene/"
license=('Apache')
depends=('jdk21-openjdk' 'gradle' 'python' 'gcc' 'make' 'ant' 'python-setuptools')
makedepends=('git')
source=(
    "https://downloads.apache.org/lucene/pylucene/pylucene-$pkgver-src.tar.gz"
)
sha256sums=('SKIP') # Replace with the actual checksum

prepare() {
    JAVA_BIN=$(which java)
    JAVA_HOME=$(dirname $(dirname $(readlink -f $JAVA_BIN)))
    export JCC_JDK=$JAVA_HOME
    export JCC_INCLUDES="$JAVA_HOME/include:$JAVA_HOME/include/linux"
    export JCC_LFLAGS="-L$JAVA_HOME/lib/server:-ljvm"

    PYTHON_BIN=$(which python3)
    PREFIX_PYTHON=$(dirname $(dirname $(readlink -f $PYTHON_BIN)))
    export PYTHON=${PREFIX_PYTHON}/bin/python3
    export JCC="${PYTHON} -m jcc"
    export NUM_FILES=16

    export LD_LIBRARY_PATH="$JAVA_HOME/lib/server:$LD_LIBRARY_PATH"
}

build() {
    cd "$srcdir/pylucene-$pkgver/jcc"

    python setup.py build
    python setup.py install --user

    cd "$srcdir/pylucene-$pkgver"

    sed -i 's/--builtin-vmarg/--vmarg/g' Makefile
    make
}

package() {
    cd "$srcdir/pylucene-$pkgver"

    # Create necessary directories
    python_sitelib=$(python -c "import site; print(site.getsitepackages()[0])")
    install -dm755 "$pkgdir${python_sitelib}/pylucene"

    # Install Python modules
    cp -r build/lib.linux-x86_64-cpython-312/* "$pkgdir${python_sitelib}/"

    # Install Java libraries
    install -dm755 "$pkgdir${python_sitelib}/pylucene/lucene-java-${pkgver}"
    cp -r lucene-java-${pkgver}/* "$pkgdir${python_sitelib}/pylucene/lucene-java-${pkgver}/"

    # Install JAR files
    find lucene-java-${pkgver} -name "*.jar" -exec install -Dm644 {} "$pkgdir${python_sitelib}/pylucene/{}" \;
}

post_install() {
    # Add Java library path to LD_LIBRARY_PATH
    echo 'export LD_LIBRARY_PATH=${JAVA_HOME}lib/server:$LD_LIBRARY_PATH' >>/etc/profile.d/jdk.sh
}
