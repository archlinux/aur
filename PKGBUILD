# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: fixeria <fixeria@osmocom.org>
# Contributor: Ferdinand Bachmann <theferdi265@gmail.com>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: André Klitzing <aklitzing@online.de>
# Contributor: JD Horelick <jdhore1@gmail.com>

pkgname=devscripts
pkgver=2.26.9
pkgrel=1
pkgdesc="Scripts to make the life of a Debian Package maintainer easier"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/devscripts"
license=('GPL-2.0-or-later')
depends=('dpkg' 'wget' 'sed' 'perl' 'debianutils' 'debhelper'
         'perl-file-homedir' 'perl-timedate' 'sensible-utils')
makedepends=(
    'docbook-xsl'
    'bash-completion'
    'help2man'
    'git'
    'perl-file-desktopentry'
    'perl-file-basedir'
    'perl-git-wrapper'
    'perl-libwww'
    'perl-list-compare'
    'perl-parse-debcontrol'
    'perl-pod-parser'
    'perl-timedate'
    'po4a'
    'python-setuptools'
)
optdepends=(
    'debian-keyring: Required for commands interacting with the system / user keyring'
    'perl-file-touch: Required for uscan'
    'perl-file-dirlist: Required for uscan'
    'perl-moo: Required for uscan'
    'perl-ipc-run: Required for uscan'
    'perl-lwp-protocol-https: Required for uscan'
    'quilt: Required for edit-patch'
)
provides=(checkbashisms)
conflicts=(checkbashisms)
options=('!makeflags')
source=(
    "https://salsa.debian.org/debian/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
    fixes.patch
)
sha512sums=('2dffca5cc69f392de285f4e1458fb1b7c5600f05dc68514701ef9a0af702dd2409dbab5d3ed95a0955b02db5477d4bd9ef1043324946b7b0cccb6553cc4c912c'
            '120434ab274065a7a74b3ff30f2831ae1f803efc4d2dd43fce67f03fcd91f391384a9d0c4ab045f6161f063444275ce6bbb15cf494002026361ed818e2332501')

prepare(){
    # Tarballs from salsa.debian.org have consistent structure. Finally!
    cd "${pkgname}-v${pkgver}"

    # Apply our Arch-relevant fixes
    patch -p1 -i "$srcdir/fixes.patch"

    # Ensure the local folder is recognized as a package and used appropriately.
    touch scripts/devscripts/__init__.py
}

build() {
    cd "${pkgname}-v${pkgver}"
    make
}

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="$pkgdir" install

    # Install the script manpages appropriately
    for script_manpage in scripts/*.1
    do
        cp -v $script_manpage "$pkgdir/usr/share/man/man1"
    done

    # Create dch symlink to debchange
    ln -s /usr/bin/debchange "$pkgdir/usr/bin/dch"

    # bts completion is present already in the official package
    rm "$pkgdir/usr/share/bash-completion/completions/bts"
}
