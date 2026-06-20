# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vmaf-git
pkgver=3.2.0.r1.gac9467ff
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (git version)'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('BSD-2-Clause-Patent')
depends=(
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'git'
    'meson'
    'nasm')
checkdepends=(
    'vim')
provides=('vmaf' 'libvmaf-git')
conflicts=('vmaf' 'libvmaf-git')
replaces=('libvmaf-git')
source=('git+https://github.com/Netflix/vmaf.git')
sha256sums=('SKIP')

pkgver() {
    git -C vmaf describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/'
}

build() {
    local _jobs
    local _max_jobs='20'
    
    _jobs="$(nproc)"
    
    # may fail to compile on a high core count system
    # https://github.com/Netflix/vmaf/issues/1541
    if [ "$_jobs" -ge "$_max_jobs" ]
    then
        _jobs="$_max_jobs"
        printf '%s\n' "limiting the compilation jobs to ${_jobs}"
    fi
    
    arch-meson -Denable_avx512='false' vmaf/libvmaf build
    meson compile -C build --jobs "$_jobs"
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 vmaf/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' vmaf/model "${pkgdir}/usr/share"
}
