# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgname=qemu-user-static
pkgdesc='A generic and open source machine emulator, statically linked'
pkgver=2.10.0
pkgrel=1

pkgname=$_pkgname-bin
arch=('i686' 'x86_64')
url="http://wiki.qemu.org"
license=('GPL2' 'LGPL2.1')
depends=()
makedepends=('perl')
provides=("$_pkgname")
conflicts=("$_pkgname")

if [ "$CARCH" = 'i686' ] ; then
  _arch=i386
  _csum=31374487e53e533d2fe71fb2cf34d5f4f42e01aadee19a5abd1f76ca92079f84
elif [ "$CARCH" = 'x86_64' ] ; then
  _arch=amd64
  _csum=8b9a049de297ebdb9c69200edaee68c4c94b757829bbcb74235db1a067bc7ad1
else
  _arch="$CARCH"
  _csum=SKIP
fi
_debsrc="${_pkgname}_${pkgver}+dfsg-1_${_arch}.deb"

source=(
  "qemu-user-static.deb::http://ftp.debian.org/debian/pool/main/q/qemu/${_debsrc}"
  "qemu.binfmt" # http://src.fedoraproject.org/rpms/qemu/raw/master/f/qemu.binfmt
)
sha256sums=(
  "$_csum"
  '0c1e998022f3306946cd66678f363b10d93b1309c5bbc9f0e6064080a3b604f9'
)

prepare() {
  rm -Rf build
  mkdir build
}

build() {
  cd build
  tar -xJf ../data.tar.xz -C .
  create_binfmts
}

package() {
  cd build

  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/usr/lib/binfmt.d

  cp usr/bin/qemu-*-static "$pkgdir"/usr/bin/
  cp usr/lib/binfmt.d/qemu-*-static.conf "$pkgdir"/usr/lib/binfmt.d/
  cp usr/share/man/man1/qemu-*-static.1.gz "$pkgdir"/usr/share/man/man1/
}

create_binfmts() {
  rm -Rf usr/lib/binfmt.d
  mkdir -p usr/lib/binfmt.d
  for i in \
          aarch64 \
          alpha \
          armeb \
          arm \
          cris \
          i386 \
          i486 \
          m68k \
          microblazeel \
          microblaze \
          mips64el \
          mips64 \
          mipsel \
          mips \
          ppc64abi32 \
          ppc64le \
          ppc64 \
          ppc \
          s390x \
          sh4eb \
          sh4 \
          sparc32plus \
          sparc64 \
          sparc \
          x86_64 \
          ; do

    if [ "$CARCH" = "i686" ] || \
       [ "$CARCH" = "x86_64" ] ; then
      [ "$i" = "i386" ] \
               || [ "$i" = "i486" ] \
               || [ "$i" = "x86_64" ] && continue
    fi

    grep "/qemu-$i:\$" "${srcdir}/qemu.binfmt" \
            | tr -d '\n' \
            >"usr/lib/binfmt.d/qemu-$i-static.conf"
    echo "F" \
            >>"usr/lib/binfmt.d/qemu-$i-static.conf"
    perl -i -p -e "s/qemu-$i:F/qemu-$i-static:F/" \
            "usr/lib/binfmt.d/qemu-$i-static.conf"
  done
}

# vim:set sw=2 et:
