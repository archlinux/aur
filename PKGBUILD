# Maintainer: Raul Dias <raul@dias.com.br>

pkgbase=omaquake
pkgname=('omaquake' 'omaquake-shareware-data')
pkgver=0.1.1
pkgrel=1
pkgdesc="Quake 1 rendered as characters in a terminal"
arch=('x86_64')
url="https://github.com/rsd/omaquake"
license=('GPL-2.0-only')                  # matches the Quake engine source
# chafa, libcaca and alsa-lib are runtime depends of the omaquake package
# only, and in a split PKGBUILD per-package depends are not installed before
# build().  The Makefile detects all three via pkg-config and silently omits a
# backend it cannot find, so in a clean chroot they must be makedepends too or
# the binary ships with no video backend at all.
makedepends=('git' 'make' 'gcc' 'pkgconf' 'libarchive' 'chafa' 'libcaca' 'alsa-lib')

# The engine is a submodule and makepkg will not fetch submodules itself, so
# tyrquake is a second source entry and prepare() rewires the submodule at it.
#
# The tag pin is what makes this reproducible: an unpinned branch would
# silently build whatever master happens to be while still calling itself
# 0.1.1.  Bumping pkgver means moving this tag too.
#
# quake106.zip is the 1996 shareware release: freely redistributable, and the
# only pak0.pak that may be handed out.  It is fetched, never shipped in this
# repo.  Mirror: https://www.gamers.org/pub/idgames/idstuff/quake/quake106.zip
source=("$pkgbase::git+https://github.com/rsd/omaquake.git#tag=v0.1.1"
        "tyrquake::git+https://github.com/libretro/tyrquake.git"
        "https://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake/quake106.zip")
sha256sums=('SKIP'
            'SKIP'
            'ec6c9d34b1ae0252ac0066045b6611a7919c2a0d78a3a66d9387a8f597553239')

prepare() {
  cd "$srcdir/$pkgbase"
  git submodule init
  git config submodule.third_party/tyrquake.url "$srcdir/tyrquake"
  # protocol.file.allow: git refuses file:// submodule transport by default
  # since CVE-2022-39253.  The URL we just pointed it at is makepkg's own
  # verified checkout, not anything the network chose, so allow it here only.
  git -c protocol.file.allow=always submodule update

  # makepkg unpacks quake106.zip for us, but the payload inside it is
  # resource.1: a DOS self-extracting LHA archive.  libarchive reads LHA, so
  # bsdtar opens it directly -- no lhasa/dosbox needed.  Member names are
  # uppercase in the archive; everything downstream (oq_find_pak's dir/id1
  # probe, tyrquake's walk up from the pak to its base directory) expects
  # lowercase id1/pak0.pak, so rename on the way out.
  cd "$srcdir"
  bsdtar -xf resource.1 ID1/PAK0.PAK LICINFO.TXT SLICNSE.TXT README.TXT
  install -Dm644 ID1/PAK0.PAK "$srcdir/id1/pak0.pak"
}

build() {
  cd "$srcdir/$pkgbase"
  make engine
  make
}

check() {
  cd "$srcdir/$pkgbase"
  # Renders one frame of the test pattern; needs no game data.
  # TODO: needs a pty, so this must run under `script` or be dropped.
  ./build/omaquake --help >/dev/null
}

package_omaquake() {
  # alsa-lib is a real link-time dependency, not just an optional backend --
  # namcap flags its absence.  chafa and libcaca are optional at build time but
  # hard deps here so `--video=` always has both choices at runtime.
  depends=('chafa' 'libcaca' 'alsa-lib')
  optdepends=('omaquake-shareware-data: freely redistributable pak0.pak')

  cd "$srcdir/$pkgbase"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgbase/README.md"
  install -Dm644 docs/DESIGN.md "$pkgdir/usr/share/doc/$pkgbase/DESIGN.md"
}

package_omaquake-shareware-data() {
  pkgdesc="Quake 1 shareware game data (episode 1) for omaquake"
  arch=('any')
  license=('LicenseRef-Quake-Shareware')

  # /usr/share/omaquake is already on oq_find_pak's system search list, so an
  # id1/ under it is found with no arguments and no config.
  install -Dm644 "$srcdir/id1/pak0.pak" \
    "$pkgdir/usr/share/omaquake/id1/pak0.pak"
  install -Dm644 "$srcdir/LICINFO.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICINFO.TXT"
  install -Dm644 "$srcdir/SLICNSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/SLICNSE.TXT"
  install -Dm644 "$srcdir/README.TXT" \
    "$pkgdir/usr/share/doc/$pkgname/README.TXT"
}
