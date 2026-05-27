# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild-bootstrap
pkgdesc='Static GPRbuild to bootstrap XML/Ada and GPRbuild itself.'
pkgver=27.0w
pkgrel=1
epoch=1

arch=(x86_64 aarch64)
url='https://github.com/AdaCore/gprbuild'
license=(GPL-3.0 custom)

makedepends=(gcc-ada)
provides=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gprbuild-src.tar.gz
        https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gprconfig-kb-src.tar.gz
        https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/xmlada-src.tar.gz)

sha256sums=(4a4900fe87e646f69e91b42ba560289ec9f0741bff8f53d8d786970cf4348a24
            f6759ab3b9021f1f8b433b2e6ebd8489c1b7fe1ec848f658b04b9e2ecae27f1c
            d9937b17cf596c03a61ab6127902c60ce2d43c1eb519c3474290a552a1922d3f)


_gprbuild_src=gprbuild-27.0w-20260324-1674D-src
_xmlada_src=xmlada-27.0w-20260324-16261-src
_gprconfig_kb_src=gprconfig-kb-27.0w-20260324-1617F-src


prepare()
{
   cd $srcdir/$_gprbuild_src

   ## GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
   ## must use /usr/lib instead.
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

   CFLAGS="${CFLAGS//-Wformat}"
   CFLAGS="${CFLAGS//-Werror=format-security}"

   ./bootstrap.sh                           \
      --with-xmlada=$srcdir/$_xmlada_src    \
      --with-kb=$srcdir/$_gprconfig_kb_src  \
      --build
}


package()
{
   cd $srcdir/$_gprbuild_src

   DESTDIR=$pkgdir                           \
   ./bootstrap.sh                            \
      --with-kb=$srcdir/$_gprconfig_kb_src   \
      --prefix=/usr                          \
      --libexecdir=/lib                      \
      --install

   ## Install the license.
   #
   install -D -m644 \
      COPYING3      \
      $pkgdir/usr/share/licenses/$pkgname/COPYING3

   ## Install the custom license.
   #
   install -D -m644   \
      COPYING.RUNTIME \
      $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}
