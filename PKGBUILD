# Maintainer: Mokshit Bindal <your-email@example.com>

pkgname=spotify-downloader
pkgver=1.0.4
pkgrel=1
pkgdesc="Download Spotify playlists, albums, and tracks in FLAC/MP3 format from free sources with beautiful terminal UI"
arch=('any')
url="https://github.com/MokshitBindal/Spotify_Downloader"
license=('MIT')
depends=(
    'python'
    'ffmpeg'
    'yt-dlp'
    'python-click'
    'python-dotenv'
    'python-mutagen'
    'python-pydub'
    'python-requests'
    'python-tqdm'
    'python-yaml'
)
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-pip')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MokshitBindal/Spotify_Downloader/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/Spotify_Downloader-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/Spotify_Downloader-${pkgver}"
    
    # Install the wheel
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Bundle redis and spotipy (not available in official Arch repos)
    # Note: We always bundle these to avoid conflicts with user-installed system packages
    # Users who have python-redis or python-spotipy can uninstall our package first
    local site_packages="$pkgdir/usr/lib/python3.13/site-packages"
    pip install --no-deps --target="$site_packages" redis>=5.0.0 spotipy>=2.24.0
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    echo ""
    echo "======================================================================"
    echo "  Spotify Downloader installed successfully!"
    echo "======================================================================"
    echo ""
    echo "  NOTE: This package bundles python-redis and python-spotipy."
    echo "  If you have these installed separately, you may see file conflicts."
    echo "  Solution: sudo pacman -R python-redis && yay -R python-spotipy"
    echo ""
    echo "  First-time setup:"
    echo "    1. Get Spotify API credentials: https://developer.spotify.com/dashboard"
    echo "    2. Edit: ~/.config/spotify-downloader/config.yaml"
    echo ""
    echo "  Without Spotify credentials, you can still download from:"
    echo "    - Internet Archive (free FLAC)"
    echo "    - Jamendo (Creative Commons music)"
    echo "    - YouTube (fallback)"
    echo ""
    echo "  Refresh shell command cache: hash -r"
    echo "======================================================================"
    echo ""
}
