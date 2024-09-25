# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=diamond-editor-git
pkgver=1.5.1.r0.g0882d22
pkgrel=1
pkgdesc='Compact text editor designed for programmers (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('GPL-2.0-only')
depends=('sh' 'copperspice' 'hunspell')
makedepends=('git' 'cmake')
provides=('diamond-editor')
conflicts=('diamond-editor')
source=('git+https://github.com/copperspice/diamond.git'
        '010-diamond-editor-do-not-copy-cs-libs.patch'
        'diamond-editor.desktop'
        'diamond-editor.sh')
sha256sums=('SKIP'
            'a5c13e576e84922dd7508bb65721839be79f0e82c16729f82cb43a915cec0640'
            '1978034fc2878be60254b8b0dca5ed9c7661a60f825375014843b91ec40fc48d'
            '16f8c39d44c7dfcf9784a6b0414af4aa266a67de10e17bffb6fd5ea43a95e48a')

prepare() {
    patch -d diamond -Np1 -i "${srcdir}/010-diamond-editor-do-not-copy-cs-libs.patch"
}

pkgver() {
    git -C diamond describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^diamond\.//'
}

build() {
    cmake -B build -S diamond \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/opt/diamond-editor' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -d -m755 "$pkgdir"{/opt/diamond-editor/{platforms,printerdrivers},/usr/share/pixmaps}
    install -D -m755 diamond-editor.sh "${pkgdir}/usr/bin/diamond-editor"
    install -D -m644 diamond-editor.desktop -t "${pkgdir}/usr/share/applications"
    ln -s ../../../opt/diamond-editor/diamond.png "${pkgdir}/usr/share/pixmaps/diamond-editor.png"
    
    local _dir
    local _file
    while read -r -d '' _file
    do
        if [[ "${_file##*/}" =~ ^CsGui.*\.so$ ]]
        then
            _dir='platforms'
        else
            _dir='printerdrivers'
        fi
        ln -s "../../../usr/lib/${_file##*/}" "${pkgdir}/opt/diamond-editor/${_dir}/${_file##*/}"
    done < <(find -L /usr/lib -maxdepth 1 -type f -regextype posix-extended -regex '.*/Cs(Gui|PrinterDriver).*\.so$' -print0)
}
