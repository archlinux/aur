# Maintainer: Yougraj <yougrajbora.developer@gmail.com>

pkgname=suyoratex-git
pkgver=r6.acd72c7  # Don't worry about changing this, it auto-updates
pkgrel=1
pkgdesc="A frictionless LaTeX Live Editor"
arch=('any')
license=('MIT')
url="https://github.com/Yougraj/SuyoraTex"
depends=(
    'python'
    'python-pyqt6'
    'python-pymupdf'
    'texlive-basic'
    'texlive-latex'
    'texlive-latexextra'
    'texlive-fontsrecommended'
)
makedepends=('git')
provides=('suyoratex')
conflicts=('suyoratex' 'archtex' 'archtex-git')
source=("suyoratex::git+https://github.com/Yougraj/SuyoraTex.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/suyoratex"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/suyoratex"
    
    # 1. Install the main python app
    install -d "$pkgdir/usr/share/suyoratex"
    cp -r * "$pkgdir/usr/share/suyoratex/"
    
    # 2. Create the terminal command
    install -d "$pkgdir/usr/bin"
    cat <<EOF > "$pkgdir/usr/bin/suyoratex"
#!/bin/bash
exec python /usr/share/suyoratex/main.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/suyoratex"

    # 3. Install the .desktop file so it appears in App Menus (GNOME/KDE)
    install -Dm644 suyoratex.desktop "$pkgdir/usr/share/applications/suyoratex.desktop"

    # 4. Install the Logo so the App Menu can find the icon
    install -Dm644 logo.svg "$pkgdir/usr/share/pixmaps/suyoratex.svg"
}
