# Maintainer: Frantic1048 <archer@frantic1048.com>
# Upstream URL: https://github.com/atom/atom

pkgname=atom-editor-transparent
_atomver=1.18.0
pkgver=1.18.0
pkgrel=1
pkgdesc="Atom is a hackable text editor for the 21st century built on Electron - with transparent background support"
arch=('x86_64')
url="https://github.com/atom/atom"
license=('MIT')
provides=('atom' 'apm')
options=(!strip)
depends=('git' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'python2' 'xdg-utils' 'desktop-file-utils' 'alsa-lib' 'libgnome-keyring' 'libxss')
makedepends=('git' 'nvm')
optdepends=('gvfs: file deletion support')
conflicts=('atom' 'atom-editor' 'atom-editor-bin' 'atom-editor-git' 'atom-editor-git-tagged' 'apm' 'atom-notracking')
install=$pkgname.install

sha384sums=('d0c461eded687bace8ba8913f5b7c7c8a57fb26fbf11937aaf26708eab77d5e5950ebdf379db25a42effc82495452a01'
            '1e027cc6eef1921d0ab08e30c0f44f49e9966503452cf3821782574dd8486bf59fd9170efe051171efb2375635499f7f'
            '7b28df309d5aae71a71edca781537b808c507ca156f6e7c559f6f8482fc450eb3c8c9e15b10ac9570302c652666cbc2f')

source=("https://github.com/atom/atom/archive/v${_atomver}.tar.gz"
        "atom-transparent.patch"
        "apm-python2.patch")

prepare() {
    source /usr/share/nvm/init-nvm.sh
    nvm install v6.10.2
    nvm use v6.10.2

    # force python resolved to python2
    mkdir -p _bin
    ln -sf /usr/bin/python2 _bin/python
    export PATH=$(realpath _bin/):$PATH

    # pre-build patches
    cd ${srcdir}/atom-${_atomver}
    echo "applying atom-transparent.patch"
    patch -p1 < "${srcdir}"/atom-transparent.patch
}
# https://github.com/atom/atom/archive/v1.18.0.tar.gz
build() {
    cd ${srcdir}/atom-${_atomver}
    mkdir -p ${srcdir}/install
    ./script/build --install=${srcdir}/install

    cd ${srcdir}/install

    echo "patching atom.destkop..."
    sed -i \
        -e 's/Exec=.*/Exec=env PYTHON=python2 \/usr\/share\/atom\/atom --enable-transparent-visuals --disable-gpu %U/' \
        -e 's/Icon=.*/Icon=atom/' \
        -e '/StartupNotify/ a StartupWMClass=Atom' \
        share/applications/atom.desktop

    echo "applying apm-python2.patch"
    patch -p1 < "${srcdir}"/apm-python2.patch
}

package() {
  cd ${srcdir}/install
  install -d $pkgdir/usr/
  cp -rp bin $pkgdir/usr/
  cp -rp share $pkgdir/usr/
}
