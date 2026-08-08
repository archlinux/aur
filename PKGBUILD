# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det
# Contributor: Joris Steyn, Florian Dejonckheere, Tevin Zhang, Andrea Fagiani, Biru Ionut, Paul Bredbury
# Installation order:  freetype2 → fontconfig-ubuntu → cairo-ubuntu

# nice pages to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
# http://getemoji.com/

pkgname=fontconfig-ubuntu
pkgver=2.17.1
_ubuver=5ubuntu1
_commit=6d0a98982ec351c165c9224c8b7dbdfca3010e47
pkgrel=1
pkgdesc='A library for configuring and customizing font access (with Ubuntu patches)'
arch=('x86_64')
url='https://launchpad.net/ubuntu/+source/fontconfig'
license=('HPND AND Unicode-DFS-2016')
depends=(
    'bash'
    'expat'
    'freetype2'
    'glibc')
makedepends=(
    'docbook-sgml'
    'docbook-utils'
    'gperf'
    'meson'
    'perl-sgmls')
provides=("fontconfig=${pkgver}" 'libfontconfig.so' 'fontconfig-ubuntu-docs' 'fontconfig-docs')
conflicts=('fontconfig' 'fontconfig-ubuntu-docs' 'fontconfig-docs')
replaces=('fontconfig-ubuntu-docs<2.17.1')
options=('!emptydirs')
backup=('etc/fonts/fonts.conf')
install=fontconfig-ubuntu.install
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/fontconfig/${pkgver}-${_ubuver}/fontconfig_${pkgver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/fontconfig/${pkgver}-${_ubuver}/fontconfig_${pkgver}-${_ubuver}.debian.tar.xz"
        'fontconfig-ubuntu.hook'
        '40-fontconfig-config.hook'
        '40-fontconfig-config.script')
sha256sums=('f07504cef87f171ee1748352e2df9b9f125352f620fa0d03a9284306ea2c40a4'
            '0391e1a792af12272a0feee090bdcefea485a4eb25a1225ed93d28548870441b'
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
        patch -d "fontconfig-${pkgver}-${_commit}" -Np1 -i "${srcdir}/debian/patches/${_patch}"
    done < <(sed '/^[[:space:]]*#/d' debian/patches/series)
}

build() {
    arch-meson "fontconfig-${pkgver}-${_commit}" build \
        -Dbitmap-conf='noinstall' \
        -Ddefault-sub-pixel-rendering='noinstall' \
        -Ddoc-html='enabled' \
        -Ddoc-pdf='disabled' \
        -Ddoc-txt='disabled'
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package_fontconfig-ubuntu() {
    meson install -C build --destdir "$pkgdir"
    
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
    install -D -m644 "fontconfig-${pkgver}-${_commit}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
