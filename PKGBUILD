# Maintainer: Mokshit Bindal <your-email@example.com>

pkgname=spotify-downloader
pkgver=1.0.3
pkgrel=5
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
sha256sums=('8bb089d755ac84719ec323dcb9992a8d7e15d788e6c64f970116f544f6a6f9ea')

build() {
    cd "${srcdir}/Spotify_Downloader-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/Spotify_Downloader-${pkgver}"
    
    # Install the wheel
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install spotipy and redis to package site-packages (not available in Arch repos)
    # Use --no-deps since their dependencies (requests, urllib3) are already in depends as Arch packages
    local site_packages="$pkgdir/usr/lib/python3.13/site-packages"
    pip install --no-deps --target="$site_packages" redis>=5.0.0 spotipy>=2.24.0
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
