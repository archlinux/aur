# Maintainer:  xiretza            <xiretza+aur@gmail.com>
# Maintainer:  Rod Kay            <charlie5 on #ada at freenode.net>
# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>

pkgname=gnat-gps
pkgver=2022
pkgrel=3
pkgdesc="GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gps"
license=('GPL')

depends=("clang"           "ada_language_server"
         "gnatcoll-python" "gnatcoll-xref"    "gnatcoll-db2ada" "gtkada"
         "python-gobject"  "python-cairo"     "python-yaml")
#         "python-gobject" "python-gobject2"  "python-cairo"   "python-yaml")

makedepends=('gprbuild' 'texlive-latexextra' 'graphviz')

source=("https://github.com/AdaCore/gnatstudio/archive/refs/heads/22.2.zip"
        gnatstudio-support.zip::https://github.com/charlie5/archlinux-gnatstudio-support/archive/refs/heads/main.zip
        0003-Honour-DESTDIR-in-installation-targets.patch
        0004-Honour-GPRBUILD_FLAGS-in-cli-Makefile.patch
        patch-shared.gpr.in
        site-packages.tar.gz
        gps.desktop)

sha256sums=('96f43558be5013df8c41fe61303da114e43244bd30b2dd03b2fd1f4d8865c283'
            '10820ae36b93501efa7e1d09b2458b6bdbe324f87f045d80ccc7eebed2cbad99'
            '5607c451dbf63dba346eeb2ef602a86321d310bdfb6ef777870bb32761b596d5'
            '67b8145d32f555ffab46f41ca52ebbb30d06bc1d814880e42acc7bfb8f68ef6f'
            '1dcfcc761dafb901537e96d40e09222a4ac72359c662886ed6c6e603fac7e2cf'
            'f0286859acf338c10726f303c325db6f30a743af4a4d7b4895388d14748ea38c'
            'e21894fc1a0fbc90c25b0c524969703d685f283adc09225744d9013de3b00533')

prepare()
{
  cd "$srcdir/gnatstudio-22.2"

  patch -Np0 -i ../patch-shared.gpr.in
  patch -p1 < "$srcdir/0003-Honour-DESTDIR-in-installation-targets.patch"
  patch -p0 < "$srcdir/0004-Honour-GPRBUILD_FLAGS-in-cli-Makefile.patch"
}

build() 
{
  cd "$srcdir/gnatstudio-22.2"

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

  export BUILD=Production
  make -j1 OS=unix PROCESSORS=0 BUILD=Production PRJ_BUILD=Release LIBRARY_TYPE=relocatable GPRBUILD_FLAGS="-R -cargs $ADA_FLAGS -fno-strict-aliasing -largs $LDFLAGS -lpython3.10 -gargs"
#  make -j1 OS=unix PROCESSORS=0 BUILD=Production PRJ_BUILD=Release LIBRARY_TYPE=relocatable GPRBUILD_FLAGS="-R -cargs $ADA_FLAGS -fno-strict-aliasing -largs $LDFLAGS -lpython2.7 -lpython3.10 -gargs"
#  make -C docs all     ### Docs are currently broken.
}

package() 
{
  cd "$srcdir/gnatstudio-22.2"

  export OS=unix
  make DESTDIR="$pkgdir/" install

  # Use the gnatstudio support from the binary Community Edition, since the 
  # source distribution support is riddled with python inconsistencies.
  #
#  rm -fr "$pkgdir/usr/share/gnatstudio"

#  pushd "$srcdir/archlinux-gnatstudio-support-main"
#  tar -xf "$srcdir/archlinux-gnatstudio-support-main/gnatstudio.tar.gz"
#  mv gnatstudio "$pkgdir/usr/share"
#  popd

  # Add no longer available Python 2.7 packages.
  #
#  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages"
 
#  pushd "$srcdir/site-packages"
#  for file in $(find . -type f); do
#    install -m 644 -D ${file} "$pkgdir/usr/lib/python2.7/site-packages"/${file#source/}
#  done
#  popd

  # Add the desktop config.
  install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/gps.desktop"
  
  # Install the license.
  install -D -m644     \
     "COPYING3"        \
     "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}