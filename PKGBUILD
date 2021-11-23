# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=flif
pkgver=0.4
pkgrel=1
pkgdesc='Free Lossless Image Format'
arch=('x86_64')
url='https://github.com/FLIF-hub/FLIF/'
license=('LGPL3' 'Apache' 'custom: CC0 1.0 Universal')
depends=('libpng')
optdepends=(
    # official repositories:
        'gdk-pixbuf2: for gdk-pixbuf loader'
        'imagemagick: for gif2flif tool'
        'sdl2: for viewflif tool'
    # AUR:
        'apng-utils: for apng2flif tool'
)
makedepends=('gdk-pixbuf2' 'sdl2')
source=("https://github.com/FLIF-hub/FLIF/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'LICENSE-CC0-1.0-Universal'
        '010-flif-remove-apt-get-references.patch'
        '020-flif-fix-install.patch'
        '030-flif-use-arch-flags.patch')
sha256sums=('cc98313ef0dbfef65d72bc21f730edf2a97a414f14bd73ad424368ce032fdb7f'
            '9b99bfef33dc330e756e48d28be6c8470ac4fc5c2802bdb20dc9f4929a169abc'
            '4ee963275d0559b470f5869fe6effb76f11517dc98334d12a4d0f150ecd95b65'
            '7b72dec66d1bbb04597c37ac1715378609efc5076af8d3fffe296b3561ab334d'
            'b7118224eedf510b215ba71e5c67744aa6616ac1baa854e09705e859772aff24')

prepare() {
    patch -d "FLIF-${pkgver}" -Np1 -i "${srcdir}/010-flif-remove-apt-get-references.patch"
    patch -d "FLIF-${pkgver}" -Np1 -i "${srcdir}/020-flif-fix-install.patch"
    patch -d "FLIF-${pkgver}" -Np1 -i "${srcdir}/030-flif-use-arch-flags.patch"
}

build() {
    make -C "FLIF-${pkgver}/src" all decoder viewflif pixbufloader test-interface
}

check() {
    cd "FLIF-${pkgver}/src"
    
    local _image
    local -a _images
    mapfile -t -d '' _images < <(find "${srcdir}/FLIF-${pkgver}/testFiles" -type f -print0)
    
    export LD_LIBRARY_PATH="${srcdir}/FLIF-${pkgver}/src"
    
    for _image in "${_images[@]}"
    do
        printf '%s\n' "  -> Testing with image '${_image##*/}'..."
        ./test-interface "$_image"
    done
}

package() {
    make -C "FLIF-${pkgver}/src" PREFIX="${pkgdir}/usr" install{,-dev,-decoder,-viewflif,-pixbufloader}
    install -D -m644 LICENSE-CC0-1.0-Universal -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
