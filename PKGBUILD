# Maintainer: ALEXPRO100 <alealexpro100@ya.ru>

pkgname=linux_install-git
_reponame=linux_install
pkgver=v0.5.8.r0.g7f05c8a
pkgrel=1
pkgdesc="Install various distros from Linux to any architecture."
arch=('any')
url="https://github.com/alealexpro100/$_reponame"
license=('GPL3')
depends=('coreutils' 'util-linux' 'bash' 'wget' 'tar' 'zstd')
makedepends=('git')
optdepends=('debootstrap: debian support'
            'qemu-user-static: foreign architectures support'
            'rpmextract: rpm-bootstrap support')
source=("git+https://github.com/alealexpro100/linux_install.git")
md5sums=('SKIP')

pkgver() {
    cd "$_reponame" || exit 1
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    for file in install_sys profile_gen; do
        echo -e "#!/bin/bash\n/usr/lib/$pkgname/$file.sh \"\$@\"" > "${srcdir}/$file"
    done
}

package() {
    cd "$srcdir/$_reponame" || exit 1
    rm -rf "_config.yml" "bin/debootstrap-debian" "custom" "tests" "bin/make_images"
    for file in TODO README.md CHANGES.md lib/distr/README.md auto_configs/README.md; do
        install -Dm644 "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
        rm -rf "$file"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf LICENSE
    install -m644 -d "$pkgdir/usr/share/$pkgname/auto_configs"
    cp -r auto_configs/* "$pkgdir/usr/share/$pkgname/auto_configs"
    rm -rf auto_configs
    install -m755 -d "$pkgdir/usr/lib/$pkgname"
    cp -r ./* "$pkgdir/usr/lib/$pkgname"
    for file in install_sys profile_gen; do
        install -Dm755 "${srcdir}/$file" "$pkgdir/usr/bin/$file"
    done
}

