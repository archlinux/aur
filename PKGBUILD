# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: slact
pkgname=(
  'acpidump-all'
  'amdfwtool'
  'autoport'
  'cbfstool'
  'cbmem'
#  'coreboot-configurator'  # use StarLabs fork: https://support.starlabs.systems/kb/guides/coreboot-configurator
  'ectool'
  'ifdtool'
  'intelmetool'
  'inteltool'
  'intelvbttool'
  'me_cleaner'
  'msrtool'
  'nvramtool'
  'pmh7tool'
  'superiotool'
)
pkgbase=coreboot-utils
pkgver=25.09
pkgrel=1
pkgdesc="Tools and utilities to work with coreboot firmware"
url="https://www.coreboot.org"
license=('GPL-2.0-only')
arch=('x86_64')
depends=(
  'acpica'
  'dmidecode'
  'glibc'
  'pciutils'
  'python'
#  'qt5-base'  # coreboot-configurator
#  'qt5-svg'  # coreboot-configurator
#  'yaml-cpp'  # coreboot-configurator
  'zlib'
)
makedepends=(
  'go'
#  'inkscape'  # coreboot-configurator
#  'meson'  # coreboot-configurator
)
source=("https://coreboot.org/releases/coreboot-$pkgver.tar.xz"{,.sig})
sha256sums=('7bdc8f177bc3705e11099fef1d0028a39fc9ae659c9b1e5055781a9a762f6da4'
            'SKIP')
validpgpkeys=('C75AAA4E5C9DB017C1DC6EDBDB1B0EC29202D874') # Matt DeVillier <matt.devillier@gmail.com>

prepare() {
  cd "coreboot-$pkgver"

  # sbin > bin
  for program in cbmem ectool intelmetool inteltool nvramtool pmh7tool superiotool; do
    sed -i 's/sbin/bin/g' "util/${program}/Makefile"
  done
  sed -i 's/sbin/bin/g' util/msrtool/Makefile.in
}

build() {
  cd "coreboot-$pkgver"

  echo ""
  echo "Building amdfwtool..."
  echo ""
  make -C util/amdfwtool

  echo ""
  echo "Building autoport..."
  echo ""
  pushd util/autoport
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v ./...

  # Clean module cache for makepkg -C
  go clean -modcache
  popd

  echo ""
  echo "Building cbfstool..."
  echo ""
  make -C util/cbfstool

  echo ""
  echo "Building cbmem..."
  echo ""
  make -C util/cbmem

#  echo ""
#  echo "Building coreboot-configurator..."
#  echo ""
#  arch-meson util/coreboot-configurator util/coreboot-configurator/build
#  meson compile -C util/coreboot-configurator/build

  echo ""
  echo "Building ectool..."
  echo ""
  make -C util/ectool

  echo ""
  echo "Building ifdtool..."
  echo ""
  make -C util/ifdtool

  echo ""
  echo "Building intelmetool..."
  echo ""
  make -C util/intelmetool CFLAGS+="-I $srcdir/coreboot-$pkgver/src/commonlib/bsd/include"

  echo ""
  echo "Building inteltool..."
  echo ""
  make -C util/inteltool

  echo ""
  echo "Building intelvbttool..."
  echo ""
  make -C util/intelvbttool

  echo ""
  echo "Building msrtool..."
  echo ""
  pushd util/msrtool
  VERSION="$pkgver" ./configure
  make
  popd

  echo ""
  echo "Building nvramtool..."
  echo ""
  make -C util/nvramtool

  echo ""
  echo "Building pmh7tool..."
  echo ""
  make -C util/pmh7tool

  echo ""
  echo "Building superiotool..."
  echo ""
  make -C util/superiotool
}

package_acpidump-all() {
  pkgdesc="Walk through all ACPI tables with their addresses"
  depends=(
    'acpica'
    'bash'
  )

  cd "coreboot-$pkgver"
  install -Dm755 "util/acpi/$pkgname" -t "$pkgdir/usr/bin/"
}

package_amdfwtool() {
  pkgdesc="Create AMD firmware combination"
  depends=('glibc')

  cd "coreboot-$pkgver"
  install -Dm755 "util/$pkgname"/{"$pkgname",amdfwread} -t "$pkgdir/usr/bin/"
}

package_autoport() {
  pkgdesc="Automated porting coreboot to Sandy Bridge/Ivy Bridge platforms"
  depends=(
    'acpica'
    'dmidecode'
    'ectool'
    'glibc'
    'inteltool'
    'pciutils'
    'superiotool'
  )

  cd "coreboot-$pkgver"
  install -Dm755 "util/$pkgname/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "util/$pkgname/readme.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_cbfstool() {
  pkgdesc="Management utility for CBFS formatted ROM images"
  depends=('glibc')
  optdepends=('qemu-system-x86')

  cd "coreboot-$pkgver"
  make -C "util/$pkgname" PREFIX='/usr' DESTDIR="$pkgdir" install
  install -Dm644 "util/$pkgname/EXAMPLE" -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_cbmem() {
  pkgdesc="coreboot console log reader"
  depends=('glibc')

  cd "coreboot-$pkgver"
  make -C "util/$pkgname" PREFIX='/usr' DESTDIR="$pkgdir" install
}

package_coreboot-configurator() {
  pkgdesc="A simple GUI to change settings in coreboot's CBFS, via the nvramtool utility"
  depends=(
    'nvramtool'
    'qt5-base'
    'qt5-svg'
    'yaml-cpp'
  )

  cd "coreboot-$pkgver"
  meson install -C util/coreboot-configurator/build --destdir "$pkgdir"
}

package_ectool() {
  pkgdesc="Dump the RAM of a laptop's Embedded/Environmental Controller (EC)"
  depends=('glibc')

  cd "coreboot-$pkgver"
  make -C "util/$pkgname" PREFIX='/usr' DESTDIR="$pkgdir" install
}

package_ifdtool() {
  pkgdesc="Extract and dump Intel Firmware Descriptor information"
  depends=(
    'glibc'
    'pciutils'
    'zlib'
  )

  cd "coreboot-$pkgver"
  make -C "util/$pkgname" PREFIX='/usr' DESTDIR="$pkgdir" install
}

package_intelmetool() {
  pkgdesc="Dump interesting things about Management Engine"
  depends=(
    'glibc'
    'pciutils'
    'zlib'
  )

  cd "coreboot-$pkgver"
  make -C "util/$pkgname" PREFIX='/usr' DESTDIR="$pkgdir" install
}

package_inteltool() {
  pkgdesc="Provides information about Intel CPU/chipset hardware configuration"
  depends=(
    'glibc'
    'pciutils'
    'zlib'
  )

  cd "coreboot-$pkgver"
  make -C "util/$pkgname" PREFIX='/usr' DESTDIR="$pkgdir" install
}

package_intelvbttool() {
  pkgdesc="Parse VBT from VGA BIOS"
  depends=('glibc')

  cd "coreboot-$pkgver"
  install -Dm755 "util/$pkgname/$pkgname" -t "$pkgdir/usr/bin/"
}

package_me_cleaner() {
  pkgdesc="Tool for partial deblobbing of Intel ME/TXE firmware images"
  depends=('python')

  cd "coreboot-$pkgver"
  install -Dm755 "util/$pkgname/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "util/$pkgname/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "util/$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_msrtool() {
  pkgdesc="Dump chipset-specific MSR registers"
  depends=(
    'glibc'
    'pciutils'
    'zlib'
  )

  cd "coreboot-$pkgver"
  make -C "util/$pkgname" PREFIX='/usr' DESTDIR="$pkgdir" install
  install -Dm644 "util/$pkgname/README" -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_nvramtool() {
  pkgdesc="Read and write coreboot parameters and display information from the coreboot table in CMOS/NVRAM"
  depends=('glibc')

  cd "coreboot-$pkgver"
  make -C "util/$pkgname" PREFIX='/usr' DESTDIR="$pkgdir" install
}

package_pmh7tool() {
  pkgdesc="Dumps, reads and writes PMH7 registers on Lenovo ThinkPads"
  depends=('glibc')

  cd "coreboot-$pkgver"
  make -C "util/$pkgname" PREFIX='/usr' DESTDIR="$pkgdir" install
}

package_superiotool() {
  pkgdesc="User-space utility to detect Super I/O of a mainboard and provide detailed information about the register contents of the Super I/O"
  depends=(
    'glibc'
    'pciutils'
    'zlib'
  )

  cd "coreboot-$pkgver"
  make -C "util/$pkgname" PREFIX='/usr' DESTDIR="$pkgdir" install
  install -Dm644 "util/$pkgname/README" -t "$pkgdir/usr/share/doc/$pkgname/"
}
