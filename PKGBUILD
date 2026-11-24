# Maintainer: LittleWatter <zs987526341@gmail.com>
#
# Community package of the official SigilSmith release files. It installs
# them unmodified, as section 3 of the SigilSmith License v2.0 allows: the
# files are checked against the release's SHA256SUMS.txt and the LICENSE is
# installed with them. It is not an official release channel; report
# packaging problems to its AUR maintainer, not to upstream.

pkgname=sigilsmith-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Mod manager for Baldur's Gate 3 on Linux (unofficial community package of the official release files)"
arch=('x86_64')
url="https://github.com/Agistaris/SigilSmith"
license=('LicenseRef-SigilSmith-2.0')
# What the program loads at run time (readelf -d): libc.so.6 and
# ld-linux-x86-64.so.2 (glibc 2.34 or newer, which the release notes name as
# the oldest supported), libgcc_s.so.1 (libgcc), libstdc++.so.6 (libstdc++),
# libudev.so.1 (systemd-libs), libfontconfig.so.1 (fontconfig) and
# libfreetype.so.6 (freetype2). Since 1.0.0 the archive readers and bzip2 are
# compiled in, so xz and bzip2 are no longer needed. hicolor-icon-theme owns
# the icon directory the desktop entry's icon is installed into.
depends=('glibc' 'libgcc' 'libstdc++' 'fontconfig' 'freetype2' 'systemd-libs'
         'hicolor-icon-theme')
# The desktop app's window (Slint) loads its display and rendering
# libraries at run time rather than linking them, and 1.0.0 falls back to
# the terminal app when it cannot open a window. So a bare install still
# gives a working `sigilsmith --tui`, and these only cover the window.
optdepends=('libglvnd: OpenGL rendering for the desktop app'
            'vulkan-icd-loader: Vulkan rendering for the desktop app'
            'wayland: Wayland sessions'
            'libx11: X11 sessions'
            'libxkbcommon: keyboard input in the desktop app'
            'libxkbcommon-x11: keyboard input in an X11 session'
            'libxi: X11 input'
            'libxrender: X11 rendering')
provides=('sigilsmith')
conflicts=('sigilsmith' 'sigilsmith-git')
# The official binary is installed exactly as released: no stripping, no
# debug package.
options=('!strip' '!debug')

_release="https://github.com/Agistaris/SigilSmith/releases/download/v${pkgver}"
_deb="sigilsmith_${pkgver}-1_amd64.deb"
# The release asset LICENSE is renamed here: makepkg stores downloaded
# sources next to this PKGBUILD, where a plain "LICENSE" would collide with
# the packaging repository's own LICENSE file and fail verification.
source=("${_release}/${_deb}"
        "${_release}/SHA256SUMS.txt"
        "sigilsmith-${pkgver}-LICENSE::${_release}/LICENSE"
        "${_release}/THIRD-PARTY-LICENSES.txt")
noextract=("${_deb}")
# The .deb and THIRD-PARTY-LICENSES.txt also equal their lines in the
# release's own SHA256SUMS.txt, which prepare() checks. LICENSE is not
# listed there, so its hash is taken from the release asset itself.
sha256sums=('e2bb51ef6e6e9758a79aebd352da82540ce6267f7684dc851c7a63c1f533426e'
            'd32d3039af74bd5f4a46ada3fb66456b314a8bf6d792b85c2db9c801e86810c3'
            '2f7c63c0242da4a99aca8e5d3667f8b135417c503071ae2eacfab9af3bf476f5'
            '7cfe9e400d3b66944e80db40d040e0dc4ad81bf31aad8590c42f00849c446e13')

prepare() {
  cd "$srcdir"
  # Check the payload against the release's SHA256SUMS.txt (license section
  # 3b), which since 1.0.1 lists THIRD-PARTY-LICENSES.txt as well as the
  # packages. makepkg runs the build functions with errexit, so a mismatch
  # aborts.
  grep -E "^[0-9a-f]{64}  (${_deb//./\\.}|THIRD-PARTY-LICENSES\.txt)$" \
    SHA256SUMS.txt | sha256sum -c -

  rm -rf deb
  mkdir deb
  bsdtar -xf "${_deb}" -C deb
  bsdtar -xf deb/data.tar.* -C deb
}

package() {
  # The program, its desktop entry and its icon, as they are in the .deb.
  # Since 1.0.0 running `sigilsmith` opens a window, so the desktop entry no
  # longer asks for a terminal; the terminal app is `sigilsmith --tui`.
  install -Dm755 deb/usr/bin/sigilsmith "${pkgdir}/usr/bin/sigilsmith"
  install -Dm644 deb/usr/share/applications/sigilsmith.desktop \
    "${pkgdir}/usr/share/applications/sigilsmith.desktop"
  install -Dm644 deb/usr/share/icons/hicolor/scalable/apps/sigilsmith.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sigilsmith.svg"

  # Three files of the .deb are left out. Its polkit action lets the app's
  # update helper run as root, but the helper does so only for a .deb or
  # .rpm install, which it confirms with dpkg-query or rpm; a pacman install
  # updates through its AUR helper instead, so the action could never be
  # used here and would only add a rule that starts a program as root. Its
  # usr/share/doc/sigilsmith/copyright is the same licence text in Debian's
  # machine-readable format, and its usr/share/doc/sigilsmith/THIRD-PARTY-LICENSES.txt
  # is the same file installed below from the release asset, which
  # SHA256SUMS.txt covers; the released LICENSE replaces the copyright file.
  install -Dm644 "sigilsmith-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 THIRD-PARTY-LICENSES.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-LICENSES.txt"
}
