# Maintainer: Shengyu Zhang <arch at srain.im>

pkgname=srain-dev
pkgver=0.713.2ddb6dc
pkgrel=1
pkgdesc="Modern, beautiful IRC client written in GTK+ 3, develop and debug version"
arch=('i686' 'x86_64')
license=('GPL')
url="https://srain.im"
makedepends=('git' 'make' 'gcc' 'pkg-config' 'gettext' 'imagemagick')
depends=('gtk3' 'python' 'curl' 'libnotify' 'libconfig' 'gdb' 'libsoup')
optdepends=(
    'glib-networking: TLS connection support'
    'python-sphinx: for generating documentation'
    'python-urllib3: avatar and pastebin support'
    'python-requests: avatar and pastebin support'
    )
conflicts=('srain')
provides=('srain')
source=("git+https://github.com/SilverRainZ/srain.git#branch=dev")
sha256sums=('SKIP')
options=('!strip')

_prefix='/usr'

pkgver() {
    cd ${pkgname%-dev}
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd ${pkgname%-dev}

    ./configure --prefix=${_prefix} --config-dir=/etc --enable-debug
    make
    make doc
}

package() {
    cd ${pkgname%-dev}

    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} install-doc
    mv ${pkgdir}${_prefix}/bin/srain{,-dev}

    cat << EOF > ${pkgdir}${_prefix}/bin/srain
#!/bin/sh
gdb ${_prefix}/bin/srain-dev -ex "r \$@" -ex "bt" -ex "q"
EOF

    chmod 755 ${pkgdir}${_prefix}/bin/srain
}
