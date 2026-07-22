# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=kde-service-menu-pdf-git
pkgver=1
pkgrel=1
arch=('x86_64')
license=('GPL')
depends=('dolphin' 'kdialog' 'poppler' 'poppler-qt6' 'ghostscript' 'texlive-binextra')
optional=('pdf2djvu')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
url="https://github.com/biglinux/${pkgname%-git}"
pkgdesc="A powerful and comprehensive KDE Plasma 6 Service Menu for advanced PDF operations directly from Dolphin or Konqueror."
source=("git+https://github.com/giuseppebenigno/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package() {
    # Default Folder
    _srcdir="${srcdir}/${pkgname%-git}"
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
