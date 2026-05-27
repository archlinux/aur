# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at irc.libera.chat>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgbase=gprbuild
pkgdesc='Builder for multi-language systems.'
pkgname=(libgpr gprbuild gprtools gprname)
pkgver=27.0w
pkgrel=1
epoch=1

arch=(x86_64 aarch64)
url='https://github.com/AdaCore/gprbuild'
license=(GPL-3.0 custom)

depends=(gcc-ada xmlada)
makedepends=(gprbuild python-sphinx)


source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gprbuild-src.tar.gz
        https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gprconfig-kb-src.tar.gz
        0001-Makefile-build-relocatable-instead-of-static-binary.patch
        gpr.gpr-patch)

sha256sums=(4a4900fe87e646f69e91b42ba560289ec9f0741bff8f53d8d786970cf4348a24
            f6759ab3b9021f1f8b433b2e6ebd8489c1b7fe1ec848f658b04b9e2ecae27f1c
            96df34fab3c61790a7af8db2659a59ce9c8f767d712e9d999e50778bce259db1
            b4a31b4f23c1a040eebad26aff6c771d04afe0b9d7da19c97ef9fde9bceed3db)


_gprbuild_src=gprbuild-27.0w-20260324-1674D-src
_gprconfig_kb_src=gprconfig-kb-27.0w-20260324-1617F-src


prepare()
{
   cd $srcdir/$_gprbuild_src

   patch -Np0 -i $srcdir/0001-Makefile-build-relocatable-instead-of-static-binary.patch
   patch -Np0 -i $srcdir/gpr.gpr-patch     # Rename 'libgpr.so' to 'libgpr-gnat.so' to prevent name clash with the 'grpc' package.

   ln -sfT $srcdir/$_gprconfig_kb_src/db share/gprconfig

   # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
   # must use /usr/lib instead.
   #
   sed -i 's/libexec/lib/g'                            \
      doinstall gprbuild.gpr                           \
      $srcdir/$_gprconfig_kb_src/db/compilers.xml      \
      $srcdir/$_gprconfig_kb_src/db/linker.xml         \
      $srcdir/$_gprconfig_kb_src/db/gnat.xml
}


build()
{
   cd $srcdir/$_gprbuild_src

   ADA_FLAGS="$CFLAGS"
   ADA_FLAGS="${ADA_FLAGS//-Wformat}"
   ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   GPRBUILD_OPTIONS="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"
   make BUILD=production setup

   make GPRBUILD_OPTIONS="$GPRBUILD_OPTIONS" libgpr.build
   make GPRBUILD_OPTIONS="$GPRBUILD_OPTIONS" build

   cd doc
   make html                     \
        1> doc-make-warnings.log \
        2> doc-make-errors.log
}


_install_licenses()
{
   cd $srcdir/$_gprbuild_src

   # Install the license.
   #
   install -D -m644 \
      COPYING3      \
      $pkgdir/usr/share/licenses/$pkgname/COPYING3

   # Install the custom license.
   #
   install -D -m644   \
      COPYING.RUNTIME \
      $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}


package_libgpr()
{
   pkgdesc='Ada library to handle Gnat project files.'
   depends=(xmlada)

   cd $srcdir/$_gprbuild_src

   make prefix=$pkgdir/usr libgpr.install
   _install_licenses
}


package_gprbuild()
{
   depends=(libgpr)
   conflicts=(gprbuild-bootstrap gprbuild-bootstrap-debug)

   cd $srcdir/$_gprbuild_src

   make prefix=$pkgdir/usr install

   rm $pkgdir/usr/bin/{gprclean,gprconfig,gprinstall,gprls,gprname}

   _install_licenses

   # We don't need to distribute the installation script.
   #
   rm -f -- $pkgdir/usr/doinstall

   # Install the knowledge base.
   #
   cp -fr $srcdir/$_gprconfig_kb_src/db \
          $pkgdir/usr/share/gprconfig
}


package_gprtools()
{
   conflicts=(gprbuild-bootstrap gprbuild-bootstrap-debug)

   cd $srcdir/$_gprbuild_src

   mkdir -p $pkgdir/usr/bin

   cp exe/production/gprclean   $pkgdir/usr/bin
   cp exe/production/gprconfig  $pkgdir/usr/bin
   cp exe/production/gprinstall $pkgdir/usr/bin
   cp exe/production/gprls      $pkgdir/usr/bin

   _install_licenses
}


package_gprname()
{
   conflicts=(gprbuild-bootstrap gprbuild-bootstrap-debug)

   cd $srcdir/$_gprbuild_src

   mkdir -p $pkgdir/usr/bin
   cp exe/production/gprname $pkgdir/usr/bin

   _install_licenses
}
