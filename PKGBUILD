# Maintainer: Fabian Bornschein <fabiscafe@mailbox.org>

pkgname=misskey
pkgver=12.118.1
pkgrel=1
pkgdesc='🌎 An interplanetary microblogging platform 🚀 (Experimental)'
url='https://github.com/misskey-dev/misskey'
arch=('x86_64')
license=('AGPL3' 'MIT')
depends=('nodejs>=18' 'nodejs<=19' 'npm' 'postgresql' 'redis' 'yarn')
makedepends=('git' 'python')
#options=('debug')
install='misskey.install'
optdepends=('elasticsearch: Search functionality'
            'ffmpeg: Media de-encode functionality'
            'nginx: Reverse-proxy usage')
_commit='46ec0303b7e3a20c0762f49b205c901d0a54b9d6' #tag/12.118.1
source=("git+https://github.com/misskey-dev/misskey.git#commit=${_commit}"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.sh"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
md5sums=('SKIP'
         '1477ba0bb17656e9c26663af8daeb95b'
         '9abc87cea2314b95334d4ad3b309e931'
         '3247c7dd69df09a6268528deb82ccd3e'
         'a3fe48c606eabebf818106648c0bf0d9'
         'c6f7dc5885f8db2329b3b1e3c2a67ef5')
sha256sums=('SKIP'
            'bc5faebd8ad9ebebc0ead16989a1803c8ae8ba65001ad32ff9de46e8809525bc'
            '5cd19f1798eb1852c47c7786021adede99d95ab83feb0802e7b1fba50a308517'
            'c566c30c73557f13c756afe5b160e6560d0a24077d6583ab85667e3c7697dc13'
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
        's|example-misskey-user|misskey|;
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
        -o -iname '.vscode' \
        -o -iname 'darwin-arm64' \
        -o -iname 'darwin-x64' \
        -o -iname 'win32-ia32' \
        -o -iname 'win32-x64' \
        -o -iname 'linux-arm' \
        -o -iname 'linux-arm64' \) \
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
        -o -name '.vsls.json' \
        -o -name 'darwin.js' \
        -o -name 'win32.js' \) \
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
    install -Dm644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

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

    # misskey helper script
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # license
    install -Dm644 "${pkgdir}/usr/share/webapps/${pkgname}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
