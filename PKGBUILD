# Maintainer: Aloxaf <aloxafx@gmail.com>
pkgname=keyszer-git
pkgver=0.6.0.r76.g8934b81
pkgrel=1
pkgdesc='a smart, flexible keymapper for X11 (a fork/reboot of xkeysnail)'
url='https://github.com/joshgoebel/keyszer'
arch=('any')
license=('GPL3')
depends=(
    'python-evdev'
    'python-xlib'
    'python-inotify-simple'
    'python-appdirs'
    'python-ordered-set'
)
makedepends=(
    'python-setuptools'
    'python-hatchling'
)
source=(
    "${pkgname}::git+https://github.com/joshgoebel/keyszer.git"
    "keymapper.conf"
)
sha256sums=(
    'SKIP'
    '12dd7e2246806b692a54a103912939c4b8df86a046606783465d6404ed48a78c'
)

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -D 'contrib/redhat/90-keymapper-acl.rules' "${pkgdir}/usr/lib/udev/rules.d/90-keymapper-input.rules"
    install -D 'contrib/redhat/keyszer.service' "${pkgdir}/usr/lib/systemd/system/keyszer.service"
    install -D 'contrib/redhat/xhostplus.desktop' "${pkgdir}/etc/xdg/autostart/xhostplus.desktop"
    install -D 'example/config.py' "${pkgdir}/etc/keyszer.conf.example"
    install -D "$srcdir/keymapper.conf" "${pkgdir}/usr/lib/sysusers.d/keymapper.conf"
}
