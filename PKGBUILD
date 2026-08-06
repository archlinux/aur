# Maintainer: Hayden Parker <hayden@bounce.chat>
pkgname=bounce-bin
_pkgname=bounce
# Tracks the newest published release artifact, which is not necessarily the
# newest tag: this repackages the .deb from the GitHub release, so it can only
# move once `make linux-debian-release` has been run and uploaded.
pkgver=0.3.0
pkgrel=1
pkgdesc="A metadata-protecting distributed group chat application"
arch=('x86_64')
url="https://github.com/bounce-chat/bounce"
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")

# Same reasoning as the source package: GLFW dlopen()s every libx* below, so
# they never appear in DT_NEEDED and `ldd` will not show them missing.
#
# This list is derived from the release artifact, not from the source build, so
# re-derive it on every pkgver bump rather than assuming it carried over: 0.2.0
# had no libgcc_s in DT_NEEDED and 0.3.0 does, and the glibc floor moved from
# 2.38 to 2.39 in the same step. `readelf -d`, plus `strings -a bounce |
# grep -E '^lib(X|xkb).*\.so'` for the dlopen'd set.
depends=('hicolor-icon-theme' 'glibc' 'gcc-libs' 'libglvnd' 'wayland'
         'libx11' 'libxcursor' 'libxext' 'libxi' 'libxinerama' 'libxkbcommon'
         'libxrandr' 'libxrender' 'libxxf86vm')

# !debug because Go's DWARF does not produce a useful -debug split package.
# !strip so the package ships exactly the binary that was released; drop it if
# you would rather have the ~50MB back.
options=(!debug !strip)

# pkg/LICENSE must stay a regular file. It was previously a symlink to
# ../LICENSE, whose target is outside anything an AUR repository contains, so a
# published checkout got a dangling link and makepkg failed at source
# validation. Do not "tidy" it back into a symlink; copy the root LICENSE over
# it if that file ever changes.
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.deb"
        "LICENSE")
sha256sums=('04ccced97fb8c844ce46da45b4f127281cdf0b27bf7456ec0d4d3c1d08653c15'
            'e52465d21d1b91e02357470ae262725b8f73d7ecc271a8d1ed7ff2e49f3bc6dc')
# makepkg recognises .deb and unpacks the outer ar archive itself, which just
# leaves control.tar/data.tar lying in $srcdir for prepare() to unpack again.
noextract=("${_pkgname}-${pkgver}.deb")

prepare() {
    # bsdtar rather than `ar x` + `tar xf data.tar.xz`: it reads the .deb and
    # the inner member in one pipeline, and it does not care whether dpkg-deb
    # compressed the payload with xz, zstd or gzip. It comes from libarchive,
    # which pacman depends on, so there is nothing to declare in makedepends.
    bsdtar -xOf "${srcdir}/${_pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -x -C "${srcdir}"
}

package() {
    cd "${srcdir}"

    install -Dm755 "usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "usr/share/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
