# Maintainer: gitaarik <gitaarik@posteo.net>
pkgname=doublecmd-gtk2
pkgver=1.1.26
pkgrel=1
pkgdesc="File manager with two panels side by side (GTK version)"
arch=('x86_64' 'i686')
url="https://doublecmd.sourceforge.io/"
license=('GPL2')
depends=('gtk2')
makedepends=('git' 'fpc' 'lazarus' 'dbus' 'glib2' 'libx11' 'gtk2')
optdepends=(
    'p7zip: support for 7zip archives'
    'unrar: support for rar archives'
    'zip: support for zip archives creation'
    'unzip: support for zip archives extraction'
    'cabextract: support for cab archives'
    'squashfs-tools: support for squashfs images'
    'cpio: support for cpio archives'
    'rpm-tools: support for rpm archives'
    'dpkg: support for deb archives'
    'xz: support for xz/lzma archives'
    'bzip2: support for bz2 archives'
    'gzip: support for gz archives'
    'tar: support for tar archives'
    'libmediainfo: support for media file information'
    'imagemagick: speed up thumbnail view'
    'ffmpegthumbnailer: video thumbnails support'
    'gvfs: support for various filesystems'
    'pmount: mount removable devices as normal user'
    'lua: scripting'
)
provides=('doublecmd')
conflicts=('doublecmd' 'doublecmd-qt' 'doublecmd-gtk2-alpha-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/doublecmd/doublecmd/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

pkgver() {
    git ls-remote --tags https://github.com/doublecmd/doublecmd.git | \
        sed 's/.*refs\/tags\///; s/\^{}//' | \
        grep -v -E '(alpha|beta|rc|pre)' | \
        sed 's/^v//' | \
        sort -V | \
        tail -1
}

build() {

    cd "${srcdir}/doublecmd-${pkgver}"

    # Set up Lazarus configuration
    mkdir -p ~/.lazarus

    # Backup existing config if it exists
    local config_file="$HOME/.lazarus/environmentoptions.xml"
    local backup_made=false

    if [ -f "$config_file" ]; then
        cp "$config_file" "$config_file.pkgbuild.backup"
        backup_made=true
    fi

    # Create temporary config for build
    cat > "$config_file" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<CONFIG>
  <EnvironmentOptions>
    <LazarusDirectory Value="/usr/lib/lazarus"/>
  </EnvironmentOptions>
</CONFIG>
EOF

    # Build GTK2 version
    lcl=gtk2 ./build.sh release

    # Restore original config if backup was made
    if [ "$backup_made" = true ]; then
        mv "$config_file.pkgbuild.backup" "$config_file"
    fi

}

package() {

    cd "${srcdir}/doublecmd-${pkgver}"

    # Install binaries
    install -Dm755 doublecmd "${pkgdir}/usr/bin/doublecmd"

    # Install plugins
    install -d "${pkgdir}/usr/lib/doublecmd/plugins"
    find plugins -name "*.wfx" -o -name "*.wcx" -o -name "*.wdx" -o -name "*.wlx" | \
        xargs -I {} install -Dm644 {} "${pkgdir}/usr/lib/doublecmd/{}"

    # Install language files
    install -d "${pkgdir}/usr/share/doublecmd/language"
    find language -name "*.po" | \
        xargs -I {} install -Dm644 {} "${pkgdir}/usr/share/doublecmd/{}"

    # Install pixmaps and icons
    install -d "${pkgdir}/usr/share/doublecmd/pixmaps"
    find pixmaps -name "*.png" -o -name "*.cur" | \
        xargs -I {} install -Dm644 {} "${pkgdir}/usr/share/doublecmd/{}"

    # Install desktop file
    install -Dm644 install/linux/doublecmd.desktop "${pkgdir}/usr/share/applications/doublecmd.desktop"

    # Install documentation
    install -d "${pkgdir}/usr/share/doc/doublecmd"
    cd doc
    find -name "*.txt" | \
        xargs -I {} install -Dm644 {} "${pkgdir}/usr/share/doc/doublecmd/{}"
    cd ..

    # Install man page
    install -Dm644 install/linux/doublecmd.1 "${pkgdir}/usr/share/man/man1/doublecmd.1"

}
