# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=ada-web-server
pkgver=2020
pkgrel=2
pkgdesc="A complete embeddable Web application framework for Ada."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/aws
license=(GPL)
groups=(gcc-ada)

depends=('gcc-ada')
makedepends=(gprbuild texlive-bin)

provides=(aws)

source=('https://community.download.adacore.com/v1/61134515bc9fc53a3ccc6c6f0097cb95e2b0722e?filename=aws-20.0w-20190801-155D3-src.tar.gz'
        'aws-net-acceptors.adb-patch'
        'aws-server.adb-patch'
        'aws-server-hotplug.adb-patch')
sha1sums=('61134515bc9fc53a3ccc6c6f0097cb95e2b0722e'
          'e67c1264c9e4d03b5aa793edca97eb98b6fd813c'
          'ad5d8f554910747598325bdf4d8171bc03b1c6f3'
          '01b054021747ba83f3e69e78b71b2a59c074bb06')


prepare()
{
    cd $srcdir/aws-20.0w-20190801-155D3-src
    
    patch -p1 < "$srcdir/aws-net-acceptors.adb-patch"
    patch -p1 < "$srcdir/aws-server.adb-patch"
    patch -p1 < "$srcdir/aws-server-hotplug.adb-patch"
}


build() 
{
    cd $srcdir/aws-20.0w-20190801-155D3-src

    export BUILD_MODE=prod
    export LIBRARY_TYPE=static
    export LIBADALANG_LIBRARY_TYPE=relocatable
    export LANGKIT_SUPPORT_LIBRARY_TYPE=relocatable
    export BUILD=relocatable
    
    make setup
    make build

    cd docs
    make SPHINXBUILD=sphinx-build2 html
}


package() 
{
    cd $srcdir/aws-20.0w-20190801-155D3-src

    make DESTDIR="$pkgdir" install
}
