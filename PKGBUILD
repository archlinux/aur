# Maintainer: Sergey Miroshnichenko <serg.zorg@gmail.com>

pkgname=notion-neg-git
pkgver=3612
pkgrel=1
pkgdesc="NotionWM fork with compton, dzen2, rofi, xft fonts support different default cfg"
url="https://github.com/neg-serg/notion"
arch=('i686' 'x86_64')
license=('custom:LGPL')
depends=('glib2' 'gettext' 'lua' 'libxext' 'libsm')
optdepends=('libxrandr: xrandr support'
            'compton: X11 compositing support')
makedepends=('git' 'libxrandr' 'rofi' 'dzen2-xft-xpm-xinerama-git')
provides=('libtu' 'libextl' 'notion')
conflicts=('notion')

source=("notion::git://github.com/neg-serg/notion") 
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/notion"
    git rev-list --count HEAD
}

build() {
    cd "${srcdir}/notion"
    make
}

package() {
    cd "${srcdir}/notion"
    make DESTDIR="${pkgdir}" install

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/notion/LICENSE"
    mkdir -p "${pkgdir}/usr/share/xsessions"
    cat > "${pkgdir}/usr/share/xsessions/notion.desktop" <<EOF
[Desktop Entry]
Name=Notion
Comment=This session logs you into Notion
Exec=notion
TryExec=notion
Icon=
Type=XSession
EOF
    for i in "${srcdir}/notion/example_cfg/"*; do
        cp -rv "${i}" "${pkgdir}/usr/etc/notion"
    done
}
