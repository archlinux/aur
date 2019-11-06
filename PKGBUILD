# Maintainer: Marc Jose <marc@marc-jose.de>

pkgname='python-jenkins-git'
pkgver=r291.1749d4d
pkgrel=1
conflicts=('python-jenkins')
provides=('python-jenkins')
pkgdesc="Python API for managing jobs and nodes in a Jenkins CI instance"
arch=('any')
url="https://opendev.org/jjb/python-jenkins/"
license=('BSD')
depends=('python' 'python-six' 'python-pbr' 'python-requests' 'python-multi_key_dict')
makedepends=('git' 'python-setuptools' 'grep')
source=("${pkgname}::git+https://opendev.org/jjb/python-jenkins/")
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
    
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}