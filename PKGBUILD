# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=intel-media-sdk-git
pkgver=1.2a.r49.g78bf771
pkgrel=1
pkgdesc='API to access hardware-accelerated video decode, encode and filtering on Intel platforms with integrated graphics (git version)'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=(
    # official repositories:
        'libva'
    # AUR:
        'intel-media-driver-git'
)
makedepends=(
    # official repositories:
        'git' 'perl' 'cmake'
    # AUR:
        'git-lfs'
)
provides=('intel-media-sdk' 'libmfx')
conflicts=('intel-media-sdk' 'libmfx')
source=('intel-media-sdk-detect-intel-opencl.patch')
sha256sums=('689ebc270532c0e1e5132d39898ff2a93fe3483a5a2673aea396a24fc07ad24c')

prepare() {
    # makepkg does not support cloning git-lfs repositories
    if [ -d "$pkgname" ] 
    then
        msg2 "Updating '${pkgname}' git repo..."
        cd "$pkgname"
        git pull origin
    else
        msg2 "Cloning '${pkgname}' git repo..."
        git lfs install
        git clone https://github.com/Intel-Media-SDK/MediaSDK.git "$pkgname"
        cd "$pkgname"
    fi
    
    for _patch in intel-media-sdk-detect-intel-opencl.patch
    do
        printf '%s\n' "Checking patch '${_patch}'"
        if patch -Np1 --dry-run -i "${srcdir}/${_patch}" >/dev/null
        then
            patch -Np1 -i "${srcdir}/${_patch}"
        fi
    done
    
    # change plugins directory
    if ! grep -q '^set(MFX_PLUGINS_DIR[[:space:]]/usr/lib64)$' CMakeLists.txt
    then
        sed -i '20i\\' CMakeLists.txt
        sed -i '21iset(MFX_PLUGINS_DIR /usr/lib64)' CMakeLists.txt
    fi
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/,//'
}

build() {
    cd "$pkgname"
    
    export MFX_HOME="$(pwd)"
    
    perl tools/builder/build_mfx.pl \
                            --no-warn-as-error \
                            --cmake='intel64.make.release' \
                            --prefix='/usr'
                            
    make -C __cmake/intel64.make.release
}

package() {
    cd "$pkgname"
    
    make \
        -C __cmake/intel64.make.release \
        DESTDIR="$pkgdir" \
        install
        
    mv -f "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
    
    mkdir -p "${pkgdir}/usr/"{include/mfx,lib/"$pkgname"}
    
    # includes (add 'mfx' folder for ffmpeg compatibility)
    cd "${pkgdir}/usr/include"
    for _header in *.h
    do
        cd mfx
        ln -sf ../"$_header" "$_header"
        cd ..
    done
    
    # move samples to a better place
    mv -f "${pkgdir}/usr/samples" "${pkgdir}/usr/lib/${pkgname}"
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
