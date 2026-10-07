# Maintainer: Ben Leynen <leynenben@gmail.com>

pkgname=rune-ide
_pkgname=rune
_binaryname=rune
pkgdesc="Fast, GPU-rendered, keyboard-driven IDE for power users"
pkgver=1.2.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/unstablebuild/rune"
license=('GPL-3.0-or-later')
# makepkg's default LTO CFLAGS can break cgo builds, and Go emits no DWARF
# that makepkg's debug split can use (empty /usr/src/debug)
options=('!lto' '!debug')
# the GUI dlopens its graphics and X11 libraries only when a window opens,
# so they're optional and --tui/--headless work without a graphical stack
depends=('glibc' 'hicolor-icon-theme')
makedepends=(
    'go'
    'git'
    'alsa-lib'
    'wayland'
    'libxkbcommon'
    'libx11'
    'libxcursor'
    'libxext'
    'libxi'
    'libxinerama'
    'libxrandr'
    'libxrender'
    'libxxf86vm'
    'libglvnd'
)
optdepends=(
    'zsh: bundled shell profile bootstrap'
    'libglvnd: OpenGL and EGL GUI support'
    'libx11: X11 GUI support'
    'libxcursor: X11 cursor support'
    'libxext: X11 extension support'
    'libxi: XInput GUI support'
    'libxinerama: Xinerama multi-monitor GUI support'
    'libxrandr: RandR display configuration support'
    'libxrender: XRender GUI support'
    'libxxf86vm: XF86VidMode GUI support'
)
conflicts=("${pkgname}-bin")

source=("${pkgname}-src::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-src"
    export GOPATH="${srcdir}/gopath"
    go mod download -modcacherw
}

build() {
    cd "${srcdir}/${pkgname}-src"
    export GOPATH="${srcdir}/gopath"
    export CGO_ENABLED=1
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    local _builddate _commit
    _builddate="$(go run ./cmd/buildstamp)"
    _commit="$(git rev-parse --short HEAD)"

    # mirrors upstream's dist/arch/PKGBUILD (RUNE_ENV=prod in cmd/rune/Makefile)
    go build \
        -tags ebitensinglethread \
        -ldflags "-linkmode=external \
            -X unstable.build/rune/internal/debug.Tag=v${pkgver} \
            -X unstable.build/rune/internal/debug.Commit=${_commit} \
            -X unstable.build/rune/internal/debug.BuildDate=${_builddate} \
            -X unstable.build/rune/internal/debug.Package=rune \
            -X unstable.build/rune/internal/debug.OSPackaged=true" \
        -o "${_binaryname}" ./cmd/rune
}

package() {
    cd "${srcdir}/${pkgname}-src"

    # the binary only picks up share/zdot when it lives at .../rune.app/bin/,
    # so the upstream bundle layout is kept intact
    local _appdir="/usr/lib/${pkgname}/${_pkgname}.app"
    install -D -m0755 "${_binaryname}" "${pkgdir}${_appdir}/bin/${_binaryname}"
    for f in .zlogin .zprofile .zshenv .zshrc; do
        install -D -m0644 "extra/osx/Rune.app/Contents/Resources/zdot/$f" "${pkgdir}${_appdir}/share/zdot/$f"
    done

    install -d "${pkgdir}/usr/bin"
    ln -s "${_appdir}/bin/${_binaryname}" "${pkgdir}/usr/bin/${_binaryname}"

    # renamed from upstream's rune.desktop: the unrelated AUR package
    # "rune" (a Loki Entertainment game) already owns that filename
    install -D -m0644 "deploy/rune-linux/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/rune-ide.desktop"
    install -D -m0644 "extra/icon.iconset/icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -D -m0644 "extra/icon.iconset/icon_512x512@2x.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"

    install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
