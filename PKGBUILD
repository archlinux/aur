# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

_reponame=refpolicy
_policyname=${_reponame}-arch-git
pkgname=selinux-${_policyname}
pkgver=RELEASE_2_20260312.r2.g3e316c1c5
pkgrel=2
pkgdesc="Modular SELinux reference policy including headers and docs with Arch Linux patches (latest commit)"
arch=('any')
url="https://github.com/SELinuxProject/${_reponame}/wiki"
license=('GPL2')
groups=('selinux')
makedepends=('git' 'python' 'checkpolicy>=3.0' 'semodule-utils')
depends=('policycoreutils>=3.0')
install="${pkgname}.install"
source=("git+https://github.com/SELinuxProject/${_reponame}"
        'refpolicy-add-arch.patch'
        'config')

prepare() {
    cd "${srcdir}/${_reponame}"

    for src in "${source[@]}"; do
    # Add custom patches if needed
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
            '3eca547a91e44ec53b24d4fc081f412f8f5534bb97491c9cb3bb5863713f7ff9'
            '61babf996035dac53f5b74882a506537c2a6b0e3ee4df9dc24ac053bcd641109')
sha384sums=('SKIP'
            'f471011d88599ec12112ee4ce42698c6638cd3eb40b2e3cba2e0745571756f19e7dfe2dd35c91295f928f3daef2ea7af'
            '37d4a9e6b65219ac6f1bd1b286b81faf27e89c6162ffec6d434627a66b229541adf5527e62ae263ca1856682dfd121d7')
sha512sums=('SKIP'
            'b7b6e3cc90c4f2d2e47c96829a6dff8f09081cdf9288dafaa9b6a78e34988ad75d2b5fe633fbf60fc12528900a4728082d180353bea3fff5724672c0dcdff37e'
            'd6d168fdce5eef1fc843559f0883909ecd9b0a625277c3e93c2a4ede9360af830992bb1c66cbfd3f968ecbf54aeba035790017e7711dd91b32ba06582a69d0e8')
b2sums=('SKIP'
        '53b65d4c5909004bfc115cab456e420152a009f0021e871fb5fdda7d0964538ef40cefa53e601cfd8e2702c8f8a94815c2edaa8c2896729f47430185cfc968a1'
        'ccf20940db9665842a7c5f714d56c35710b289aca8f92084d31cc105ffb578e429b279eff0b17943516febde1558a136fe127011f268f9d394e79591de61bf61')
