# Contributor: delor <bartekpiech@gmail com>

pkgname=gitflow-git
pkgver=20130316
pkgrel=1
pkgdesc="Git extensions to provide high-level repository operations for Vincent Driessen's branching model."
arch=('any')
url="http://github.com/nvie/gitflow"
license=('BSD')
depends=('git')

_gitroot="git://github.com/nvie/gitflow.git"
_gitname="gitflow"

build() {
    msg "Connecting to GIT server"

    if [ -d ${srcdir}/$_gitname ] ; then
        cd ${srcdir}/$_gitname && git pull origin || return 1
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname || return 1
    fi

    msg "GIT checkout done or server timeout"

    msg "Getting submodule"

    cd ${srcdir}/${_gitname}
    git submodule init
    git submodule update

    msg "Submodule checkout done or server timeout"
}

package() {
    msg "Starting make"

    cd "${srcdir}/${_gitname}"
    make prefix=/${pkgdir}/usr install

    install -Dm644 "$srcdir/$_gitname/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

