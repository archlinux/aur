# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

_reponame=refpolicy
_policyname=${_reponame}-arch-git
pkgname=selinux-${_policyname}
pkgver=RELEASE_2_20260312.r2.g3e316c1c5
pkgrel=1
pkgdesc="Modular SELinux reference policy including headers and docs with Arch Linux patches (latest commit)"
arch=('any')
url="https://github.com/SELinuxProject/${_reponame}/wiki"
license=('GPL2')
groups=('selinux')
makedepends=('git' 'python' 'checkpolicy>=3.0' 'semodule-utils')
depends=('policycoreutils>=3.0')
install="${pkgname}.install"
source=("git+https://github.com/SELinuxProject/${_reponame}"
        '0001-Push-initial-arch-compat-commit.patch'
        'config')

prepare() {
    cd "${srcdir}/${_reponame}"

    for src in "${source[@]}"; do
[1;129A    # Add custom patches if needed
            src="${src%%::*}"
            src="${src##*/}"
            [[ $src = *.patch ]] || continue
            echo "Applying patch $src..."
            git apply -v "../$src"
    done
}

pkgver() {
    cd "${srcdir}/${_reponame}"

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_reponame}"

    # Ensure the environment is clean
    make bare

    # Configure, overriding build.conf values with the ones given on the command line
    make conf NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n

    # This tries to install /etc/selinux/${_reponame}-git/contexts/files/file_contexts.subs_dist
    # due to a bug, so move the build to function package (2024-12-14)
    #make all NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n
}

package() {
    cd "${srcdir}/${_reponame}"

    make all \
        DESTDIR="${pkgdir}" NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n
    make install \
        DESTDIR="${pkgdir}" NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n
    make install-headers \
        DESTDIR="${pkgdir}" NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n
    make install-docs \
        DESTDIR="${pkgdir}" NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n \
        PKGNAME="${_policyname}"

    # Create /var/lib/selinux, which is necessary for loading policy,
    # which is done via install script.
    install -d -m0755 "${pkgdir}/var/lib/selinux"

    # Install main SELinux config file besides /etc/selinux/config.
    # The install script will create a symlink.
    install -m644 -D "${srcdir}/config" "${pkgdir}/etc/selinux/config.${_policyname}"
}
sha256sums=('SKIP'
            '15f0b63af5790cc70b442648f6e30df57f4f91d95c7ca541e0b1bc1f59236020'
            'c9f7cce9a06fd0595b3dd47d4fdde9d9c7457120c42c5f08bfdc5e89eb9a61df')
sha384sums=('SKIP'
            '6a4d84ef069f290831f5b0a394ef844f881059857505377f4046d5c088f16fb786501654ec33329e0444599d2fea3417'
            'd6c75e130f6daea5895e431f0ecd2c407f494f39c78d391b1c352bef171235ec1226b38b6385ada25735b767c4ec31b5')
sha512sums=('SKIP'
            '8fe8aff6b5e0c3b2c1998626762f604a66eb95e0ae7125a7c7796253541448469117b4a4b29be38517f7bd0dc62f5a9face271ce99367f3ceb856c341bf520a0'
            'e7ef71a4bfea54902c6777da64044d82126e12385dfa5be3bce98f5180cea96f79732f88d7a1a4e9d65867a63b9ee49ee94334e2e18cb857956dc87999c5a26b')
b2sums=('SKIP'
        '4a26123f522ae0c953ea35740f7d5f588d46aed0ac502f7c67133f3556cf98d088c69947bc8ea45536e06ea600a3ce4a16265746301fcc98d837eb3563b2ea66'
        '1d74e079522b001756b0d219dcf20b0f1913c83252c9376a25f95920a7c0675b055154c7ccc560eded2ddc4b75d16d83c4af20abcec80977556b6a3d0dbff2cf')
