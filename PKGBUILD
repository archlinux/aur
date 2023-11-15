# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Lenovsky <lenovsky at pm dot me>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: Ben Westover <me at benthetechguy dot net>

pkgname=protonmail-bridge
pkgver=3.6.1
pkgrel=1
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=('x86_64')
url="https://protonmail.com/bridge"
license=('GPL3')
makedepends=('go' 'cmake' 'ninja' 'zip' 'qt6-base' 'git')
depends=('hicolor-icon-theme' 'libsecret' 'libglvnd' 'icu' 'qt6-declarative' 'qt6-svg' 'qt6-wayland')
optdepends=(
    'org.freedesktop.secrets: Applications that support Freedesktop secrets api'
    'gnome-keyring: gnome-keyring support'
    'pass: pass support'
)
conflicts=('protonmail-bridge-bin')
options=('!emptydirs' '!strip')

source=("git+https://github.com/ProtonMail/proton-bridge.git#tag=v${pkgver}"
        "git+https://github.com/microsoft/vcpkg.git"
        "protonmail-bridge.desktop"
        "qt-dir.patch"
        "modern-icu.patch")
sha256sums=('SKIP'
            'SKIP'
            '226bc140ec5c34cfdff42b33058d045446a4006518d2660db932c7f51632b48a'
            '60175b564bdf1f7e3e51933748019e4335054c72f08cdf4c453a00437fdc93a8'
            '3adae43253c1e8a60f0e74df4592de280a1827a914514b46cbe7f36cea6856b2')

prepare() {
    cd proton-bridge
    git submodule init
    git config submodule.submodules/vcpkg.url "$srcdir/vcpkg"
    git -c protocol.file.allow=always submodule update

    cat ../qt-dir.patch | patch -p1
    cat ../modern-icu.patch | patch -p1
}

build(){
    export PATH=$PATH:$(go env GOPATH)/bin/
    cd proton-bridge
    make build
}

package() {
    mkdir -p "${pkgdir}"/opt
    mkdir -p "${pkgdir}"/usr/bin
    cp -r proton-bridge/cmd/Desktop-Bridge/deploy/linux/ "${pkgdir}"/opt/protonmail-bridge
    install -D -m644 "${pkgdir}"/opt/protonmail-bridge/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    install -D -m644 "${pkgdir}"/opt/protonmail-bridge/logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/"${pkgname}".svg
    install -D -m644 "${srcdir}"/protonmail-bridge.desktop -t "${pkgdir}"/usr/share/applications/
    ln -s "/opt/protonmail-bridge/proton-bridge" "$pkgdir/usr/bin/protonmail-bridge"
}
