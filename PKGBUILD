# Maintainer: Filip Parag <filip@parag.rs>

pkgname=bas-celik-bin
pkgver=2.7.3
pkgrel=1
pkgdesc='A program for reading smart-card documents issued by the government of Serbia'
arch=(x86_64)
conflicts=(bas-celik)
provides=()
url="https://github.com/ubavic/bas-celik/"
license=(MIT)
depends=(ccid opensc)
source=("bas_celik-${pkgver}_amd64.tar.xz::https://github.com/ubavic/bas-celik/releases/download/v${pkgver}/bas-celik.linux.amd64.tar.xz")
sha256sums=('061e877f5568d87c4b7f485b180e5a083037ca8832b60734dce94c3e9db25437')

package()
{
    export DESTDIR="${pkgdir}"
    export PREFIX="/usr"
    cd "${srcdir}/bas-celik" || exit 1
    sed -E 's/:= "([^"]+)"/:= \1/g; /^Icon :=/ s/$/.png/' ./Makefile -i
    make install
}

test_pcscd()
{
    if ! systemctl is-active --quiet pcscd.service; then
        echo 'This program requires pcscd service to be running'
    fi
}

post_install()
{
    test_pcscd
}

post_upgrade()
{
    test_pcscd
}
