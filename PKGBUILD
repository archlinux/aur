# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Roman Zimbelmann <romanz@lavabit.com>
# Contributor: nfnty <arch at nfnty dot se>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: XavRan <leandro.espinozar@protonmail.com>

pkgname=ranger-git
pkgver=1.9.3.895.g126d3ee4
pkgrel=1
pkgdesc="A simple, vim-like file manager"
arch=('any')
url="https://ranger.github.io/"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('git' 'python-setuptools')
optdepends=('atool: for previews of archives'
            'file: for determining file types'
            'highlight: for syntax highlighting of code'
            'imagemagick: auto-rotate images and image previews'
            'libcaca: for ASCII-art image previews'
            'mediainfo: for viewing information about media files'
            'perl-image-exiftool: for viewing information about media files'
            'poppler: for pdf previews'
            'python-bidi: for bidi algorithm support'
            'python-chardet: in case of encoding detection problems'
            'python-pillow: image preview with kitty'
            'sudo: to use the "run as root"-feature'
            'transmission-cli: for viewing bittorrent information'
            'ueberzugpp: for image previews (X11/Wayland)'
            'w3m: for previews of images and html pages')
provides=('ranger')
conflicts=('ranger')
source=("${pkgname}::git+https://github.com/ranger/ranger.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --always | sed -e 's|-|.|g' -e '1s|^.||'
}

package() {
    cd "$pkgname"
    python setup.py -q install --root="$pkgdir" --optimize=1

    # Remove files with embedded build paths (reproducible builds)
    find "$pkgdir" -name 'direct_url.json' -delete
    find "$pkgdir" -name '*.pyc' -delete
    find "$pkgdir" -type d -name '__pycache__' -empty -delete

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}
