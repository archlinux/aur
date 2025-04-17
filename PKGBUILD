# Contributor: Henry Malinowski <malinowski.henry at gmail dot com>
# derived from PKGBUILD for zsh-notify and vim-youcompleteme-git

pkgname='zsh-dircolors-solarized-git'
_name="${pkgname%-git}"
pkgver=r27.6f6fafe
pkgrel=1
pkgdesc='Solarized dircolors plugin for zsh'
url='https://github.com/joel-porquet/zsh-dircolors-solarized'
arch=('any')
license=('unknown')
depends=('zsh')
makedepends=('git')
provides=('zsh-dircolors-solarized')
conflicts=('zsh-dircolors-solarized')
install="${_name}.install"
source=(
    "$pkgname::git+${url}.git"
    'git+https://github.com/seebi/dircolors-solarized.git'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    # copy dircolors-solarized git into zsh-dircolors-solarized/dircolors-solarized
    cd "$pkgname"
    git submodule init
    git config submodule.dircolors-solarized.url "$srcdir/dircolors-solarized"
    git -c protocol.file.allow=always submodule update

    # remove uneeded files from dircolors-solarized
    cd dircolors-solarized
    rm -rf "img" "test-directory.tar.bz2" ".git"
}

package() {
    cd "$pkgname"
    install -d "${pkgdir}/usr/share/zsh/plugins/${_name}"
    cp --archive --no-preserve=ownership * "${pkgdir}/usr/share/zsh/plugins/${_name}"
}
