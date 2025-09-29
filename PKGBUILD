# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ideology-git
pkgname=ideology-git
pkgver=r3.4c5f8cd
pkgrel=9
pkgdesc="IDEology is the IDE for the Snow programming language."
arch=($CARCH)
url="https://gitee.com/jcnc-org/IDEology"
license=('Apache-2.0')
groups=(snow-lang snow-lang-git)
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(
    at-spi2-core
    sh
    fontconfig
    gcc-libs
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libepoxy
    pango
)
makedepends=(
    cmake
    git
    ninja
    clang
    llvm
    pkgconf
    # AUR
    fvm
)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=()
_engine_version=3.32.4

pkgver() {
    cd "${srcdir}/${pkgname}/"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^[vV]//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    export FVM_CACHE_PATH="$SRCDEST/fvm-cache"
    export CXX='clang++'
    export CXXFLAGS+=' -Wno-error=nontrivial-memcall'

    cd "${srcdir}/${pkgname}"

    pushd 'linux'
    fvm install "$_engine_version"
    fvm use -f "$_engine_version"

    fvm flutter --disable-analytics

    fvm flutter --no-version-check pub get
    fvm flutter build linux --release
    popd
}

package() {
    install -dm755 ${pkgdir}/usr/share/${pkgname%-git}
    cp -R "${srcdir}"/${pkgname}/build/linux/x64/release/bundle/* ${pkgdir}/usr/share/${pkgname%-git}
    install -Dm644 "${srcdir}"/${pkgname}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}

    local _icon
    for _icon in 192 512; do
        install -Dm0644 "${srcdir}"/${pkgname}/web/icons/Icon-${_icon}.png \
            ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname%-git}.png
    done

    install -Dm755 /dev/stdin ${pkgdir}/usr/bin/${pkgname%-git} <<EOF
#!/usr/bin/env sh

cd /usr/share/${pkgname%-git}

./ideology "\$@"
EOF

    install -Dm0644 /dev/stdin ${pkgdir}/usr/share/applications/org.jcnc.snow.ideology.desktop <<EOF
[Desktop Entry]
Comment="IDEology is the IDE for the Snow programming language."
Comment[zh_CN]="IDEology 是 Snow 编程语言的 IDE"
GenericName="IDEology is the IDE for the Snow programming language."
GenericName[zh_CN]="IDEology 是 Snow 编程语言的 IDE"
Name=IDEology
Name[zh_CN]=IDEology
Exec=${pkgname%-git} %F
StartupNotify=false
Terminal=false
Type=Application
Categories=Development;Tool;IDE;
Icon=${pkgname%-git}.png
EOF

}
