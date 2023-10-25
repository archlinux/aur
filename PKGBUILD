# Maintainer:  Meow-2 <orzkey@outlook.com>

pkgname=tmux-sixel-git
_gitname=tmux
pkgver=10136_3.3a.r303.gb7777807
pkgrel=1
pkgdesc="A terminal multiplexer(build with sixel)"
url="https://github.com/tmux/tmux/wiki"
arch=('i686' 'x86_64' 'aarch64')
license=('BSD')
depends=('ncurses' 'libevent')
makedepends=('git')
optdepends=('libutempter: Record user sessions to utmp and wtmp files [add to depends array and rebuild to enable]')
provides=('tmux')
conflicts=('tmux')
source=('git+https://github.com/tmux/tmux.git')
md5sums=('SKIP')

pkgver() {
    cd ${_gitname}
    # Upstream reissues tags, which breaks 'describe --long'. Prefix with rev count to compensate.
    printf "%s_%s" \
        $(git rev-list --count HEAD) \
        $(git describe --long) | sed -e 's:\([^-]*-g\):r\1:' -e 's:-:.:g'
}

prepare() {
    cd ${_gitname}
    ./autogen.sh
}

build() {
    cd ${_gitname}
    ./configure --prefix=/usr --enable-sixel
    make
}

package() {
    cd ${_gitname}

    make DESTDIR="${pkgdir}" install

    # install example config file
    install -Dm755 example_tmux.conf "${pkgdir}/usr/share/tmux/example_tmux.conf"
}
