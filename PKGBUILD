# Maintainer: bobpaul <bobpaul@users.noreply.github.com>
# contact me via AUR or archlinux forums
project='pymavlink'
pkgname=python-${project}-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r3057.533161c4
pkgrel=1
pkgdesc="python MAVLink interface and utilities"
arch=('x86_64')
url="https://github.com/ArduPilot/pymavlink/"
license=('LGPL v3')
groups=()
depends=('python-lxml')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "python2-pymavlink" "python2-pymavlink-git")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/mavlink/mavlink/'
        'remove_future.patch')
noextract=()
sha256sums=('SKIP'
            'fd40cd52c581012bd2aca700e54e37d3b14d159f8e6a61c7d2be76f91eb98874')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

prepare() {
    cd "$srcdir/mavlink"
    git submodule init
    git submodule update
    cd "$srcdir/mavlink/${project}"
    git apply < "$srcdir"/remove_future.patch
}

pkgver() {
    cd "$srcdir/mavlink/${project}"

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/mavlink/${project}"
    python setup.py build
}

package() {
    cd "$srcdir/mavlink/${project}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build

    install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname%-git}
}
