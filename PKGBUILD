# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server
pkgdesc='High performance syntactic and semantic engine for the Ada programming language.'
pkgver=24.0w
pkgrel=1
epoch=2

url=https://github.com/AdaCore/ada_language_server
arch=(x86_64)
license=(GPL3)

depends=(libadalang-tools
        gtkada
        libvss
        ada_spawn
        ada-libfswatch
        gpr
        gnatdoc)

makedepends=(gprbuild)

# NOTE: When new releases of spawn, lal, lal-tools, gnatdoc, and vss make it to the AUR, try removing the corresponding patches.
# The patches only exist because the tagged versions of the dependencies have not been updated in GitHub.

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/als-$pkgver-20230428-16420-src.tar.gz
        als.patch
        spawn.patch
        lal-tools.patch
        lal.patch
        gnatdoc.patch
        vss.patch)

b2sums=(f0d031d067bfb91baa032d2d4e6b278b748f51a4372c88c01930a18d6a4033aa0cf153391c5a2f547e20fd1f2c8fbc09df5e49d5071236bbf7f834b0df4abeee
        95a8d0ad9367606e5d6426dec432941d76e7bf7f8f7de3915282dcea9fcf7da783611b94f1f09376d5fac5b0fa2e81f470d01344dd42ab607918709e5a48e43b
        56fecf391b0618a97ea5e010b272346ae761254354bb9b74241508d47dffa6e8abaaeedd1be267775be54347c63929ad4a9f9744f9abc7f360169b139ac957ef
        7dd817aba9cc422f458f1af219c92594a0bdbc2c2a22aa3e7922c51100bb4b67ca0a1c4081c1139be43c04cdd4637b81aa820f7e5bf742ce13afe10de4319d31
        509b44efc1a2ef8cf0216632bbf03980956ba500bcedd7442308b60ffe5668a0db851de11af0606626ba4726f5efaf10cad1dca16e898b379f6314dc03f51b2e
        6c0b7074e2897fc1a8ca3131b6585ebf4f943a95b8129272f96643cbc61e241e31d4924a39be7b70301b58a50cd1e9455145cda0b2c14f3c20b9bd2b454a2715
        19682602c942eb3cf4a1e911d311468f21003ef7b4bd5c0f36d592cc2088faa50a9dc814dd14596be5bfb834ee3de57fc83c3323462076379995f4042a484849)


prepare()
{
#    cd "$srcdir/$pkgname-$pkgver"
    cd $srcdir/als-24.0w-20230428-16420-src
    
#    patch --strip=1 < ../als.patch
#    patch --strip=1 --reverse < ../spawn.patch
#    patch --strip=1 --reverse < ../lal-tools.patch
#    patch --strip=1 --reverse < ../lal.patch
#    patch --strip=1 --reverse < ../gnatdoc.patch
#    patch --strip=1 < ../vss.patch
}


build()
{
#    cd $srcdir/$pkgname-$pkgver
    cd $srcdir/als-24.0w-20230428-16420-src

#    make
    make BUILD_MODE=prod all

    export LIBRARY_TYPE=relocatable
    gprbuild gnat/lsp_client_glib.gpr
}


#check() {
#    cd $srcdir/$pkgname-$pkgver
#    make check
#}


package()
 {
    cd $srcdir/als-24.0w-20230428-16420-src

    make BUILD_MODE=prod LIBRARY_TYPE=relocatable DESTDIR=$pkgdir/usr install

    export LIBRARY_TYPE=relocatable
    gprinstall --prefix=$pkgdir/usr -p gnat/lsp_client_glib.gpr
}