# Maintainer: Frantic1048 <archer@frantic1048.com>
# Upstream URL: https://github.com/atom/atom

pkgname=atom-editor-transparent
_pkgverprefix=1.17.0
_pkgverpostfix=beta3
pkgver=$_pkgverprefix.$_pkgverpostfix
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

sha384sums=('fe31f6cad10d2e688189e4ca8ddb90f77cd70ccdae28cc0e866e30512ccf85495c35b299fab92eb9037c21cc1fcc73a3'
            '614d682bdca79ca91d6753eef0fccfe4f5b322688c9d82adcd95e5dd07e33052e703f1fa7335828a4c8af74540966dba'
            'e31e665a85bdc289153350e98b4bbe3ef42aa0e35a5c7d3d14abd0d32ee7bd117effc2d1593a2d118aeac4f4fbfec958')
source=("https://github.com/atom/atom/archive/v${_pkgverprefix}-${_pkgverpostfix}.tar.gz"
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
    cd ${srcdir}/atom-${_pkgverprefix}-${_pkgverpostfix}
    echo "applying atom-transparent.patch"
    patch -p1 < "${srcdir}"/atom-transparent.patch
}

build() {
    cd ${srcdir}/atom-${_pkgverprefix}-${_pkgverpostfix}
    mkdir -p ${srcdir}/install
    ./script/build --install=${srcdir}/install

    cd ${srcdir}/install

    echo "patching atom-beta.destkop..."
    sed -i \
        -e 's/Exec=.*/Exec=env PYTHON=python2 \/usr\/share\/atom-beta\/atom --enable-transparent-visuals --disable-gpu %U/' \
        -e 's/Icon=.*/Icon=atom/' \
        -e '/StartupNotify/ a StartupWMClass=Atom' \
        share/applications/atom-beta.desktop

    echo "applying apm-python2.patch"
    patch -p1 < "${srcdir}"/apm-python2.patch
}

package() {
  cd ${srcdir}/install
  install -d $pkgdir/usr/
  cp -rp bin $pkgdir/usr/
  cp -rp share $pkgdir/usr/
}
