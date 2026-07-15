# Maintainer: Alexander Koppe <koppe@posteo.de>
pkgname=mega65-tools-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Tools and utilities for the MEGA65 retro computer (m65, mega65_ftp, etherload, bit2core, bit2mcs, romdiff, coretool)"
arch=('x86_64' 'aarch64')
url="https://github.com/MEGA65/mega65-tools"
license=('GPL-3.0-only')
depends=('libusb' 'libpng' 'zlib' 'readline' 'ncurses' 'python')
makedepends=('git' 'pkgconf')
provides=('mega65-tools')
conflicts=('mega65-tools')
source=("mega65-tools::git+https://github.com/MEGA65/mega65-tools.git#branch=development"
        "ophis::git+https://github.com/gardners/Ophis.git"
        "mega65-libc::git+https://github.com/MEGA65/mega65-libc.git"
        "cc65::git+https://github.com/cc65/cc65.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# Upstream has no version tags (only "CI-development-latest"),
# hence a purely commit-based VCS version.
pkgver() {
  cd mega65-tools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd mega65-tools
  # Wire the required submodules to the local clones (no network access
  # in build()). Ophis assembles the etherload "ethlets" and ftphelper;
  # cc65 + mega65-libc are needed for the remotesd helper PRGs embedded
  # into mega65_ftp. cc65 must be built from the pinned submodule: the
  # Arch cc65 package (2.19, from 2020) crashes with SIGSEGV while
  # compiling remotesd_eth.c. The cbmconvert submodule is not needed
  # for the host tools.
  git submodule init Ophis src/mega65-libc cc65
  git config submodule.Ophis.url "$srcdir/ophis"
  git config submodule.src/mega65-libc.url "$srcdir/mega65-libc"
  git config submodule.cc65.url "$srcdir/cc65"
  git -c protocol.file.allow=always submodule update Ophis src/mega65-libc cc65
}

build() {
  cd mega65-tools
  # Build only the host tools upstream defines as "packaged" (TOOLSUNX).
  # The full `make all` additionally builds D81 images, tests and extra
  # tools, requiring gtest, imagemagick, cbmconvert and more.
  #
  # DO_SMU=0    — no `git submodule update` during the build (submodules
  #               were wired up in prepare()); the Makefile builds cc65
  #               from the pinned submodule.
  # DO_STATIC=0 — link dynamically; the default -Wl,-Bstatic fails on
  #               Arch for lack of static readline/ncurses and violates
  #               packaging guidelines.
  make DO_SMU=0 DO_STATIC=0 \
    bin/m65 bin/mega65_ftp bin/etherload bin/bit2core bin/bit2mcs \
    bin/romdiff bin/coretool
}

package() {
  cd mega65-tools
  local tool
  for tool in m65 mega65_ftp etherload bit2core bit2mcs romdiff coretool; do
    install -Dm755 "bin/$tool" "$pkgdir/usr/bin/$tool"
  done
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
