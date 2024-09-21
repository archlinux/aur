# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Ferdinand Bachmann <theferdi265@gmail.com>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: André Klitzing <aklitzing@online.de>
# Contributor: JD Horelick <jdhore1@gmail.com>

pkgname=devscripts
pkgver=2.24.1
pkgrel=1
pkgdesc="Scripts to make the life of a Debian Package maintainer easier"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/devscripts"
license=('GPL2')
depends=('dpkg' 'wget' 'sed' 'perl' 'debianutils' 'debhelper'
         'perl-file-homedir' 'perl-timedate' 'sensible-browser' 'sensible-editor')
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
    "https://deb.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.xz"
    fixes.patch
)
sha256sums=('205122cc0bd28cf3521f80fce87a6efdced83e4ff86c647f4ce018444a2ec52a'
            'f8e7ce50c0d008c5d38c94b93c9fc560e5dd2cc8f06eeb2909b0b1784911b768')

prepare(){
    cd "${pkgname}-${pkgver}"
    patch -p1 -i "$srcdir/fixes.patch"

    # Ensure the local folder is recognized as a package and used appropriately.
    touch scripts/devscripts/__init__.py
}

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
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
