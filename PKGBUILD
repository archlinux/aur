# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer:  Rod Kay            <charlie5 on #ada at freenode.net>
# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>

pkgname=gnat-gps
pkgver=2020
pkgrel=6
pkgdesc="GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gps"
license=('GPL')

depends=("clang" "libadalang"
         "gnatcoll-xref" "gnatcoll-python2" "gnatcoll-db2ada"
         "gnatcoll-gnatinspect" "gtkada"
         "gnome-icon-theme" "gnome-icon-theme-extras" "gnome-icon-theme-symbolic" 
         "python2-gobject2")
optdepends=('python2-jedi')
makedepends=('gprbuild' 'python2-sphinx' 'texlive-latexextra' 'graphviz')

_gps_version=21.0w-20200427-15496
_gps_checksum=bfa68dd61a9288c79e9c08676878cac95e0fe628

_als_ver=21.0w-20200427-156B6
_als_checksum=05e31f6e36e2ff4313013d27f0551416de5a1b4e

_laltools_ver=21.0w-20200425-15675
_laltools_checksum=334dca036084a92552860451619321faee571797

source=("gps-$_gps_version-src.tar.gz::https://community.download.adacore.com/v1/$_gps_checksum?filename="
        "als-$_als_ver-src.tar.gz::https://community.download.adacore.com/v1/$_als_checksum?filename="
        "libadalang-tools-$_laltools_ver-src.tar.gz::https://community.download.adacore.com/v1/$_laltools_checksum?filename="
        0002-Ignore-absence-of-version-number-in-user_guide.patch
        0003-Honour-DESTDIR-in-installation-targets.patch
        0004-Honour-GPRBUILD_FLAGS-in-cli-Makefile.patch
        0005-Fix-recursive-make-in-docs.patch
        gps.desktop)

sha1sums=("$_gps_checksum"
          "$_als_checksum"
          "$_laltools_checksum"
          '525f0b9d64fecb9c2e669cf64b60548b86c575d9'
          '4c13859aa25c5142bd5d0fde7b645217ddeccb50'
          '26f6fac439ec973facccee5412dc4c86b7c6d8c7'
          '6dd1f880f55c9612a2a67d41e6606df26cd829c6'
          'b399c7b3a1fe48152da18081def3dced2e74763b')

prepare()
{
  cd "$srcdir/gps-$_gps_version-src"

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
  ln -sf "$srcdir/libadalang-tools-$_laltools_ver-src" "$srcdir/gps-$_gps_version-src/laltools"
  ln -sf "$srcdir/als-$_als_ver-src"                   "$srcdir/gps-$_gps_version-src/ada_language_server"
}


build() 
{
  cd "$srcdir/gps-$_gps_version-src"

  export OS=unix

  # Force use of python2
  export PATH="$srcdir/gps-$_gps_version-src/temp_bin:$PATH"

  ./configure --prefix=/usr

  # GPS uses a lot of Unchecked_Conversion (too many to patch), so we have to build with -fno-strict-aliasing
  # https://gcc.gnu.org/onlinedocs/gcc-10.2.0/gnat_ugn/Optimization-and-Strict-Aliasing.html
  make PROCESSORS=0 Build=Production GPRBUILD_FLAGS="-R -cargs $CFLAGS -fno-strict-aliasing -largs $LDFLAGS -gargs"
  make -C docs all
}


package() 
{
  cd "$srcdir/gps-$_gps_version-src"

  export OS=unix

  # Force use of python2
  export PATH="$srcdir/gps-$_gps_version/temp_bin:$PATH"

  make DESTDIR="$pkgdir/" install

  # Add the desktop config.
  install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/gps.desktop"
}
