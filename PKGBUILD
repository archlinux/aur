# Maintainer:  Rod Kay            <charlie5 on #ada at irc.libera.chat>

# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>

pkgname=gnatstudio
pkgdesc='GNAT Programming Studio for Ada.'
pkgver=27.0w
pkgrel=1
epoch=1

arch=(x86_64 aarch64)
url='https://github.com/AdaCore/gps'
license=(GPL-3.0-only)

conflicts=(gnatstudio-appimage gnatstudio-bin)

depends=(clang
         ada_language_server
         gnatcoll-python
         gnatcoll-xref
         gnatcoll-db2ada
         gtkada
         python-gobject
         python-cairo
         python-yaml
         python-jedi
         python-pycodestyle
         python-sphinx_rtd_theme)

makedepends=(gprbuild
             texlive-meta
             graphviz)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gnatstudio-src.tar.gz
        0003-Honour-DESTDIR-in-installation-targets.patch
        building_executable_programs_with_gnat.rst
        gps.desktop
        rid_failing_test_for_gtkada_in_configure.ac-patch)

sha256sums=(78a6c118eae0ed69d66ece947dfe27ac771bc4c22e0eefa88c636801fe6da692
            5607c451dbf63dba346eeb2ef602a86321d310bdfb6ef777870bb32761b596d5
            f29080c1d283929cedaa630df27d1688b2099ab5f82601fbf98028a528e935ae
            e21894fc1a0fbc90c25b0c524969703d685f283adc09225744d9013de3b00533
            9d454434aecbc6bb6ce70985feabb97417291c831ae0ac4deec69a5b79fe722f)


prepare()
{
   cd $srcdir/gnatstudio-2026.2-20260409-1617D-src

   patch -p1 < $srcdir/0003-Honour-DESTDIR-in-installation-targets.patch
   patch -Np0 -i $srcdir/rid_failing_test_for_gtkada_in_configure.ac-patch

   cp $srcdir/building_executable_programs_with_gnat.rst gnat
}


build()
{
   cd $srcdir/gnatstudio-2026.2-20260409-1617D-src

   python_version=$(python - <<'EOF'
import sys
print(f"{sys.version_info.major}.{sys.version_info.minor}")
EOF
)

   LC_ALL=C autoconf
   LC_ALL=C ./configure --prefix=/usr

   ## The release tarball contains a bunch of sphinx build artefacts.
   #
   make -C docs clean


   ADA_FLAGS="$CFLAGS"
   ADA_FLAGS="${ADA_FLAGS//-Wformat}"
   ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   ## GPS uses a lot of Unchecked_Conversion (too many to patch), so we have to build with -fno-strict-aliasing.
   ## https://gcc.gnu.org/onlinedocs/gcc-10.2.0/gnat_ugn/Optimization-and-Strict-Aliasing.html
   #
   OS=unix make                   \
        PROCESSORS=0              \
        BUILD=Production          \
        PRJ_BUILD=Release         \
        LIBRARY_TYPE=relocatable  \
        GPRBUILD_FLAGS="-R -cargs $ADA_FLAGS -fno-strict-aliasing -largs $LDFLAGS -lpython$python_version -gargs"


   ## Build the documentation.
   #
   make -C docs all               \
           > make_docs-output.log \
          2> make_docs-errors.log
}


package()
{
#   options=(!strip)

   cd $srcdir/gnatstudio-2026.2-20260409-1617D-src

   OS=unix make DESTDIR=$pkgdir         install
   
   OS=unix make DESTDIR=$pkgdir -C docs install \
           > install_docs-output.log            \
          1> install_docs-errors.log

   ln -s /usr $pkgdir/usr/share/gnatstudio/python


   ## Add the desktop config.
   #
   install -Dm644 -t $pkgdir/usr/share/applications/ $srcdir/gps.desktop


   ## Install the license.
   #
   install -D -m644 \
      COPYING3      \
      $pkgdir/usr/share/licenses/$pkgname/COPYING3
}
