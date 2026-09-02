# Maintainer: Ryan Kes <ryan@andthensome.nl>
#
# Binary package: the release job already produces a Bun-compiled,
# self-contained Linux binary per arch (see openspec/changes/
# add-os-packaging/design.md) and this just places it, plus the man
# page. No build() step, no makedepends -- there is nothing to compile.
#
# source= points at github.com release assets, never git.higherlearning.eu
# -- that instance returns a 404 on anonymous fetches even for public
# repos, confirmed on the now-archived scaffold-arch-package.
pkgname=washy-washy-cli-bin
pkgver=3.1.5
pkgrel=1
pkgdesc="Turns a JSON chart of laundry piles into a phone PDF and a printable PDF"
arch=('x86_64' 'aarch64')
url="https://github.com/alrayyes/washy-washy-cli"
license=('GPL-3.0-or-later')
provides=('washy-washy-cli')
conflicts=('washy-washy-cli')
# namcap wants glibc declared explicitly even though it's always present
# on Arch -- it detected the binary's real dynamic dependencies directly
# (confirmed via ldd: libc, libpthread, libdl, libm, the dynamic linker --
# nothing else, since the release job builds with Bun's official install,
# never a distro-repackaged one; see design.md for why that distinction
# turned out to matter).
depends=('glibc')
# makepkg's default tidy pass runs `strip` on every binary it packages.
# That corrupts a `bun build --compile` executable -- confirmed directly:
# a stripped copy still ran, but silently fell back to Bun's own CLI menu
# instead of the embedded script's output, for every argument tried
# including --help. !debug skips gdb-add-index for the same binary,
# which only ever logged "No debugging symbols" noise, never usefully.
# The remaining namcap warnings (unstripped, lacks PIE/RELRO, "unused"
# libc/libpthread/libdl) are all consequences of packaging someone else's
# prebuilt binary rather than compiling from source here -- there's no
# LDFLAGS this PKGBUILD controls, and unstripped is the point, not an
# oversight.
options=(!strip !debug)
# The man page's local name carries $pkgver too, same as the binary's --
# without it, makepkg's source cache (paru: ~/.cache/paru/clone/<pkg>) keeps
# reusing a prior version's already-downloaded washy-washy-cli.1.gz on a
# version bump instead of fetching the new one, since the filename never
# changed -- the stale file then fails checksum against the new PKGBUILD's
# sha256sums entry. Confirmed live: see #183.
source_x86_64=(
  "washy-washy-cli-$pkgver-$CARCH::https://github.com/alrayyes/washy-washy-cli/releases/download/v$pkgver/washy-washy-cli-linux-x64"
  "washy-washy-cli-$pkgver.1.gz::https://github.com/alrayyes/washy-washy-cli/releases/download/v$pkgver/washy-washy-cli.1.gz"
)
source_aarch64=(
  "washy-washy-cli-$pkgver-$CARCH::https://github.com/alrayyes/washy-washy-cli/releases/download/v$pkgver/washy-washy-cli-linux-arm64"
  "washy-washy-cli-$pkgver.1.gz::https://github.com/alrayyes/washy-washy-cli/releases/download/v$pkgver/washy-washy-cli.1.gz"
)
# Real checksums are filled in by the AUR-publish job (`updpkgsums`)
# against that release's actual assets -- these are placeholders until
# the first tagged release exists to compute them against.
sha256sums_x86_64=('101f1455b4cf4ca7484b39ccc5e94f3ad59480478ba919c98c54587a475345ad'
                    'b9a18e292c66e20fc41e7294d7dff1c4a600cd80a03d913a9404fcdc5614315d')
sha256sums_aarch64=('61e2fbc99a2ee192f8511a320eb86e32e46bb1ca39405b3b019da6881ad4ca42'
                    'b9a18e292c66e20fc41e7294d7dff1c4a600cd80a03d913a9404fcdc5614315d')

# No LICENSE install: this PKGBUILD lives alone in the AUR git repo, with
# nothing else from the upstream checkout beside it, and it isn't in
# `source=` either -- `license=()` plus `url=` above is what AUR expects
# for that case.
package() {
  install -Dm755 "washy-washy-cli-$pkgver-$CARCH" "$pkgdir/usr/bin/washy-washy-cli"
  install -Dm644 "washy-washy-cli-$pkgver.1.gz" "$pkgdir/usr/share/man/man1/washy-washy-cli.1.gz"
}
