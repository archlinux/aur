# Maintainer: LittleWatter <zs987526341@gmail.com>
#
# Community package of the official SigilSmith release files. It installs
# them unmodified, as section 3 of the SigilSmith License v2.0 allows: the
# files are checked against the release's SHA256SUMS.txt and the LICENSE is
# installed with them. It is not an official release channel; report
# packaging problems to its AUR maintainer, not to upstream.

pkgname=sigilsmith-bin
pkgver=0.9.11
pkgrel=1
pkgdesc="Mod manager for Baldur's Gate 3 on Linux (unofficial community package of the official release files)"
arch=('x86_64')
url="https://github.com/Agistaris/SigilSmith"
license=('LicenseRef-SigilSmith-2.0')
# What the program loads at run time (readelf -d): libc.so.6 and
# ld-linux-x86-64.so.2 (glibc 2.34 or newer; the only GLIBC_2.39 references
# are the weak symbols pidfd_getpid/pidfd_spawnp, which older glibc simply
# does not resolve), libgcc_s.so.1 (libgcc), liblzma.so.5 (xz) and
# libbz2.so.1.0 (bzip2). hicolor-icon-theme owns the icon directory the
# desktop entry's icon is installed into.
depends=('glibc' 'libgcc' 'xz' 'bzip2' 'hicolor-icon-theme')
provides=('sigilsmith')
conflicts=('sigilsmith' 'sigilsmith-git')
# The official binary is installed exactly as released: no stripping, no
# debug package.
options=('!strip' '!debug')

_release="https://github.com/Agistaris/SigilSmith/releases/download/v${pkgver}"
_deb="sigilsmith_${pkgver}-1_amd64.deb"
source=("${_release}/${_deb}"
        "sigilsmith-${pkgver}-SHA256SUMS.txt::${_release}/SHA256SUMS.txt"
        # Release assets added to v0.9.11 when it was re-published; every
        # later release carries them too.
        "sigilsmith-${pkgver}-LICENSE::${_release}/LICENSE"
        "sigilsmith-${pkgver}-THIRD-PARTY-LICENSES.txt::${_release}/THIRD-PARTY-LICENSES.txt")
noextract=("${_deb}")
# The first two equal the release's own SHA256SUMS.txt and GitHub's asset
# digests; the last two are of the published LICENSE and
# THIRD-PARTY-LICENSES.txt (re-published v0.9.11, 2026-10-18).
sha256sums=('afaaf099db5d917f92a905aecdf4429bd5dd9e783f387ea491fe4268b5103999'
            '5986ceda007c632668c639ebb82dbd62d97a965daa0af5e9325bd0d41074ee6b'
            'dc849abf44d0f4399a05e6d50a4ea901fc1b58f92643cca3de2c2ac9f8ae2acb'
            '22668c1d5fd3c1d2f4ef4e0c088c202214a093074e229b3a6a79b447456fc30c')

prepare() {
  # Check the .deb against the release's SHA256SUMS.txt (license section 3b).
  # makepkg runs the build functions with errexit, so a mismatch aborts.
  grep -E "^[0-9a-f]{64}  ${_deb}\$" "sigilsmith-${pkgver}-SHA256SUMS.txt" | sha256sum -c -

  rm -rf deb
  mkdir deb
  bsdtar -xf "${_deb}" -C deb
  bsdtar -xf deb/data.tar.* -C deb
}

package() {
  # The program, its desktop entry and its icon, as they are in the .deb.
  # The .deb's usr/share/doc/sigilsmith/copyright (Debian metadata carrying
  # the old v1.0 license text) is left out; the current LICENSE is installed
  # instead.
  install -Dm755 deb/usr/bin/sigilsmith "${pkgdir}/usr/bin/sigilsmith"
  install -Dm644 deb/usr/share/applications/sigilsmith.desktop \
    "${pkgdir}/usr/share/applications/sigilsmith.desktop"
  install -Dm644 deb/usr/share/icons/hicolor/scalable/apps/sigilsmith.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sigilsmith.svg"

  install -Dm644 "sigilsmith-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "sigilsmith-${pkgver}-THIRD-PARTY-LICENSES.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-LICENSES.txt"
}
