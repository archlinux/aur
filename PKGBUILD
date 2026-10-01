# Maintainer: Russi <ixaxaar@mailbox.org> <aur@ixaxaar.in>

pkgname=pylucene
pkgver=10.0.0
pkgrel=2
pkgdesc="Python bindings for Apache Lucene"
arch=('x86_64')
url="https://lucene.apache.org/pylucene/"
license=('Apache')
depends=('jdk21-openjdk' 'python')
makedepends=('gradle' 'gcc' 'make' 'python-setuptools' 'icu' 'patchelf')
source=(
    "https://downloads.apache.org/lucene/pylucene/pylucene-$pkgver-src.tar.gz"
)
sha256sums=('100c3d61d6799ac16b7b8c1826cddf07fb1715141ebdb0d7b8119cdd96b24574')

build() {
    cd "$srcdir/pylucene-$pkgver"

    # Always build against JDK 21 (PyLucene 10 requires Java >= 21)
    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
    export PATH="$JAVA_HOME/bin:$PATH"
    export JCC_JDK="$JAVA_HOME"
    export JCC_INCLUDES="$JAVA_HOME/include:$JAVA_HOME/include/linux"
    # colon-separated: jcc splits these on os.pathsep
    # rpath lets the modules find libjvm.so without LD_LIBRARY_PATH tweaks
    export JCC_LFLAGS="-L$JAVA_HOME/lib/server:-Wl,-rpath,$JAVA_HOME/lib/server:-ljvm"
    export LD_LIBRARY_PATH="$JAVA_HOME/lib/server${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

    export PYTHON=python3
    export NUM_FILES=16
    # build the ICU normalization resource (lucene/resources/utr30.dat)
    export ICUSBIN=/usr/bin

    # Build JCC (shared mode) and keep it importable through PYTHONPATH only
    ( cd jcc
      python setup.py build )
    _jcc_lib="$PWD/jcc/build/lib.linux-x86_64-cpython-$(python -c 'import sys; print(f"{sys.version_info.major}{sys.version_info.minor}")')"
    export PYTHONPATH="$_jcc_lib${PYTHONPATH:+:$PYTHONPATH}"
    # --shared: through-layer python exception propagation (needs libjcc3.so)
    export JCC="$PYTHON -m jcc --shared"

    # default target: sources, lucene (gradlew collectRuntimeJars), jars,
    # resources, compile (jcc wrapper generation + C++ build)
    # -j1: 'jars' depends on files produced by the phony 'lucene' target,
    # parallel make can evaluate 'jars' before gradle has produced them
    make -j1
}

package() {
    cd "$srcdir/pylucene-$pkgver"

    _pyimpl=$(python -c 'import sys; print(f"cpython-{sys.version_info.major}{sys.version_info.minor}")')
    _sitelib=$(python -c "import site; print(site.getsitepackages()[0])")
    _jvm_rpath="/usr/lib/jvm/java-21-openjdk/lib/server"

    # jcc's --build only runs 'build_ext': the module sources and jars are
    # staged in build/lucene (the package_dir), while the compiled extension
    # lands in build/lib.linux-x86_64-<impl>/lucene/. The embedded classpath
    # is module-relative, so the jars must ship next to __init__.py.
    install -dm755 "$pkgdir/$_sitelib/lucene"
    cp -a build/lucene/. "$pkgdir/$_sitelib/lucene/"
    cp -a build/lib.linux-x86_64-$_pyimpl/lucene/_lucene*.so "$pkgdir/$_sitelib/lucene/"

    # shared mode: ship JCC and libjcc3.so next to the lucene module so that
    # 'import jcc' works and Python exceptions propagate through Java layers
    cp -a "jcc/build/lib.linux-x86_64-$_pyimpl/jcc" "$pkgdir/$_sitelib/"
    cp -a "jcc/build/lib.linux-x86_64-$_pyimpl/libjcc3.so" "$pkgdir/$_sitelib/"
    rm -rf "$pkgdir/$_sitelib/jcc/python.class" "$pkgdir/$_sitelib/jcc/__pycache__"

    # fix rpaths: libjcc3.so lives one level above the module dirs
    patchelf --set-rpath "$_jvm_rpath:\$ORIGIN/.." "$pkgdir/$_sitelib/lucene/_lucene"*.so
    patchelf --set-rpath "$_jvm_rpath:\$ORIGIN/.." "$pkgdir/$_sitelib/jcc/_jcc3"*.so
    patchelf --set-rpath "$_jvm_rpath" "$pkgdir/$_sitelib/libjcc3.so"
}
