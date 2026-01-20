# Maintainer: Michał Piasecki <mpiasecki720@protonmail.com>
pkgname=rimworld-workshop-downloader
pkgver=0.6.1
pkgrel=2
pkgdesc="A tool to manage Rimworld mod updates from Steam Workshop"
arch=('x86_64')
url="https://github.com/xtul9/rimworld-workshop-downloader"
license=('MIT')
options=('!debug')
depends=(
    'webkit2gtk'
    'gtk3'
    'gdk-pixbuf2'
    'cairo'
    'pango'
    'glib2'
    'glibc'
    'gcc-libs'
    'openssl'
    'curl'
    'libayatana-appindicator'
    'steamcmd'
)
makedepends=('dpkg' 'binutils' 'pacman-contrib' 'curl')

_debfile="Rimworld Workshop Downloader_${pkgver}_amd64.deb"
_debfile_nospace="rimworld-workshop-downloader_${pkgver}_amd64.deb"
_pkgfile="$pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst"

# Check for local DEB and create a symlink without spaces if found
if [ -f "$_debfile" ]; then
    ln -sf "$_debfile" "$_debfile_nospace"
    source=("$_debfile_nospace")
elif [ -f "backend/target/release/bundle/deb/$_debfile" ]; then
    ln -sf "backend/target/release/bundle/deb/$_debfile" "$_debfile_nospace"
    source=("$_debfile_nospace")
else
    source=("$_pkgfile::https://github.com/xtul9/rimworld-workshop-downloader/releases/download/v$pkgver/$_pkgfile")
fi

sha256sums=('SKIP')
noextract=("${source[0]%%::*}")

prepare() {
    if [ -f "$srcdir/$_debfile_nospace" ]; then
        ar x "$srcdir/$_debfile_nospace"
        tar -xf data.tar.gz
        rm -f debian-binary control.tar.*
    elif [ -f "$srcdir/$_pkgfile" ]; then
        bsdtar -xf "$srcdir/$_pkgfile"
    else
        error "No source file found"
        return 1
    fi
}

package() {
    # Copy application files
    cp -r "$srcdir/usr" "$pkgdir/"

    # Strategy: Replace all steamcmd occurrences with symlinks to system steamcmd
    # This ensures the app uses the system-wide steamcmd installation first
    
    # Remove steamcmd binary if it exists in /usr/bin (it's provided by the steamcmd package dependency)
    if [ -f "$pkgdir/usr/bin/steamcmd" ] && [ ! -L "$pkgdir/usr/bin/steamcmd" ]; then
        rm "$pkgdir/usr/bin/steamcmd"
    fi

    # Find and replace ALL steamcmd occurrences (directories and files)
    # Tauri may place external binaries in various locations, and they might be directories or files
    # We need to replace them all with symlinks to /usr/bin/steamcmd
    
    # First, handle directories (these cause "not a directory" error when used as executables)
    find "$pkgdir" -name "steamcmd" -type d 2>/dev/null | while read -r _dir; do
        _parent=$(dirname "$_dir")
        # If directory contains a steamcmd binary, replace just the binary
        if [ -f "$_dir/steamcmd" ] && [ ! -L "$_dir/steamcmd" ]; then
            rm -f "$_dir/steamcmd"
            ln -s /usr/bin/steamcmd "$_dir/steamcmd"
        else
            # Replace entire directory with symlink to system steamcmd
            rm -rf "$_dir"
            mkdir -p "$_parent"
            ln -s /usr/bin/steamcmd "$_dir"
        fi
    done

    # Then, handle regular files (not symlinks)
    find "$pkgdir" -name "steamcmd" -type f ! -type l 2>/dev/null | while read -r _file; do
        rm -f "$_file"
        ln -s /usr/bin/steamcmd "$_file"
    done

    # Handle nested paths like bin/steamcmd/steamcmd
    find "$pkgdir" \( -path "*/bin/steamcmd/steamcmd" -o -path "*/steamcmd/steamcmd" \) 2>/dev/null | while read -r _path; do
        if [ -e "$_path" ]; then
            if [ -d "$_path" ]; then
                rm -rf "$_path"
                mkdir -p "$(dirname "$_path")"
                ln -s /usr/bin/steamcmd "$_path"
            elif [ -f "$_path" ] && [ ! -L "$_path" ]; then
                rm -f "$_path"
                ln -s /usr/bin/steamcmd "$_path"
            fi
        fi
    done

    # Install license if available
    if [ -f "$srcdir/usr/share/licenses/$pkgname/LICENSE" ]; then
        install -Dm644 "$srcdir/usr/share/licenses/$pkgname/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    elif [ -f "$srcdir/usr/share/doc/rimworld-workshop-downloader/copyright" ]; then
        install -Dm644 "$srcdir/usr/share/doc/rimworld-workshop-downloader/copyright" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}