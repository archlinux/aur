# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgbase=gnatcoll-bindings
pkgname=(gnatcoll-gmp
         gnatcoll-iconv
         gnatcoll-lzma
         gnatcoll-omp
         gnatcoll-python
         gnatcoll-readline
         gnatcoll-syslog
         gnatcoll-zlib)
pkgdesc='GNAT Components Collection - Language and library bindings.'
pkgver=26.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/gnatcoll-bindings
arch=(i686 x86_64)
license=(GPL3 custom)

depends=(gnatcoll-core)
makedepends=(python python-setuptools gprbuild libiconv syslog-ng)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/gnatcoll-bindings-26.0w-20250407-1614B-src.tar.gz
        fix-python2-dont-cache-prefix-during-install.patch
        fix-python3-dont-cache-prefix-during-install.patch)

sha256sums=(0fba013f90280dfeb0ccfd3e80965b8797858fcd2c58603c50478dae9cd4d59d
            3c01d8f03f3b9702b4ffb9c668f3bbf33f6908fb8f7a4ce55092cc784d637dc4
            78e6493e38e74d1a2b246de9a50395f07e8d35cb0e7a3694cb62ef2d57d13286)

_source_dir=gnatcoll-bindings-26.0w-20250416-16602-src


prepare()
{
    cd $srcdir/$_source_dir

    patch -p0 < $srcdir/fix-python2-dont-cache-prefix-during-install.patch
    patch -p0 < $srcdir/fix-python3-dont-cache-prefix-during-install.patch
}


build()
{
    cd $srcdir/$_source_dir
   
    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   _gpr_opts="-R -cargs $ADA_FLAGS -fPIC -largs $LDFLAGS"

    cd $srcdir/$_source_dir/python3
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd $srcdir/$_source_dir/readline
    python setup.py build --prefix=/usr --accept-gpl --gpr-opts $_gpr_opts

    cd $srcdir/$_source_dir/iconv
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd $srcdir/$_source_dir/gmp
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd $srcdir/$_source_dir/lzma
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd $srcdir/$_source_dir/omp
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd $srcdir/$_source_dir/syslog
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd $srcdir/$_source_dir/zlib
    python setup.py build --prefix=/usr --gpr-opts $_gpr_opts
}


_install_license()
{
    cd $srcdir/$_source_dir

    # Install the license.
    #
    install -D -m644     \
       COPYING3          \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3

    # Install the custom license.
    #
    install -D -m644     \
       COPYING.RUNTIME   \
       $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}


package_gnatcoll-python()
{
    pkgdesc='GNAT Components Collection - Interface to the python 3 interpreter.'
    depends=(python gnatcoll-core)
    provides=(gnatcoll-python)
    replaces=(gnatcoll-python)

    cd $srcdir/$_source_dir/python3
    python setup.py install --prefix=$pkgdir/usr

    _install_license
}


package_gnatcoll-readline()
{
    pkgdesc='GNAT Components Collection - Bindings to readline'
    depends=(readline gnatcoll-core)

    cd $srcdir/$_source_dir/readline
    python setup.py install --prefix=$pkgdir/usr

    _install_license
}


package_gnatcoll-iconv()
{
    pkgdesc='GNAT Components Collection - Bindings to Libiconv'
    depends=(libiconv gnatcoll-core)

    cd $srcdir/$_source_dir/iconv
    python setup.py install --prefix=$pkgdir/usr

    _install_license
}


package_gnatcoll-gmp()
{
    pkgdesc='GNAT Components Collection - Bindings to GMP'
    depends=(gmp gnatcoll-core)

    cd $srcdir/$_source_dir/gmp
    python setup.py install --prefix=$pkgdir/usr

    _install_license
}


package_gnatcoll-lzma()
{
    pkgdesc='GNAT Components Collection - Bindings to LZMA'
    depends=(xz gnatcoll-core)

    cd $srcdir/$_source_dir/lzma
    python setup.py install --prefix=$pkgdir/usr

    _install_license
}


package_gnatcoll-omp()
{
    pkgdesc='GNAT Components Collection - Bindings to OpenMP'
    depends=(gnatcoll-core)

    cd $srcdir/$_source_dir/omp
    python setup.py install --prefix=$pkgdir/usr

    _install_license
}


package_gnatcoll-syslog()
{
    pkgdesc='GNAT Components Collection - Bindings to the Syslog the system logger on Unix systems.'
    depends=(syslog-ng gnatcoll-core)

    cd $srcdir/$_source_dir/syslog
    python setup.py install --prefix=$pkgdir/usr

    _install_license
}


package_gnatcoll-zlib()
{
    pkgdesc='GNAT Components Collection - Bindings to Zlib.'
    depends=(zlib gnatcoll-core)

    cd $srcdir/$_source_dir/zlib
    python setup.py install --prefix=$pkgdir/usr

    _install_license
}