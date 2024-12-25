# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_name=ceedling
pkgname="ruby-${_name}"
# need to use a pre-release version due to compatibility with ruby 3.2 and later, see:
# https://github.com/ThrowTheSwitch/Ceedling/issues/782
pkgver=0.31.1.r917.g13d0e3d
pkgrel=1
_stable_ver=0.31.1
_prerel_ver=1.0.0
_commit=13d0e3d3a22b77276409a76b15cb2c4704982277
pkgdesc='Build system for C projects'
arch=('any')
url='https://www.throwtheswitch.org/ceedling/'
license=('MIT')
depends=('ruby' 'ruby-constructor' 'ruby-deep_merge' 'ruby-rake' 'ruby-thor' 'ruby-unicode-display_width')
makedepends=('git' 'ruby-rdoc')
options=('!emptydirs')
source=("git+https://github.com/ThrowTheSwitch/Ceedling.git#commit=${_commit}"
        'ThrowTheSwitch-CException'::'git+https://github.com/ThrowTheSwitch/CException.git'
        'ThrowTheSwitch-Unity'::'git+https://github.com/ThrowTheSwitch/Unity.git'
        'ThrowTheSwitch-CMock'::'git+https://github.com/ThrowTheSwitch/CMock.git'
        'git+https://github.com/ElectronVector/fake_function_framework.git'
        '010-ruby-ceedling-change-version-requirements.patch')
sha256sums=('b4a6d173480cab63aa33117dba1b4c1cf1f52c944dc21b86fedacab6d5e8e577'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'caaa2826cbd0f4511fa4b92676ddab38fd75fc0933e3e29d21270304a8da6059')

prepare() {
    git -C Ceedling submodule init
    git -C Ceedling config --local submodule.vendor/c_exception.url "${srcdir}/ThrowTheSwitch-CException"
    git -C Ceedling config --local submodule.vendor/unity.url "${srcdir}/ThrowTheSwitch-Unity"
    git -C Ceedling config --local submodule.vendor/cmock.url "${srcdir}/ThrowTheSwitch-CMock"
    git -C Ceedling config --local submodule.plugins/fake_function_framework.url "${srcdir}/fake_function_framework"
    git -C Ceedling -c protocol.file.allow='always' submodule update
    
    #sed --in-place --regexp-extended 's|~>|>=|g' "Ceedling/${_name}.gemspec"
    patch -d Ceedling -Np1 -i "${srcdir}/010-ruby-ceedling-change-version-requirements.patch"
}

pkgver() {
    local _revision
    local _shorthash
    _revision="$(git -C Ceedling rev-list --count "v${_stable_ver}..${_prerel_ver}-${_commit:0:7}")"
    _shorthash="$(git -C Ceedling rev-parse --short HEAD)"
    printf '%s.r%s.g%s' "$_stable_ver" "$_revision" "$_shorthash"
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
    "${_name}-${_prerel_ver}.gem"
    
    # remove unrepreducible files
    rm --force --recursive --verbose \
        "tmp_install/${_gemdir}/cache/" \
        "tmp_install/${_gemdir}/gems/${_name}-${_prerel_ver}/vendor/" \
        "tmp_install/${_gemdir}/doc/${_name}-${_prerel_ver}/ri/ext/"
    
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
    ln -s "../../..${_gemdir#/usr}/gems/${_name}-${_prerel_ver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/bin/ceedling.lock"
}
