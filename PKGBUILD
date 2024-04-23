# Maintainer: Oleksandr Knyshuk <kigen745 at gmail dot com>

pkgname=villain-c2-git
pkgver=1c9084f
pkgrel=1
pkgdesc="Modern and malleable post-exploitation command and control framework"
arch=('any')
url="https://github.com/t3l3machus/Villain"
license=('CC-BY-NC-ND-4.0')
depends=('python3')
makedepends=('git' 'python-virtualenv')
source=("${pkgname%-git}::git+https://github.com/t3l3machus/Villain.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --long --tags --abbrev=7 --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    # Creating virtualenv with dependencies
    cd "${srcdir}/${pkgname%-git}/"
    virtualenv -p python3 env
    "${srcdir}/${pkgname%-git}/env/bin"/pip3 install -r "${srcdir}/${pkgname%-git}/requirements.txt"

    chmod +x "${srcdir}/${pkgname%-git}/Villain.py"
}

package() {
    # Creating package folder
    install -dm755 "${pkgdir}/opt/${pkgname%-c2-git}/"
    cp -r "${srcdir}/${pkgname%-git}"/{Core/,env/,Villain.py} "${pkgdir}/opt/${pkgname%-c2-git}/"
    chmod -R 0755 "${pkgdir}/opt/${pkgname%-c2-git}/"
    find "${pkgdir}/opt/${pkgname%-c2-git}/" -type f -exec chmod 0644 {} \;

    # Installing executable
    install -dm755 "${pkgdir}/usr/bin/"
    echo -e "#!/bin/sh\ncd /opt/${pkgname%-c2-git}/\n/opt/${pkgname%-c2-git}/env/bin/python3 Villain.py \$@" > "${pkgdir}/usr/bin/villain"
    chmod 0755 "${pkgdir}/usr/bin/villain"

    # Adding license
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
