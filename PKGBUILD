# Maintainer: Fabian Bornschein <fabiscafe@mailbox.org>

pkgname=misskey
pkgver=12.107.0
pkgrel=1
pkgdesc="🌎 An interplanetary microblogging platform 🚀 (Experimental)"
url="https://github.com/misskey-dev/misskey"
options=("!strip")
arch=("x86_64")
license=("AGPL3" "MIT")
depends=("nodejs-lts-gallium" "npm" "postgresql" "redis" "yarn")
makedepends=("git" "python")
install="misskey.install"
optdepends=("elasticsearch: search functionality"
            "ffmpeg: something something"
            "nginx: reverse-proxy usage")
_commit="6e7e11e061deba94d3ff21b1391c10785b94f6e5" #tag/12.107.0
source=("git+https://github.com/misskey-dev/misskey.git#commit=${_commit}"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
md5sums=('SKIP'
         'aa0312f32fe331cd7a2e471902dad1f4'
         '9abc87cea2314b95334d4ad3b309e931'
         'a3fe48c606eabebf818106648c0bf0d9'
         'c6f7dc5885f8db2329b3b1e3c2a67ef5')
sha256sums=('SKIP'
            'd860082dbc90b0e7ecadcb1bfeeeb11dae6f24544d4746883e4a2bfafd052284'
            '5cd19f1798eb1852c47c7786021adede99d95ab83feb0802e7b1fba50a308517'
            'a3ff9c1b77920ebbb0df8fb1affe9e8ef54d907bd4d16ed7c6076cbf52726df7'
            'c368b2ed2efbeca0e488f883defb2ccb7ed4661cc6832d2c396176206a794f34')

pkgver() {
    cd "${pkgname}"
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd "${pkgname}"
    
    # Dependency handling
    git submodule update --init
    HOME="${srcdir}/${pkgname}" yarn install
    
    # Example configuration
    ## Change example configuration to reflect
    ## this packages purpose
    _example_file="${srcdir}/${pkgname}/.config/example.yml"
    
    sed -i \
        's|https://example.tld/|https://wiki.archlinux.org/title/Misskey|;
        s|use option 1, uncomment|not use option 1, comment out|;
        s|#port: 3000|port: 3000|;
        s|example-misskey-user|misskey|;
        s|  pass: example-misskey-pass|# pass: misskey|;
        s|#outgoingAddressFamily: ipv4|outgoingAddressFamily: dual|' \
        ${_example_file}
}

build() {
    cd "${pkgname}"
    NODE_ENV=production HOME="${srcdir}/${pkgname}" yarn build
    
    # Cleanup
    find "${srcdir}/${pkgname}" \
        -depth \
        -type d \
        \( -iname '.git' \
        -o -iname '.github' \
        -o -iname '.vscode' \) \
        -execdir rm -rf '{}' \;
    find "${srcdir}/${pkgname}" \
        -type f \
        \( -name '.git' \
        -o -name '.gitattributes' \
        -o -name '.gitignore' \
        -o -name '.gitmodules' \
        -o -name '.docker*' \
        -o -iname 'docker*' \
        -o -name '.editor*' \
        -o -name '.vsls.json' \) \
        -not -name 'docker*.js' \
        -delete
    rm -r "${srcdir}/${pkgname}/cypress"
    rm -r "${srcdir}/${pkgname}/.cache"
    rm -r "${srcdir}/${pkgname}/docs"
    rm -r "${srcdir}/${pkgname}/misskey-assets"
    rm -rf "${srcdir}/${pkgname}/.npm"
    rm -r "${srcdir}/${pkgname}/scripts"
    rm -r "${srcdir}/${pkgname}/.yarn"
}

package() {
    # systemd files
    install -Dm644 ${pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
    install -Dm644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
    
    install -dm755 "${pkgdir}/usr/share/webapps"
    mv "${srcdir}/${pkgname}" "${pkgdir}/usr/share/webapps/"
    
    # config setup
    install -dm755 "${pkgdir}/etc/webapps/${pkgname}"
    mv "${pkgdir}/usr/share/webapps/${pkgname}/.config/example.yml" -t \
        "${pkgdir}/etc/webapps/${pkgname}/"
    rmdir "${pkgdir}/usr/share/webapps/${pkgname}/.config"
    ln -s "/etc/webapps/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/.config"
    
    # cache setup
    ln -s "/var/cache/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/.cache"
    
    # yarn, npm setup
    ln -s "/var/lib/${pkgname}/yarn" "${pkgdir}/usr/share/webapps/${pkgname}/.yarn"
    ln -s "/var/lib/${pkgname}/npm" "${pkgdir}/usr/share/webapps/${pkgname}/.npm"
    
    # files (upload, …)
    ln -s "/var/lib/${pkgname}/files" "${pkgdir}/usr/share/webapps/${pkgname}/files" 
    
    # license
    install -Dm644 "${pkgdir}/usr/share/webapps/${pkgname}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
