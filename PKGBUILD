# Maintainer: lsf
# Maintainer: Adam Hose <adis@blad.is>
pkgver=20180913.350_e9c10b9
pkgrel=2
pkgbase=opensnitch-git
_pkgbase=opensnitch
pkgname=("${_pkgbase}-git" "${_pkgbase}-ui-git")
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git' 'go-pie' 'dep' 'libpcap' 'protobuf'
             'libnetfilter_queue' 'protobuf-go'
             'python-setuptools' 'python-pip'
             'python-grpcio' 'python-grpcio-tools'
             'python-pyinotify' 'python-pyqt5'
             'python-unicode-slugify-git')

source=("git://github.com/evilsocket/opensnitch.git"
        'nosudo.patch'
        'pwuid.patch')

md5sums=('SKIP'
         'eb5a6c83c3816220799e678e32572705'
         '03a48a1be821e80a64b7d392cc12db4b')

pkgver() {
        if [[ "$PKGVER" ]]; then
                echo "$PKGVER"
                return
        fi

        cd "$srcdir/$_pkgbase"
        local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
        local count=$(git rev-list --count HEAD)
        local commit=$(git rev-parse --short HEAD)
        echo "$date.${count}_$commit"
}

build() {
        cd "$srcdir/$_pkgbase"

        if [ -L "$srcdir/$_pkgbase" ]; then
                rm "$srcdir/$_pkgbase" -rf
                mv "$srcdir/.go/src/$_pkgbase/" "$srcdir/$_pkgbase"
        fi

        rm -rf "$srcdir/.go/src"
        mkdir -p "$srcdir/.go/src"
        export GOPATH="$srcdir/.go"
        mv "$srcdir/$_pkgbase" "$srcdir/.go/src/"

        cd "$srcdir/.go/src/$_pkgbase/"
        ln -sf "$srcdir/.go/src/$_pkgbase/" "$srcdir/$_pkgbase"

        cd "$GOPATH/src/opensnitch/daemon"
        dep ensure
        cd "$GOPATH/src/opensnitch"
        patch -Np1 -i "${srcdir}/nosudo.patch"
        patch -Np1 -i "${srcdir}/pwuid.patch"
        make
}

package_opensnitch-git() {
        pkgdesc="A GNU/Linux port of the Little Snitch application firewall."
        optdepends=('opensnitch-ui-git')
        depends=('libnetfilter_queue')

        export GOPATH="$srcdir/.go"
        cd "$GOPATH/src/opensnitch"
        mkdir -p "${pkgdir}"/usr/lib/systemd/system
        mkdir -p "${pkgdir}"/usr/bin
        make DESTDIR="$pkgdir/" install
}

package_opensnitch-ui-git() {
        pkgdesc="UI for opensnitch."
        depends=('python-grpcio' 'python-grpcio-tools' 'python-pyinotify'
                 'python-pyqt5' 'python-unicode-slugify-git' 'opensnitch-git'
                 'desktop-file-utils')

        export GOPATH="$srcdir/.go"
        cd "$GOPATH/src/opensnitch/ui"
        pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
