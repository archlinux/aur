# Maintainer:  Rod Kay            <charlie5 on #ada at freenode.net>
# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>

pkgname=gnat-gps
pkgver=2020
pkgrel=1
_gps_version="20.2"
pkgdesc="GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gps"
license=('GPL')

depends=("clang" "libadalang"
         "gnatcoll-xref" "gnatcoll-python" "gnatcoll-db2ada"
         "gnatcoll-gnatinspect" "gtkada"
         "gnome-icon-theme" "gnome-icon-theme-extras" "gnome-icon-theme-symbolic" 
         "python2-gobject")
makedepends=('gprbuild' 'python2-sphinx' 'texlive-latexextra' 'graphviz')

_laltools_ver=2020-20200429-1998C
_laltools_checksum=740372d8ffb1e4755a99bead2d78dace904235c0
_als_ver=21.0.3
source=("gps-${_gps_version}.tar.gz::https://github.com/AdaCore/gps/archive/$_gps_version.tar.gz"
        "ada_language_server-$_als_ver.tar.gz::https://github.com/AdaCore/ada_language_server/archive/$_als_ver.tar.gz"
        "libadalang-tools-$_laltools_ver-src.tar.gz::https://community.download.adacore.com/v1/$_laltools_checksum?filename=libadalang-tools-$_laltools_ver-src.tar.gz"
        0001-Use-GPR.Sinput.Reference_Name.patch
        0002-Ignore-absence-of-version-number-in-user_guide.patch
        0003-Honour-DESTDIR-in-installation-targets.patch
        0004-Honour-GPRBUILD_FLAGS-in-cli-Makefile.patch
        0005-Fix-recursive-make-in-docs.patch
        gps.desktop)

sha1sums=('bd0b5c3d3e1c411d2824f93f59534d783010e65c'
          'a737b6d7ee2d4a1193f088a0817070e545752dae'
          "$_laltools_checksum"
          '7befc021358ada26c6a332e623113b32317bfd8c'
          '525f0b9d64fecb9c2e669cf64b60548b86c575d9'
          '4c13859aa25c5142bd5d0fde7b645217ddeccb50'
          '26f6fac439ec973facccee5412dc4c86b7c6d8c7'
          '6dd1f880f55c9612a2a67d41e6606df26cd829c6'
          'b399c7b3a1fe48152da18081def3dced2e74763b')

prepare()
{
  cd "$srcdir/gps-$_gps_version"

  patch -p1 < "$srcdir/0001-Use-GPR.Sinput.Reference_Name.patch"
  patch -p1 < "$srcdir/0002-Ignore-absence-of-version-number-in-user_guide.patch"
  patch -p1 < "$srcdir/0003-Honour-DESTDIR-in-installation-targets.patch"
  patch -p1 < "$srcdir/0004-Honour-GPRBUILD_FLAGS-in-cli-Makefile.patch"
  patch -p1 < "$srcdir/0005-Fix-recursive-make-in-docs.patch"

  # Force use of python2
  rm -fr temp_bin
  mkdir  temp_bin
  ln -s /usr/bin/python2        temp_bin/python
  ln -s /usr/bin/python2-config temp_bin/python-config
  ln -s /usr/bin/sphinx-build2  temp_bin/sphinx-build

  # Link libadalang-tools and ada_language_server into the GPS source tree
  ln -sf "$srcdir/libadalang-tools-$_laltools_ver-src" "$srcdir/gps-$_gps_version/laltools"
  ln -sf "$srcdir/ada_language_server-$_als_ver" "$srcdir/gps-$_gps_version/ada_language_server"
}


build() 
{
  cd "$srcdir/gps-$_gps_version"

  export OS=unix

  # Force use of python2
  export PATH="$srcdir/gps-$_gps_version/temp_bin:$PATH"
	
  ./configure --prefix=/usr
  make PROCESSORS=0 Build=Production GPRBUILD_FLAGS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
  make -C docs all
}


package() 
{
  cd "$srcdir/gps-$_gps_version"

  export OS=unix

  # Force use of python2
  export PATH="$srcdir/gps-$_gps_version/temp_bin:$PATH"

  make DESTDIR="$pkgdir/" install

  # Add the desktop config.
  install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/gps.desktop"
}
