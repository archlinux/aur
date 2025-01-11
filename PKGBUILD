# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_name=ceedling
pkgname="ruby-${_name}"
pkgver=1.0.0
pkgrel=1
pkgdesc='Build system for C projects'
arch=('any')
url='https://www.throwtheswitch.org/ceedling/'
license=('MIT')
depends=(
    'ruby'
    'ruby-constructor'
    'ruby-deep_merge'
    'ruby-rake'
    'ruby-thor'
    'ruby-unicode-display_width')
makedepends=(
    'git'
    'ruby-rdoc')
options=('!emptydirs')
source=("git+https://github.com/ThrowTheSwitch/Ceedling.git#tag=v${pkgver}"
        'ThrowTheSwitch-CException'::'git+https://github.com/ThrowTheSwitch/CException.git'
        'ThrowTheSwitch-Unity'::'git+https://github.com/ThrowTheSwitch/Unity.git'
        'ThrowTheSwitch-CMock'::'git+https://github.com/ThrowTheSwitch/CMock.git'
        '010-ruby-ceedling-change-version-requirements.patch')
sha256sums=('56dc609983c7b863c0601389b60ff54002e628cc4ee61b2d5c18c016a74eea0e'
            'SKIP'
            'SKIP'
            'SKIP'
            'caaa2826cbd0f4511fa4b92676ddab38fd75fc0933e3e29d21270304a8da6059')

prepare() {
    git -C Ceedling submodule init
    git -C Ceedling config --local submodule.vendor/c_exception.url "${srcdir}/ThrowTheSwitch-CException"
    git -C Ceedling config --local submodule.vendor/unity.url "${srcdir}/ThrowTheSwitch-Unity"
    git -C Ceedling config --local submodule.vendor/cmock.url "${srcdir}/ThrowTheSwitch-CMock"
    git -C Ceedling -c protocol.file.allow='always' submodule update
    
    #sed --in-place --regexp-extended 's|~>|>=|g' "Ceedling/${_name}.gemspec"
    patch -d Ceedling -Np1 -i "${srcdir}/010-ruby-ceedling-change-version-requirements.patch"
}

build() {
    local _gemdir
    _gemdir="$(gem env gemdir)"
    
    cd Ceedling
    
    gem build "${_name}.gemspec"
    
    gem install \
        --local \
        --verbose \
        --ignore-dependencies \
        --build-root "tmp_install" \
    "${_name}-${pkgver}.gem"
    
    # remove unrepreducible files
    rm --force --recursive --verbose \
        "tmp_install/${_gemdir}/cache/" \
        "tmp_install/${_gemdir}/gems/${_name}-${pkgver}/vendor/" \
        "tmp_install/${_gemdir}/doc/${_name}-${pkgver}/ri/ext/"
    
    find "tmp_install/${_gemdir}/gems/" \
        -type f \
        \( \
            -iname '*.o' -o \
            -iname '*.c' -o \
            -iname '*.so' -o \
            -iname '*.time' -o \
            -iname 'gem.build_complete' -o \
            -iname 'Makefile' \
        \) \
        -delete
    
    find "tmp_install/${_gemdir}/extensions/" \
        -type f \
        \( \
            -iname 'mkmf.log' -o \
            -iname 'gem_make.out' \
        \) \
        -delete
}

package() {
    local _gemdir
    _gemdir="$(gem env gemdir)"
    
    cp -dr --no-preserve='ownership' Ceedling/tmp_install/* "$pkgdir"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../..${_gemdir#/usr}/gems/${_name}-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/bin/ceedling.lock"
}
