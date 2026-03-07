# Maintainer: Benedick Montales <montales.benedick@gmail.com>
pkgname=vlang-weekly-bin
pkgver=weekly.2026.08
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software (weekly build)'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
depends=('glibc' 'libx11')
optdepends=(
    'glfw: Needed for graphics support'
    'freetype2: Needed for graphics support'
    'openssl: Needed for http support'
)
conflicts=('vlang' 'vlang-bin' 'vlang-git' 'vlang-nightly-bin')
provides=('vlang')
replaces=('vlang-nightly-bin')
install=vlang-weekly-bin.install
source=("vlang-weekly-bin::https://github.com/vlang/v/releases/download/${pkgver}/v_linux.zip")
sha256sums=('9a71226a554a184d7d4dac9898bc5a9a65b496da26ec1ad0d412721b775be789')

pkgver() {
    # Fetch the latest weekly release tag from GitHub API
    local latest
    latest=$(curl -s https://api.github.com/repos/vlang/v/releases | \
        grep -oP '"tag_name":\s*"weekly\.\K[0-9.]+' | head -n1)
    if [[ -n "${latest}" ]]; then
        echo "weekly.${latest}"
    else
        echo "${pkgver}"
    fi
}

prepare() {
    cd "${srcdir}/v"
    # Disable v up to prevent conflicts with package manager
    echo "println('v up is disabled; use your AUR helper to update vlang-weekly-bin instead.')" > 'cmd/tools/vup.v'
}

build() {
    cd "${srcdir}/v"
    # Pre-built binary, just build the tools using gcc instead of tcc
    VFLAGS="-cc gcc" ./v build-tools
}

package() {
    cd "${srcdir}/v"

    # Create directories
    install -d "${pkgdir}/usr/lib/vlang"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/vlang"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install the v compiler
    install -Dm755 v "${pkgdir}/usr/lib/vlang/v"

    # Copy vlib, cmd, thirdparty
    cp -a vlib "${pkgdir}/usr/lib/vlang/"
    cp -a cmd "${pkgdir}/usr/lib/vlang/"
    cp -a thirdparty "${pkgdir}/usr/lib/vlang/"

    # Copy examples to share
    [[ -d examples ]] && cp -a examples "${pkgdir}/usr/share/vlang/"

    # Copy v.mod if exists
    [[ -f v.mod ]] && cp v.mod "${pkgdir}/usr/lib/vlang/"

    # Create symlink
    ln -s /usr/lib/vlang/v "${pkgdir}/usr/bin/v"

    # Disable autorecompilation
    touch "${pkgdir}/usr/lib/vlang/cmd/tools/.disable_autorecompilation"
}
