# Maintainer: Oleksandr Knyshuk <kigen745 at gmail dot com>

pkgname=villain-c2-git
pkgver=1c9084f
pkgrel=2
pkgdesc="Modern and malleable post-exploitation command and control framework"
arch=('any')
url="https://github.com/t3l3machus/Villain"
license=('CC-BY-NC-ND-4.0')
depends=('python')
makedepends=('git' 'python-virtualenv' 'coreutils' 'findutils' 'sed')
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
}

package() {
    # Creating package folder
    cd "${srcdir}/${pkgname%-git}/"
    find -type d -exec install -dm755 "${pkgdir}/opt/${pkgname%-c2-git}/{}" \; \
        -or -path './Core/*' \( -type f -exec install -Dm644 {} "${pkgdir}/opt/${pkgname%-c2-git}/{}" \; \
        -or -type l -exec cp -a {} "${pkgdir}/opt/${pkgname%-c2-git}/{}" \; \)
    install -Dm755 "${srcdir}/${pkgname%-git}/Villain.py" "${pkgdir}/opt/${pkgname%-c2-git}/Villain.py"

    # Installing executable
    echo -e "#!/bin/sh\ncd /opt/${pkgname%-c2-git}/\nenv/bin/python3 Villain.py \$@" > "${srcdir}/villain"
    install -Dm755 "${srcdir}/villain" "${pkgdir}/usr/bin/villain"

    # Adding license
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
