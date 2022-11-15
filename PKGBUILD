# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgbase=gnatcoll-bindings
pkgname=(
    gnatcoll-gmp
    gnatcoll-iconv
    gnatcoll-lzma
    gnatcoll-omp
    gnatcoll-python
    gnatcoll-readline
    gnatcoll-syslog
    gnatcoll-zlib
)
epoch=1
pkgver=23.0.0
pkgrel=1

pkgdesc='GNAT Components Collection - Language and library bindings'
url='https://github.com/AdaCore/gnatcoll-bindings'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

makedepends=('python' 'gprbuild' 'gnatcoll-core' 'libiconv' 'syslog-ng')

source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "0002-fix-python-don-t-cache-prefix-during-install.patch")

sha256sums=('d51a7d1d35b2689feb6b05568702c4a22226538902ffd658e6f98a5d69d7bd51'
            '0655801612e6b69a81d240e6fff71262c7db73c4708766e24627c1329730c345')

_source_dir="$pkgbase-$pkgver"


prepare()
{
    cd "$srcdir/$_source_dir"
    patch -p1 < "$srcdir/0002-fix-python-don-t-cache-prefix-during-install.patch"
}

build()
{
    cd "$srcdir/$_source_dir"
   
    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   _gpr_opts="-R -cargs $ADA_FLAGS -fPIC -largs $LDFLAGS"

    cd "$srcdir/$_source_dir/python3"
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/readline"
    python setup.py build --prefix=/usr --accept-gpl --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/iconv"
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/gmp"
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/lzma"
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/omp"
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/syslog"
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/zlib"
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts
}

_install_license()
{
    cd "$srcdir/$_source_dir"

    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}

package_gnatcoll-python()
{
    pkgdesc='GNAT Components Collection - Interface to the python 3 interpreter.'
    depends=('python' 'gnatcoll-core')
    provides=('gnatcoll-python')
    replaces=('gnatcoll-python')

    cd "$srcdir/$_source_dir/python3"
    python setup.py install --prefix="$pkgdir/usr"

    _install_license
}

package_gnatcoll-readline()
{
    pkgdesc='GNAT Components Collection - Bindings to readline'
    depends=('readline' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/readline"
    python setup.py install --prefix="$pkgdir/usr"

    _install_license
}

package_gnatcoll-iconv()
{
    pkgdesc='GNAT Components Collection - Bindings to Libiconv'
    depends=('libiconv' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/iconv"
    python setup.py install --prefix="$pkgdir/usr"

    _install_license
}

package_gnatcoll-gmp()
{
    pkgdesc='GNAT Components Collection - Bindings to GMP'
    depends=('gmp' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/gmp"
    python setup.py install --prefix="$pkgdir/usr"

    _install_license
}

package_gnatcoll-lzma()
{
    pkgdesc='GNAT Components Collection - Bindings to LZMA'
    depends=('xz' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/lzma"
    python setup.py install --prefix="$pkgdir/usr"

    _install_license
}

package_gnatcoll-omp()
{
    pkgdesc='GNAT Components Collection - Bindings to OpenMP'
    depends=('gnatcoll-core')

    cd "$srcdir/$_source_dir/omp"
    python setup.py install --prefix="$pkgdir/usr"

    _install_license
}

package_gnatcoll-syslog()
{
    pkgdesc='GNAT Components Collection - Bindings to the Syslog the system logger on Unix systems.'
    depends=('syslog-ng' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/syslog"
    python setup.py install --prefix="$pkgdir/usr"

    _install_license
}

package_gnatcoll-zlib()
{
    pkgdesc='GNAT Components Collection - Bindings to Zlib.'
    depends=('zlib' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/zlib"
    python setup.py install --prefix="$pkgdir/usr"

    _install_license
}

# vim: set et ts=4:
