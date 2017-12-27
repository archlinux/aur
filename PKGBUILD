# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=intel-media-sdk-git
pkgver=1.2a.r8.ge2b2f3d
pkgrel=1
pkgdesc='API to access hardware-accelerated video decode, encode and filtering on Intel platforms with integrated graphics (git version)'
arch=('i686' 'x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=(
    # AUR:
        'libva-git' 'intel-media-driver-git'
)
makedepends=(
    # official repositories:
        'git' 'perl' 'cmake'
    # AUR:
        'git-lfs' 'gcc5'
)
provides=('intel-media-sdk' 'libmfx')
conflicts=('intel-media-sdk' 'libmfx' 'libmfx-git')
source=('intel-media-sdk-gcc5-fix.patch'
        'intel-media-sdk-change-gcc-version.patch'
        'intel-media-sdk-detect-intel-opencl.patch'
        'intel-media-sdk-add-runtime-libraries.patch')
sha256sums=('e8687d509fcdefe0b9d01f12c7437425aa12791795046506fb13483dcca924ab'
            '1e87af43f125b37b1ed12f5fd9f87a0260fe05204d12ac29567eeb389284de31'
            '689ebc270532c0e1e5132d39898ff2a93fe3483a5a2673aea396a24fc07ad24c'
            'a4e02e01fbb289503be58006a3ddfdf4a1e4a1e127bcb64c5b539b94c53700cf')

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
    
    for _patch in intel-media-sdk-gcc5-fix.patch \
                  intel-media-sdk-change-gcc-version.patch \
                  intel-media-sdk-detect-intel-opencl.patch \
                  intel-media-sdk-add-runtime-libraries.patch
    do
        if patch -Nsp1 --dry-run -i "${srcdir}/${_patch}" >/dev/null
        then
            patch -Np1 -i "${srcdir}/${_patch}"
        fi
    done
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/,//'
}

build() {
    cd "$pkgname"
    
    export MFX_HOME="$(pwd)"
    
    export CFLAGS="$(  printf '%s' "$CFLAGS"   | sed 's/-fno-plt//')"
    export CXXFLAGS="$(printf '%s' "$CXXFLAGS" | sed 's/-fno-plt//')"
    
    perl tools/builder/build_mfx.pl \
                            --cmake='intel64.make.release' \
                            --prefix='/usr' \
    
    make -C __cmake/intel64.make.release
}

package() {
    cd "$pkgname"
    
    make \
        -C __cmake/intel64.make.release \
        DESTDIR="$pkgdir" \
        install
    
    [ "$CARCH" = 'x86_64' ] && _arch='x64' && _libarch='64'
    [ "$CARCH" = 'i686'   ] && _arch='x86' && _libarch='32'
    
    mkdir -p "${pkgdir}/usr/"{include/mfx,lib/pkgconfig,share/"$pkgname"}
    
    # remove unneeded directory '/usb/lib64' (or '/usr/lib32')
    mv -f  "${pkgdir}/usr/lib${_libarch}"/* "${pkgdir}/usr/lib"
    rm -rf "${pkgdir}/usr/lib${_libarch}"
    
    # move samples to a better place
    mv -f "${pkgdir}/usr/samples" "${pkgdir}/usr/share/${pkgname}"
    
    # bellow are fixes for building ffmpeg
    # (use symlinks to preserve compatibility with binary-only Intel products)
    
    # includes
    cd "${pkgdir}/usr/include"
    for _header in *.h
    do
        cd mfx
        ln -sf ../"$_header" "$_header"
        cd ..
    done
    
    # libraries
    cd "${pkgdir}/usr/lib/lin_${_arch}"
    for _lib in *.a
    do
        cd ..
        ln -sf "lin_${_arch}/$_lib" "$_lib"
        cd "lin_${_arch}"
    done
    
    # pkgconfig files
    cd "${pkgdir}/usr/lib/lin_${_arch}/pkgconfig"
    ln -sf mfx.pc libmfx.pc
    cd "${pkgdir}/usr/lib/pkgconfig"
    ln -sf ../"lin_${_arch}/pkgconfig/mfx.pc"       mfx.pc
    ln -sf ../"lin_${_arch}/pkgconfig/libmfx.pc" libmfx.pc
    
    # plugins
    cd "${pkgdir}/usr/plugins"
    for _plugin in *
    do
        ln -sf ../plugins/"$_plugin" ../lib/"$_plugin"
    done
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
