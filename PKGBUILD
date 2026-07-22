# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=kde-service-menu-pdf
pkgver=2.5.1
pkgrel=1
arch=('x86_64')
license=('GPL')
depends=('dolphin' 'kdialog' 'poppler' 'poppler-qt6' 'ghostscript' 'texlive-binextra')
optional=('pdf2djvu')
conflicts=('kde-service-menu-pdf-git')
url="https://github.com/biglinux/kde-service-menu-pdf"
pkgdesc="A powerful and comprehensive KDE Plasma 6 Service Menu for advanced PDF operations directly from Dolphin or Konqueror."
source=("https://github.com/giuseppebenigno/kde-service-menu-pdf/archive/refs/tags/v$pkgver-kde6.tar.gz")
sha256sums=('SKIP')

package() {
    # Default Folder
    _srcdir="${srcdir}/${pkgname}-$pkgver-kde6"
    cd "$_srcdir"
    
    bin_dir="$pkgdir/usr/local/bin"
    base_share_dir="$pkgdir/usr/share"
    
    desktop_dir="$base_share_dir/kio/servicemenus"
    doc_dir="$base_share_dir/doc/$DOC_NAME"

    # Create directories if they do not exist
    install -vdm 755 "$bin_dir" "$desktop_dir" "$doc_dir"

    # Copy binaries (if they exist)
    if [ -d "./bin" ] && [ "$(ls -A ./bin)" ]; then
        echo "Copy binaries"
        install -vm 755 bin/* "$bin_dir/"
    fi

    # Copy service menus
    echo "Copy service menus"
    install -vm 755 servicemenus/* "$desktop_dir/"

    # Copy documentation (maintaining structure)
    echo "Copy documentation"
    (cd doc && find . -type f -exec install -vDm 644 "{}" "$doc_dir/{}" \;)
    install -vm 644 README.md "$doc_dir/README"

    # Update KDE service cache
    if [[ $kde_version -eq 6 ]]; then
        echo "Updating service cache (Plasma 6)"
        kbuildsycoca6 --noincremental >/dev/null 2>&1 || true
    elif [[ $kde_version -eq 5 ]]; then
        echo "Updating service cache (Plasma 5)"
        kbuildsycoca5 --noincremental >/dev/null 2>&1 || true
    fi
    
}
