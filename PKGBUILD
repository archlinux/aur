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
pkgver=0.7.1
pkgrel=1
pkgdesc="Carries version-control history between systems: decodes Git, Mercurial, Subversion and CVS into a verifiable IR (the release's attested binary)"
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
# Literal architectures, not $CARCH: makepkg --printsrcinfo always runs on the x86_64 runner that renders
# this template, so $CARCH in a per-architecture array would write "x86_64" into both lines, and the
# published .SRCINFO's source_aarch64 would then name the wrong tarball (review 110). A build on an
# aarch64 machine still evaluates the PKGBUILD itself and gets the right file either way; it is the
# .SRCINFO that AUR helpers read, and that must be correct without evaluating the PKGBUILD.
source_x86_64=("https://github.com/prikk-vcs/brygge/releases/download/$pkgver/brygge-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/prikk-vcs/brygge/releases/download/$pkgver/brygge-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b4f55c24c97091c70f74f0136e0f958f74274910e554b8d49ceafbdb27007226')
sha256sums_aarch64=('95d84721f5f7172f4c40fdcdd74977510d13e11aa0800cd3c98406b804fc58fe')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" brygge
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
