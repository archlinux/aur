# Maintainer: Eric Schulte <eschulte@grammatech.com>
pkgname=bugzoo-git
pkgver=r1.77d0bd1
pkgrel=1
pkgdesc="Keep your bugs contained. A platform for studying historical software bugs."
arch=('any')
url="https://squareslab.github.io/BugZoo"
license=('MIT')
groups=()
depends=('python' 'docker' 'python-numpy' 'python-flask'
         'python-tabulate' 'python-gitpython' 'python-dockerpty')
makedepends=('git' 'python' 'python-setuptools')
provides=('bugzoo-git')
conflicts=('bugzoo-git')
backup=()
options=()
install=
noextract=()
source=()
md5sums=()

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# This is necessary instead of specifying the git url in the SOURCE
# array because we need to pass the depth flag to git.
prepare() {
    if [ -d bugzoo ];then
        cd bugzoo
        git pull
    else
        git clone https://github.com/squareslab/bugzoo.git --depth 1
    fi
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python3 setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
