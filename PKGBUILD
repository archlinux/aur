# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det
# Contributor: Joris Steyn, Florian Dejonckheere, Tevin Zhang, Andrea Fagiani, Biru Ionut, Paul Bredbury
# Installation order:  freetype2 → fontconfig-ubuntu → cairo-ubuntu

# nice pages to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
# http://getemoji.com/

# documentation currently fails to build
#pkgbase=fontconfig-ubuntu
#pkgname=('fontconfig-ubuntu' 'fontconfig-ubuntu-docs')
pkgname=fontconfig-ubuntu
pkgver=2.13.1
_ubuver=4.2ubuntu2
pkgrel=2
pkgdesc='A library for configuring and customizing font access (with Ubuntu patches)'
arch=('x86_64')
url='https://launchpad.net/ubuntu/+source/fontconfig'
license=('custom')
makedepends=('autoconf-archive' 'gperf' 'python-lxml' 'python-six' 'docbook-utils' 'docbook-sgml'
             'perl-sgmls' 'texlive-formatsextra>=2017' 'lynx' 'json-c' 'expat' 'freetype2')
checkdepends=('unzip')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/fontconfig_${pkgver}.orig.tar.bz2"
        "https://launchpad.net/ubuntu/+archive/primary/+files/fontconfig_${pkgver}-${_ubuver}.debian.tar.xz"
        'fontconfig-ubuntu.hook')
sha256sums=('f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741'
            'c882c12b8d66d7e1ae7a880ebcc1fe1716e70b3502b5cd7ac88859d7a70eff50'
            '8883f7e6e9d574ed52b89256507a6224507925715ddc85b3dfab9683df2f1e25')

prepare() {
    # apply Ubuntu patches
    local _patch
    while read -r _patch
    do
        printf '%s\n' "  -> Applying Ubuntu patch: ${_patch}"
        patch -d "fontconfig-${pkgver}" -Np1 -i "${srcdir}/debian/patches/${_patch}"
    done < <(sed '/^[[:space:]]*#/d' debian/patches/series)
}

build() {
    cd "fontconfig-${pkgver}"
    ./configure \
        --prefix='/usr' \
        --sysconfdir='/etc' \
        --with-templatedir='/etc/fonts/conf.avail' \
        --localstatedir='/var' \
        --disable-static \
        --with-default-fonts='/usr/share/fonts' \
        --with-add-fonts='/usr/local/share/fonts' \
        --disable-docs
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
    install -D -m644 "${pkgname}.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
    install -D -m644 debian/changelog  -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 "fontconfig-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # split docs
    #[ -d 'docs' ] && rm -rf docs
    #mkdir -p docs/share/man
    #mv "${pkgdir}/usr/share/doc" docs/share
    #mv "${pkgdir}/usr/share/man/man3" docs/share/man
}

#package_fontconfig-ubuntu-docs() {
#    pkgdesc+=' (documentation)'
#    arch=('any')
#    
#    mv docs "${pkgdir}/usr"
#    install -D -m644 "fontconfig-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#}
