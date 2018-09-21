# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# To enable the Instrumentation and Tracing Technology API (ittnotify):
#   - install the package intel-seapi
#   - in build(), change '-DENABLE_ITT:BOOL=' from 'OFF' to 'ON'
#   - and then build intel-media-sdk
# intel-seapi will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgname=intel-media-sdk-git
pkgver=2018.3.pre1.r64.g7557124
pkgrel=2
pkgdesc='API to access hardware-accelerated video decode, encode and filtering on Intel platforms with integrated graphics (git version)'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=(
    # official repositories:
        'gcc-libs' 'libdrm' 'wayland'
    # AUR:
        'libva-git' 'intel-media-driver'
)
makedepends=('git' 'git-lfs' 'cmake' 'libpciaccess' 'libx11' 'libxcb' 'gtest')
provides=('intel-media-sdk' 'libmfx')
conflicts=('intel-media-sdk' 'intel-media-stack-bin' 'intel-media-server-studio')
options=('!emptydirs')
source=('intel-media-sdk-git.conf'
        'intel-media-sdk-git.sh')
sha256sums=('63e76d28140486871a3ffc29ce19c84914583bf243201946c76943bf54df374a'
            'de8c6dd5ac4db49a6d40d94b821bfca4b3480159863b4c1dfa0f21fdd6baeeb0')

prepare() {
    # makepkg does not support cloning git-lfs repositories
    if [ -d "$pkgname" ] 
    then
        msg2 "Updating ${pkgname} git repo..."
        cd "$pkgname"
        git pull origin
    else
        msg2 "Cloning ${pkgname} git repo..."
        git lfs install
        git clone https://github.com/Intel-Media-SDK/MediaSDK.git "$pkgname"
        cd "$pkgname"
    fi
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    local _prefix='intel-mediasdk-'
    git describe --long --tags | sed "s/^${_prefix}//;s/^$(date +%y)/$(date +%Y)/;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build() {
    cd "$pkgname"
    
    mkdir -p build
    cd build
    
    cmake \
        -DBUILD_ALL:BOOL='ON' \
        -DBUILD_DISPATCHER:BOOL='ON' \
        -DBUILD_RUNTIME:BOOL='ON' \
        -DBUILD_SAMPLES:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='ON' \
        -DENABLE_ALL:BOOL='ON' \
        -DENABLE_ITT:BOOL='OFF' \
        -DENABLE_OPENCL:BOOL='ON' \
        -DENABLE_STAT:BOOL='OFF' \
        -DENABLE_TEXTLOG:BOOL='OFF' \
        -DENABLE_WAYLAND:BOOL='ON' \
        -DENABLE_X11_DRI3:BOOL='ON' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}/build"
    
    make DESTDIR="$pkgdir" install
    
    # tools
    cd __bin/release
    install -D -m755 asg-hevc           -t "${pkgdir}/usr/bin"
    install -D -m755 hevc_fei_extractor -t "${pkgdir}/usr/bin"
    
    # ld.so and profile configuration files
    cd "$srcdir"
    install -D -m644 intel-media-sdk-git.conf -t "${pkgdir}/etc/ld.so.conf.d"
    install -D -m755 intel-media-sdk-git.sh   -t "${pkgdir}/etc/profile.d"
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
