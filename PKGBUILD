# Maintainer: nabbisen <19984221+nabbisen@users.noreply.github.com>
#
# Rendered from this template by tools/aur-render.sh (RFC 016 D-1): edit the template, not a rendered
# PKGBUILD. Only the version, pkgrel and the two checksums below are filled in; everything else is the
# real PKGBUILD.
#
# The release's own Linux binaries, verified by `gh attestation verify` before this is ever rendered
# (release.yml's `aur` job) — so this package never carries a binary the release did not attest to. The
# archives are flat (brygge, LICENSE, build-info.txt at the tar root; see release.yml's `build` job), so
# package() installs directly from $srcdir with no subdirectory to enter.
pkgname=brygge-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A VCS history to IR converter (Git, Mercurial, Subversion, CVS), the release's attested binary"
arch=('x86_64' 'aarch64')
url="https://github.com/prikk-vcs/brygge"
license=('Apache-2.0')
# namcap: a prebuilt binary's glibc/libgcc linkage is an error here (no makedepends implies it, unlike
# the source package) unless stated explicitly.
depends=('glibc' 'gcc-libs')
# Review 084 D-2: this binary is the release's own attested file (gh attestation verify, in release.yml's
# `aur` job, before this is ever rendered) — makepkg's default strip/debug options would split debug data
# out of it and rewrite it, so the installed /usr/bin/brygge would no longer be the exact bytes that were
# verified. There is nothing to usefully split from a prebuilt release binary anyway. `brygge` (the other
# package here, built from source) keeps makepkg's normal stripping and debug package, which is correct
# for a from-source build — see its own template's namcap note on brygge-debug, which this package no
# longer produces at all, so there's nothing here to flag.
# namcap flags "ELF file (usr/bin/brygge) is unstripped" as a direct, expected consequence of !strip — a
# justified exception (not a bug), the same way the glibc/libgcc note above is: the binary must stay the
# exact attested bytes, never rewritten by a build step.
options=('!strip' '!debug')
provides=('brygge')
conflicts=('brygge')
# $CARCH, not a literal "x86_64"/"aarch64" (namcap), matches both this array's own arch and the Linux
# target triple's first segment (release.yml's `build` job names its targets x86_64/aarch64-unknown-linux-gnu).
source_x86_64=("https://github.com/prikk-vcs/brygge/releases/download/$pkgver/brygge-$CARCH-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/prikk-vcs/brygge/releases/download/$pkgver/brygge-$CARCH-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b6fc05d11d002f6a87496383f99b85b7ee90c252314ced2cdb68c5b923591175')
sha256sums_aarch64=('7269dcc0b1d537628de9cd0fff8fdd2cb32d9def50b92b065a89d66ca6655227')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" brygge
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
