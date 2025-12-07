# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Ferdinand Bachmann <theferdi265@gmail.com>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: André Klitzing <aklitzing@online.de>
# Contributor: JD Horelick <jdhore1@gmail.com>

pkgname=devscripts
pkgver=2.25.29
pkgrel=1
pkgdesc="Scripts to make the life of a Debian Package maintainer easier"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/devscripts"
license=('GPL2')
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
    "https://deb.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.xz"
    fixes.patch
)
sha256sums=('e52b411ccd2eb0c6617d28f8d8c63986fb8c2555d88bf785353e6d3105a3958d'
            'd6c57a87037b6f15c5130b6f40a909b9dc6f9414be5fd1628a1eddecfba4e4b2')

prepare(){
    # Sometimes there is the version in the tarball, sometimes not.
    # Ensure we always have the proper directory.
    if [ ! -d "${pkgname}-${pkgver}" -a -d "${pkgname}" ]
    then
        ln -s "${pkgname}" "${pkgname}-${pkgver}"
    fi

    # Somehow they now have a "work" folder instead?
    if [ ! -d "${pkgname}-${pkgver}" -a -d work ]
    then
        ln -s work "${pkgname}-${pkgver}"
    fi

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
