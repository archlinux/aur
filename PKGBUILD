# Maintainer: Dave Wheeler <dwwheeler at gmail dot com>
# Contributor: Batuhan Başerdem <lastname dot firstname at gmail dot com>
# Based on PKGBUILD by bserckx
pkgname=hamsket
pkgver=0.6.3
pkgrel=2
pkgdesc='Free and Open Source app that combines common web apps into one'
arch=('x86_64')
url="https://github.com/TheGoddessInari/hamsket"
license=('GPL3')
depends=('electron')
makedepends=(
    'gendesk'
    'java-runtime=8'
    'desktop-file-utils'
    'ruby2.7'
    'npm'
    'sencha-cmd-6'
    'git')
provides=('hamsket')
conflicts=('hamsket-bin' 'rambox' 'rambox-bin' 'rambox-os' 'ramboxpro-bin')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('cfbfbc41a6c9529e78fca2b7ae6609ec2994fb4885a37ab24875e0353fc39d20')
# For gendesk
_name='Hamsket'
_exec='/usr/bin/hamsket -- %u'
_categories='Network;Utility'

prepare() {
    # Generate desktop file
    gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" \
        --name 'Hamsket' \
        --genericname 'Network tool aggregator' \
        --categories 'Network;Utility' \
        --exec '/usr/bin/hamsket -- %u'

    # Get electron version from pacman, and insert the version to package.json
    _ver="$(pacman -Q electron | cut -d " " -f2 | cut -d "-" -f1)"
    sed --in-place --regexp-extended 's|^(\s+"electron": ")[^"]+(",)|\1'"${_ver}"'\2|' \
        "${srcdir}/${pkgname}-${pkgver}/package.json"

    # This line does nothing
    # sed --in-place --regexp-extended 's|^(\s*)("build":\s*\{$)|\1\2\n\1\t"electronVersion": "'"${_ver}"'",|m' "${srcdir}/${pkgname}-${pkgver}/package.json"

    # Use ruby-2.7 for sencha build command
    sed -i 's:^build.ruby.path=ruby$:&-2.7:' "${srcdir}/${pkgname}-${pkgver}/.sencha/app/defaults.properties"
}

build() {
    # Get JDK 8 version
    if [ ! -z "$(archlinux-java get | grep 8)" ]; then
        _jdk="$(archlinux-java get)"
    else
        _jdk="$(archlinux-java status | grep java | grep 8 |
            sed -e 's/^[[:space:]]*//' | cut -d "/" -f1 | head -n1)"
    fi

    # Build the package
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --cache "${srcdir}/npm-cache"
    # Build with JDK 8
    env PATH="/usr/lib/jvm/${_jdk}/jre/bin/:${PATH}" npm run repack:linux64
}

package() {
    # Create installation directories
    install -d "${pkgdir}/usr/lib"
    install -d "${pkgdir}/usr/bin"
    
    # Copy over installed files
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked" "${pkgdir}/usr/lib/${pkgname}"

    # Install icon to pixmaps
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/Icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Create symlink for binary
    ln -s "/usr/lib/${pkgname}/hamsket" "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop file
    desktop-file-install "${srcdir}/${pkgname}.desktop" --dir "${pkgdir}/usr/share/applications/"
}
