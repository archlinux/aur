# Maintainer: Marc Jose <marc@marc-jose.de>

pkgname='python-pybadges-git'
pkgver=r49.d2897da
pkgrel=1
conflicts=('python-pybadges')
provides=('python-pybadges')
pkgdesc="A Python library for creating Github-style badges"
arch=('any')
url="https://github.com/google/pybadges"
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools' 'grep')
source=("${pkgname}::git+https://github.com/google/pybadges.git")
md5sums=('SKIP')

pkgver() {
    set -o pipefail
    
    cd "${srcdir}/${pkgname}"
    

    gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")

    if [[ -f "setup.py" ]]; 
    then
        if [[ $(grep --quiet --extended-regexp "version\s*=\s*" setup.py) ]]; 
        then
            printf "%s.%s" "$(grep --extended-regexp "version\s*=\s*" setup.py | awk -F\' '{print $2}')" ${gitversion} | sed 's/-/./g'
        else 
            printf "%s" ${gitversion}
        fi
    else
        printf "%s" ${gitversion}
    fi
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    
    python setup.py install --skip-build -O1 --root="${pkgdir}"
    
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}