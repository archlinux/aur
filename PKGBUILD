# Maintainer:  xiretza            <xiretza+aur@gmail.com>
# Maintainer:  Rod Kay            <charlie5 on #ada at freenode.net>
# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>

pkgname=gnat-gps
_upstream_ver=2021-20210701-19B6B
pkgver=2021
pkgrel=1
pkgdesc="GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gps"
license=('GPL')

depends=("clang" "ada_language_server"
         "gnatcoll-python2" "gnatcoll-xref" "gtkada"
         "python2-gobject" "python2-gobject2" "python2-cairo"
         "python2-yaml")

optdepends=('python2-jedi')
makedepends=('gprbuild' 'texlive-latexextra' 'graphviz')

_checksum=e940520a321c0aa8b624be178306147970c6b6f9
source=("${pkgname}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgname}-${_upstream_ver}-src.tar.gz"
        0003-Honour-DESTDIR-in-installation-targets.patch
        0004-Honour-GPRBUILD_FLAGS-in-cli-Makefile.patch
        patch-shared.gpr.in
        patch-filter_panels.adb
        patch-gtkada-search_entry.ads
        patch-gtkada-search_entry.adb
        patch-share-support-core-extensions-__init__.py
        patch-share-support-core-modules.py
        patch-share-support-core-tool_output.py
        patch-share-support-ui-pygps-__init__.py
        gps.desktop)

sha1sums=("$_checksum"
          '4c13859aa25c5142bd5d0fde7b645217ddeccb50'
          '4e6cb35c4e2e74d343d0917b926c7377a81b1aba'
          'c71a4484b1e791ea8455a44e602b236dc7497c4d'
          '7a928f86dad330590a8c9e9aff04291e458fd1c6'
          '8815ffbf0077a50c4c2023637d214b1847be40f1'
          '6ec11d04620cb5225df8a43c9a5dbd98e3e3ca53'
          '6c4ec35fcb80336d62960b3b59fbe82ea305f738'
          '79da1943438f081e6a863011c82c80ccec280e03'
          '0a03a65eda52b70c7197aef858e3c552a3fbda34'
          '4492bad6e6a368526654e9c6ac6cc853d4b0fe48'
          'b399c7b3a1fe48152da18081def3dced2e74763b')

prepare()
{
  cd "$srcdir/gps-$_upstream_ver-src"

  patch -Np0 -i ../patch-shared.gpr.in
  patch -Np1 -i ../patch-filter_panels.adb
  patch -Np1 -i ../patch-gtkada-search_entry.ads
  patch -Np1 -i ../patch-gtkada-search_entry.adb

  patch -Np0 -i ../patch-share-support-core-extensions-__init__.py
  patch -Np0 -i ../patch-share-support-core-modules.py
  patch -Np0 -i ../patch-share-support-core-tool_output.py
  patch -Np0 -i ../patch-share-support-ui-pygps-__init__.py

  patch -p1 < "$srcdir/0003-Honour-DESTDIR-in-installation-targets.patch"
  patch -p0 < "$srcdir/0004-Honour-GPRBUILD_FLAGS-in-cli-Makefile.patch"
}


build() 
{
  cd "$srcdir/gps-$_upstream_ver-src"

  export OS=unix

  ./configure --prefix=/usr

  # The release tarball contains a bunch of sphinx build artefacts.
  make -C docs clean
  make -C gnatdoc/docs/users_guide clean

  ADA_FLAGS="$CFLAGS"
  ADA_FLAGS="${ADA_FLAGS//-Wformat}"
  ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

  # GPS uses a lot of Unchecked_Conversion (too many to patch), so we have to build with -fno-strict-aliasing.
  # https://gcc.gnu.org/onlinedocs/gcc-10.2.0/gnat_ugn/Optimization-and-Strict-Aliasing.html

  make -j1 OS=unix PROCESSORS=0 BUILD=Production LIBRARY_TYPE=relocatable GPRBUILD_FLAGS="-R -cargs $ADA_FLAGS -fno-strict-aliasing -largs $LDFLAGS -lpython2.7 -lpython3.9 -gargs"
  make -C docs all
}

package() 
{
  cd "$srcdir/gps-$_upstream_ver-src"

  export OS=unix
  make DESTDIR="$pkgdir/" install

  # Add the desktop config.
  install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/gps.desktop"
  
  # Install the license.
  install -D -m644     \
     "COPYING3"        \
     "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}
