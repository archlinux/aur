# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: anuzdhk <95576641+anuzdhk@users.noreply.github.com>

_gitauthor=anuzdhk
_gitname=tuck-filemanager
_appname=${_gitname%-filemanager}
pkgname=${_appname}
pkgdesc="Fast, friendly file manager"

pkgver=0.1.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${pkgname}-bin")

makedepends=('cargo' 'git')
depends=('glibc' 'libgcc' 'glib2' 'gtk4' 'vte4' 'libadwaita' 'gtksourceview5' 'poppler-glib' 'cairo' 'graphene' 'pango' 'libarchive' 'xz' 'hicolor-icon-theme')
optdepends=('gvfs: network locations, Trash on other drives'
            'gvfs-smb: Windows shares'
            'git: git status in folders'
            'flatpak: installing .flatpakref files'
            'unrar: password-protected RAR archives'
            'imagemagick: Image Converter addon'
            'ffmpeg: Video Compressor addon')

options=('!lto' '!debug' '!strip')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('fea279f0a5ebfebcc62d86a735b6fb1cc5dc7dc42b8ccf4f1a0fa36e3c379bd9')


_srcdir() {
    # GitHub names the folder after the repository.
    find "${srcdir}" -mindepth 1 -maxdepth 1 -type d | head -n1
}

prepare() {
    cd "$(_srcdir)"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$(_srcdir)"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p "${_appname}"
}

check() {
    cd "$(_srcdir)"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release -p "${_appname}-core"
}

package() {
    cd "$(_srcdir)"

    ./install.sh --no-build --prefix /usr --destdir "${pkgdir}"

    rm -rf "${pkgdir}/usr/share/${_appname}"
}
