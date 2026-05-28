# Maintainer: Rod Kay <rodakay5 at gmail dot com>

## Note:
#   This package will not build correctly if it is already installed.
#   Remove it first with:
#
#       sudo pacman -Rc langkit
#

pkgname=langkit
pkgdesc='Compiler for syntactic and semantic language analysis libraries'
pkgver=27.0w
pkgrel=1
epoch=1

url='https://github.com/AdaCore/langkit'
arch=(i686 x86_64)
license=(Apache-2.0)


depends=(
    adasat
    gnatcoll-gmp
    gnatcoll-iconv
    ocaml-ctypes
    ocaml-zarith
    prettier-ada
    python
)

makedepends=(
    dune
    gprbuild
    python-pip
    python-coverage
    python-docutils
    python-e3-core
    python-e3-testsuite
    python-funcy
    python-mako
    python-pexpect
    python-pycodestyle
    python-pygments
    python-ptyprocess
    python-railroad-diagrams
    python-sphinx
    texlive-bin
)


_langkit_src="${pkgname}-${pkgver}-20260324-164EA-src"
_adasat_src="adasat-${pkgver}-20260324-1629D-src"


source=(
    'https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/langkit-src.tar.gz'
    'https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/adasat-src.tar.gz'
)

sha256sums=(
    '1d9fd350c1aa3fa61cfa17bade0e6e0fbee7a7ad737676ba8ad5f0b6d759bc65'
    'f9576c214c980680dc4ef13375b464679679e0de5e3d9770b8e0c2f32d84576f'
)


prepare()
{
    cd "$srcdir/$_langkit_src"


    ## Use the AdaSAT source tree from the second tarball.
    #
    ln -sfn "$srcdir/$_adasat_src" langkit/adasat
}


build()
{
    cd "$srcdir/$_langkit_src"


    ## Strip GCC warning flags that GNAT does not understand.
    #
    local ada_flags="$CFLAGS"
    ada_flags="${ada_flags//-Wformat/}"
    ada_flags="${ada_flags//-Werror=format-security/}"


    ## Build the Langkit_Support library used by all generated libraries.
    #
    python manage.py build-langkit-support \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod \
        --gargs="-R -cargs $ada_flags -largs $LDFLAGS -gargs"


    ## Build Langkit itself.
    #
    python manage.py make \
        --no-mypy \
        --library-types=static,static-pic,relocatable


    ## Build the OCaml bindings.
    #
    dune build --root=lkt/build/ocaml


    ## Build the documentation.
    #
    make -C doc html
}


package()
{
    cd "$srcdir/$_langkit_src"


    local python_site
    python_site=$(python -c 'import site; print(site.getsitepackages()[0])')


    ## Install Langkit_Support.
    #
    python manage.py install-langkit-support \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod \
        "$pkgdir/usr"


    ## Install liblktlang.
    #
    python -m langkit.scripts.lkm install \
           -c lkt/langkit.yaml \
           "$pkgdir/usr" \
           --library-types=static,static-pic,relocatable \
           --disable-all-mains


    ## Move Python modules into site-packages.
    #
    install -d "$pkgdir$python_site"
    mv "$pkgdir/usr/python/liblktlang" "$pkgdir$python_site/"
    rm -rf "$pkgdir/usr/python"


    ## Install the langkit Python package itself.
    #
    pip install \
        --root="$pkgdir" \
        --prefix=/usr \
        --no-deps \
        --no-build-isolation \
        .
    
    
    ## Install Java bindings source and JNI support files.
    #
    install -Dm644 \
        "$pkgdir/usr/java/src/main/java/com/adacore/liblktlang/Liblktlang.java" \
        "$pkgdir/usr/share/langkit/java/com/adacore/liblktlang/Liblktlang.java"

    install -Dm644 \
        "$pkgdir/usr/java/pom.xml" \
        "$pkgdir/usr/share/langkit/java/pom.xml"

    install -Dm644 \
        "$pkgdir/usr/java/jni/jni_impl.c" \
        "$pkgdir/usr/share/langkit/java/jni/jni_impl.c"

    rm -rf "$pkgdir/usr/java"


    ## Install the OCaml bindings.
    #
    dune install \
        --root=lkt/build/ocaml \
        --prefix="$pkgdir/usr" \
        --libdir="$pkgdir/usr/lib/ocaml"

    rm -rf "$pkgdir/usr/ocaml"


    ## Remove the empty Windows-specific directory, if present.
    #
    rmdir --ignore-fail-on-non-empty "$pkgdir/usr/lib/windows"


    ## Install the license.
    #
    install -Dm644 \
        LICENSE.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"


    ## Install the generated HTML documentation.
    #
    find doc/_build/html -type f | while read -r file; do
        install -Dm644 "$file" "$pkgdir/usr/share/doc/$pkgname/${file#doc/_build/html/}"
    done
}
