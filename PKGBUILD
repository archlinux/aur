# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=flif-git
pkgver=0.3.r96.g74ea92b
pkgrel=3
pkgdesc='Free Lossless Image Format (git version)'
arch=('x86_64')
url='https://github.com/FLIF-hub/FLIF/'
license=('LGPL3' 'Apache')
depends=('gcc-libs' 'libpng' 'sdl2' 'gdk-pixbuf2' 'glib2')
makedepends=('git')
optdepends=(
    # official repositories:
        'imagemagick: for gif2flif tool'
    # AUR:
        'apng-utils: for apng2flif tool'
)
provides=('flif')
conflicts=('flif')
source=('git+https://github.com/FLIF-hub/FLIF.git'
        'flif-git-fix-makefile-target-install-pixbufloader.patch'
        'flif-git-remove-apt-get-references-from-tools.patch')
sha256sums=('SKIP'
            '4d166a2f462b6d250202f6adf3b7280871fe98bc5385a851135d2473785d5399'
            'c516d92d4724e319af79bb1ac5d3dde81dac359fd4a02af1ee71239a49d58710')

prepare() {
    cd FLIF
    
    # fix Makefile target install-pixbufloader
    patch -Np1 -i "${srcdir}/flif-git-fix-makefile-target-install-pixbufloader.patch"
    
    # remove apt-get references from installed tools
    patch -Np1 -i "${srcdir}/flif-git-remove-apt-get-references-from-tools.patch"
}

pkgver() {
    cd FLIF
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd FLIF/src
    
    make all decoder viewflif pixbufloader test-interface
    
}

check() {
    cd FLIF/src
    
    local _image
    local -a _images
    mapfile -t -d '' _images < <(find "${srcdir}/FLIF/testFiles" -type f -print0)
    
    export LD_LIBRARY_PATH="${srcdir}/FLIF/src"
    
    for _image in "${_images[@]}"
    do
        printf '%s\n' "  -> Testing with image '${_image##*/}'..."
        ./test-interface "$_image"
    done
}

package() {
    cd FLIF/src
    
    make PREFIX="${pkgdir}/usr" install{,-dev}
    make PREFIX="${pkgdir}/usr" install{-decoder,-viewflif,-pixbufloader}
    
    # mime type for pixbuf loader
    install -D -m644 flif-mime.xml -t "${pkgdir}/usr/share/mime/packages"
}
