# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det
# Contributor: Joris Steyn, Florian Dejonckheere, Tevin Zhang, Andrea Fagiani, Biru Ionut, Paul Bredbury
# Installation order:  freetype2 → fontconfig-ubuntu → cairo-ubuntu

# nice pages to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
# http://getemoji.com/

pkgbase=fontconfig-ubuntu
pkgname=('fontconfig-ubuntu' 'fontconfig-ubuntu-docs')
pkgver=2.13.1
_ubuver=4.4ubuntu1
pkgrel=4
pkgdesc='A library for configuring and customizing font access (with Ubuntu patches)'
arch=('x86_64')
url='https://launchpad.net/ubuntu/+source/fontconfig'
license=('custom')
makedepends=('autoconf-archive' 'gperf' 'python-lxml' 'python-six' 'docbook-utils' 'docbook-sgml'
             'perl-sgmls' 'texlive-formatsextra>=2017' 'lynx' 'json-c' 'expat' 'freetype2')
checkdepends=('unzip')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/fontconfig_${pkgver}.orig.tar.bz2"
        "https://launchpad.net/ubuntu/+archive/primary/+files/fontconfig_${pkgver}-${_ubuver}.debian.tar.xz"
        'fontconfig-ubuntu.hook'
        '40-fontconfig-config.hook'
        '40-fontconfig-config.script')
sha256sums=('f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741'
            '8ce55d192e0b6f5dff1bbf244b2afd7cae332e9d6260963b4a218f217ef40a33'
            'fd7b6ce8ce178107f2e0b52462ebf186b6051c6eec945770107fda57048c9f34'
            '44f12491c9fd7eff825853846a2b3b8df2b96fc6520be5cb31ce7f37a160ff02'
            '7a9d50bccc709eb15db6ba8e13f69bc9d79b0bf354f1d17c1a5b2748edff3c33')

prepare() {
    # apply Ubuntu patches
    local _patch
    while read -r _patch
    do
        [ "$_patch" = '0001-Make-the-cache-filenames-determinstic.patch' ] && continue
        printf '%s\n' "  -> Applying Ubuntu patch: ${_patch}"
        patch -d "fontconfig-${pkgver}" -Np1 -i "${srcdir}/debian/patches/${_patch}"
    done < <(sed '/^[[:space:]]*#/d' debian/patches/series)
}

build() {
    cd "fontconfig-${pkgver}"
    ./configure \
        --prefix='/usr' \
        --sysconfdir='/etc' \
        --with-templatedir='/usr/share/fontconfig/conf.avail' \
        --localstatedir='/var' \
        --disable-static \
        --with-default-fonts='/usr/share/fonts' \
        --with-add-fonts='/usr/local/share/fonts'
    make
}

check() {
    make -C "fontconfig-${pkgver}" -k check
}

package_fontconfig-ubuntu() {
    depends=('expat' 'libfreetype.so')
    provides=("fontconfig=${pkgver}" 'libfontconfig.so')
    conflicts=('fontconfig')
    options=('!emptydirs')
    backup=('etc/fonts/fonts.conf')
    install=fontconfig-ubuntu.install
    
    make -C "fontconfig-${pkgver}" DESTDIR="$pkgdir" install
    
    # handle conf.d using the hook to avoid overwriting the symlinks on upgrade
    local _file
    install -d -m755 "${pkgdir}/usr/share/fontconfig/conf.default"
    for _file in "${pkgdir}/etc/fonts/conf.d"/*.conf
    do
        ln -sr "${pkgdir}/usr/share/fontconfig"/conf.{avail,default}/"${_file##*/}"
        rm "$_file"
    done
    
    install -D -m644 *.hook -t "${pkgdir}/usr/share/libalpm/hooks"
    install -D -m755 40-fontconfig-config.script "${pkgdir}/usr/share/libalpm/scripts/40-fontconfig-config"
    install -D -m644 debian/changelog -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 "fontconfig-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # split docs
    [ -d 'docs' ] && rm -rf docs
    mkdir -p docs/share/man
    mv "${pkgdir}/usr/share/doc" docs/share
    mv "${pkgdir}/usr/share/man/man3" docs/share/man
}

package_fontconfig-ubuntu-docs() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    mv docs "${pkgdir}/usr"
    install -D -m644 "fontconfig-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
